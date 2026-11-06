import 'package:aris_admin/core/error/failure.dart';
import 'package:aris_admin/features/passengers/data/models/passenger_models.dart';
import 'package:aris_admin/features/passengers/data/repositories/passengers_repositories_impl.dart';
import 'package:aris_admin/features/passengers/domain/entities/booking.dart';
import 'package:aris_admin/features/passengers/domain/entities/passenger_draft.dart';
import 'package:aris_admin/features/passengers/domain/entities/passenger_import.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../helpers/logistics_fakes.dart';
import '../../../helpers/passengers_fakes.dart';

Map<String, dynamic> bookingRow(String id, String first, String last) => {
  'id': id,
  'trip_id': tripId,
  'status': 'confirmed',
  'notes': null,
  'passenger': {
    'id': 'p-$id',
    'first_name': first,
    'last_name': last,
    'email': null,
    'phone': null,
  },
  'flight_assignments': [
    {
      'id': 'fa-$id',
      'booking_id': id,
      'flight_id': 'f1',
      'seat': '12A',
      'record_locator': null,
    },
  ],
  'lodging_assignments': <Map<String, dynamic>>[],
};

void main() {
  setUpAll(registerPassengersFallbacks);

  group('models', () {
    test('booking row with embedded passenger and assignments', () {
      final booking = BookingModel.fromJson(bookingRow('b1', 'Ana', 'López'))
          .toEntity();
      expect(booking.passenger.fullName, 'Ana López');
      expect(booking.status, BookingStatus.confirmed);
      expect(booking.flightAssignments.single.seat, '12A');
      expect(booking.lodgingAssignments, isEmpty);
    });

    test('never selects access hashes', () {
      expect(BookingModel.columns, isNot(contains('hash')));
      expect(BookingModel.columns, isNot(contains('access_')));
    });

    test('passenger payload stores blanks as null', () {
      expect(
        PassengerModel.draftToJson(
          const PassengerDraft(firstName: 'Ana', lastName: 'López'),
        ),
        {
          'first_name': 'Ana',
          'last_name': 'López',
          'email': null,
          'phone': null,
        },
      );
    });
  });

  group('PassengersRepositoryImpl', () {
    late MockPassengersRemoteDataSource remote;
    late PassengersRepositoryImpl repository;

    setUp(() {
      remote = MockPassengersRemoteDataSource();
      repository = PassengersRepositoryImpl(remote);
    });

    test(
      'bookings are sorted by last and first name, ignoring accents',
      () async {
        when(() => remote.fetchBookings(any())).thenAnswer(
          (_) async => [
            bookingRow('b1', 'Luis', 'Martínez'),
            bookingRow('b2', 'Ana', 'Álvarez'),
            bookingRow('b3', 'Bea', 'Alvarez'),
          ],
        );

        final result = await repository.getBookings(tripId).run();

        expect(result.getOrElse((_) => []).map((b) => b.passenger.firstName), [
          'Ana',
          'Bea',
          'Luis',
        ]);
      },
    );

    test('addPassengers counts reused passengers', () async {
      when(() => remote.importPassengers(any(), any())).thenAnswer(
        (_) async => [
          {'row_index': 1, 'reused': true},
          {'row_index': 2, 'reused': false},
          {'row_index': 3, 'reused': false},
        ],
      );

      final result = await repository.addPassengers(tripId, const [
        PassengerDraft(firstName: 'A', lastName: 'B'),
      ]).run();

      expect(
        result,
        right<Failure, ImportResult>(const ImportResult(created: 2, reused: 1)),
      );
    });

    test('adding a passenger already on the trip is a conflict', () async {
      when(() => remote.insertBooking(any(), any())).thenThrow(
        const PostgrestException(message: 'duplicate', code: '23505'),
      );

      final result = await repository.addExistingPassenger(tripId, 'p1').run();

      expect(result, left<Failure, String>(const Failure.conflict()));
    });
  });

  group('AssignmentsRepositoryImpl', () {
    late MockPassengersRemoteDataSource remote;
    late AssignmentsRepositoryImpl repository;

    setUp(() {
      remote = MockPassengersRemoteDataSource();
      repository = AssignmentsRepositoryImpl(remote);
    });

    test('bulk assign inserts missing pairs only', () async {
      when(() => remote.insertMissing(any(), any(), any()))
          .thenAnswer((_) async => 2);

      final result = await repository.bulkAssignLodging('l1', [
        'b1',
        'b2',
      ]).run();

      expect(result, right<Failure, int>(2));
      verify(
        () => remote.insertMissing(
          'lodging_assignments',
          'booking_id,lodging_id',
          [
            {'booking_id': 'b1', 'lodging_id': 'l1'},
            {'booking_id': 'b2', 'lodging_id': 'l1'},
          ],
        ),
      ).called(1);
    });

    test('a flight from another trip is rejected by the database', () async {
      when(() => remote.insertRow(any(), any())).thenThrow(
        const PostgrestException(message: 'other trip', code: '23514'),
      );

      final result = await repository
          .assignFlight(bookingId: 'b1', flightId: 'fX')
          .run();

      expect(
        result,
        left<Failure, Unit>(
          const Failure.server(message: 'other trip', code: '23514'),
        ),
      );
    });
  });
}
