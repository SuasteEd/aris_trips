import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/supabase_exception_mapper.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/text/person_key.dart';
import '../../domain/entities/booking.dart';
import '../../domain/entities/passenger.dart';
import '../../domain/entities/passenger_draft.dart';
import '../../domain/entities/passenger_import.dart';
import '../../domain/repositories/passengers_repositories.dart';
import '../datasources/passengers_remote_data_source.dart';
import '../models/passenger_models.dart';

TaskEither<Failure, T> _run<T>(Future<T> Function() action) =>
    TaskEither.tryCatch(
      action,
      (error, _) => mapSupabaseException(error, logName: 'passengers'),
    );

@LazySingleton(as: PassengersRepository)
class PassengersRepositoryImpl implements PassengersRepository {
  const PassengersRepositoryImpl(this._remote);

  final PassengersRemoteDataSource _remote;

  @override
  TaskEither<Failure, List<Booking>> getBookings(String tripId) =>
      _run(() async {
        final bookings = [
          for (final row in await _remote.fetchBookings(tripId))
            BookingModel.fromJson(row).toEntity(),
        ];
        // PostgREST cannot order parents by an embedded column.
        bookings.sort((a, b) {
          final byLast = personKey(a.passenger.lastName)
              .compareTo(personKey(b.passenger.lastName));
          return byLast != 0
              ? byLast
              : personKey(a.passenger.firstName)
                    .compareTo(personKey(b.passenger.firstName));
        });
        return bookings;
      });

  @override
  TaskEither<Failure, Booking> getBooking(String bookingId) => _run(
    () async =>
        BookingModel.fromJson(await _remote.fetchBooking(bookingId)).toEntity(),
  );

  @override
  TaskEither<Failure, List<Passenger>> searchPassengers(String query) => _run(
    () async => [
      for (final row in await _remote.searchPassengers(query))
        PassengerModel.fromJson(row).toEntity(),
    ],
  );

  @override
  TaskEither<Failure, ImportResult> addPassengers(
    String tripId,
    List<PassengerDraft> drafts,
  ) => _run(() async {
    final rows = await _remote.importPassengers(tripId, [
      for (final draft in drafts) PassengerModel.draftToJson(draft),
    ]);
    final reused = rows.where((row) => row['reused'] == true).length;
    return ImportResult(created: rows.length - reused, reused: reused);
  });

  @override
  TaskEither<Failure, String> addExistingPassenger(
    String tripId,
    String passengerId,
  ) => _run(() => _remote.insertBooking(tripId, passengerId));

  @override
  TaskEither<Failure, Passenger> updatePassenger(
    String passengerId,
    PassengerDraft draft,
  ) => _run(
    () async => PassengerModel.fromJson(
      await _remote.updatePassenger(
        passengerId,
        PassengerModel.draftToJson(draft),
      ),
    ).toEntity(),
  );

  @override
  TaskEither<Failure, Unit> updateBooking(
    String bookingId, {
    required BookingStatus status,
    required String? notes,
  }) => _run(() async {
    await _remote.updateBooking(bookingId, {
      'status': status.value,
      'notes': notes,
    });
    return unit;
  });

  @override
  TaskEither<Failure, Unit> removeBooking(String bookingId) => _run(() async {
    await _remote.deleteRow('bookings', bookingId);
    return unit;
  });
}

@LazySingleton(as: AssignmentsRepository)
class AssignmentsRepositoryImpl implements AssignmentsRepository {
  const AssignmentsRepositoryImpl(this._remote);

  final PassengersRemoteDataSource _remote;

  static const _flights = 'flight_assignments';
  static const _lodgings = 'lodging_assignments';

  TaskEither<Failure, Unit> _unit(Future<void> Function() action) =>
      _run(() async {
        await action();
        return unit;
      });

  @override
  TaskEither<Failure, Unit> assignFlight({
    required String bookingId,
    required String flightId,
    String? seat,
    String? recordLocator,
  }) => _unit(
    () => _remote.insertRow(_flights, {
      'booking_id': bookingId,
      'flight_id': flightId,
      'seat': seat,
      'record_locator': recordLocator,
    }),
  );

  @override
  TaskEither<Failure, Unit> updateFlightAssignment(
    String assignmentId, {
    String? seat,
    String? recordLocator,
  }) => _unit(
    () => _remote.updateRow(_flights, assignmentId, {
      'seat': seat,
      'record_locator': recordLocator,
    }),
  );

  @override
  TaskEither<Failure, Unit> removeFlightAssignment(String assignmentId) =>
      _unit(() => _remote.deleteRow(_flights, assignmentId));

  @override
  TaskEither<Failure, Unit> assignLodging({
    required String bookingId,
    required String lodgingId,
    String? room,
    String? confirmationNumber,
  }) => _unit(
    () => _remote.insertRow(_lodgings, {
      'booking_id': bookingId,
      'lodging_id': lodgingId,
      'room': room,
      'confirmation_number': confirmationNumber,
    }),
  );

  @override
  TaskEither<Failure, Unit> updateLodgingAssignment(
    String assignmentId, {
    String? room,
    String? confirmationNumber,
  }) => _unit(
    () => _remote.updateRow(_lodgings, assignmentId, {
      'room': room,
      'confirmation_number': confirmationNumber,
    }),
  );

  @override
  TaskEither<Failure, Unit> removeLodgingAssignment(String assignmentId) =>
      _unit(() => _remote.deleteRow(_lodgings, assignmentId));

  @override
  TaskEither<Failure, int> bulkAssignFlight(
    String flightId,
    List<String> bookingIds,
  ) => _run(
    () => _remote.insertMissing(_flights, 'booking_id,flight_id', [
      for (final id in bookingIds) {'booking_id': id, 'flight_id': flightId},
    ]),
  );

  @override
  TaskEither<Failure, int> bulkAssignLodging(
    String lodgingId,
    List<String> bookingIds,
  ) => _run(
    () => _remote.insertMissing(_lodgings, 'booking_id,lodging_id', [
      for (final id in bookingIds) {'booking_id': id, 'lodging_id': lodgingId},
    ]),
  );
}
