import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../logistics/domain/entities/flight.dart';
import '../../../logistics/domain/entities/itinerary_item.dart';
import '../../../logistics/domain/entities/lodging.dart';
import '../../../logistics/domain/usecases/flight_usecases.dart';
import '../../../logistics/domain/usecases/itinerary_usecases.dart';
import '../../../logistics/domain/usecases/lodging_usecases.dart';
import '../../domain/entities/booking.dart';
import '../../domain/entities/passenger_draft.dart';
import '../../domain/usecases/assignment_usecases.dart';
import '../../domain/usecases/passenger_usecases.dart';

part 'booking_cubit.freezed.dart';

/// A booking with what is needed to assign it: the trip's flights and
/// lodgings, and the passenger's own itinerary items.
@freezed
abstract class BookingDetails with _$BookingDetails {
  const factory BookingDetails({
    required Booking booking,
    required List<Flight> flights,
    required List<Lodging> lodgings,
    required List<ItineraryItem> activities,
  }) = _BookingDetails;

  const BookingDetails._();

  Flight? flight(String id) => flights.where((f) => f.id == id).firstOrNull;

  Lodging? lodging(String id) => lodgings.where((l) => l.id == id).firstOrNull;

  List<Flight> get unassignedFlights =>
      flights.where((f) => !booking.hasFlight(f.id)).toList();

  List<Lodging> get unassignedLodgings =>
      lodgings.where((l) => !booking.hasLodging(l.id)).toList();
}

@freezed
sealed class BookingState with _$BookingState {
  const factory BookingState.loading() = BookingLoading;

  const factory BookingState.loaded(
    BookingDetails details, {
    @Default(false) bool busy,
    Failure? actionFailure,
  }) = BookingLoaded;

  const factory BookingState.failure(Failure failure) = BookingFailure;

  /// The passenger was removed from the trip; the page closes.
  const factory BookingState.removed() = BookingRemoved;
}

@injectable
class BookingCubit extends Cubit<BookingState> {
  BookingCubit(
    this._getBooking,
    this._getFlights,
    this._getLodgings,
    this._getItinerary,
    this._updatePassenger,
    this._updateBooking,
    this._removeBooking,
    this._saveFlight,
    this._saveLodging,
    this._removeAssignment,
  ) : super(const BookingState.loading());

  final GetBooking _getBooking;
  final GetFlights _getFlights;
  final GetLodgings _getLodgings;
  final GetItinerary _getItinerary;
  final UpdatePassenger _updatePassenger;
  final UpdateBooking _updateBooking;
  final RemoveBooking _removeBooking;
  final SaveFlightAssignment _saveFlight;
  final SaveLodgingAssignment _saveLodging;
  final RemoveAssignment _removeAssignment;

  late String _tripId;
  late String _bookingId;

  Future<void> load({required String tripId, required String bookingId}) async {
    _tripId = tripId;
    _bookingId = bookingId;
    emit(const BookingState.loading());
    final result = await _fetch().run();
    if (isClosed) return;
    emit(result.match(BookingState.failure, BookingState.loaded));
  }

  TaskEither<Failure, BookingDetails> _fetch() => TaskEither.Do(($) async {
    final booking = await $(_getBooking(_bookingId));
    final flights = await $(_getFlights(_tripId));
    final lodgings = await $(_getLodgings(_tripId));
    final itinerary = await $(_getItinerary(_tripId));
    return BookingDetails(
      booking: booking,
      flights: flights,
      lodgings: lodgings,
      activities: [
        for (final item in itinerary)
          if (item.bookingId == booking.id) item,
      ],
    );
  });

  Future<void> updatePassenger(PassengerDraft draft) => _act(
    (details) =>
        _updatePassenger(details.booking.passenger.id, draft).map((_) => unit),
  );

  Future<void> updateBooking({
    required BookingStatus status,
    required String notes,
  }) => _act(
    (details) =>
        _updateBooking(details.booking.id, status: status, notes: notes),
  );

  Future<void> saveFlightAssignment({
    required String flightId,
    String? assignmentId,
    String? seat,
    String? recordLocator,
  }) => _act(
    (details) => _saveFlight(
      bookingId: details.booking.id,
      flightId: flightId,
      assignmentId: assignmentId,
      seat: seat,
      recordLocator: recordLocator,
    ),
  );

  Future<void> saveLodgingAssignment({
    required String lodgingId,
    String? assignmentId,
    String? room,
    String? confirmationNumber,
  }) => _act(
    (details) => _saveLodging(
      bookingId: details.booking.id,
      lodgingId: lodgingId,
      assignmentId: assignmentId,
      room: room,
      confirmationNumber: confirmationNumber,
    ),
  );

  Future<void> removeFlightAssignment(FlightAssignment assignment) =>
      _act((_) => _removeAssignment.flight(assignment));

  Future<void> removeLodgingAssignment(LodgingAssignment assignment) =>
      _act((_) => _removeAssignment.lodging(assignment));

  Future<void> removeFromTrip() async {
    final current = state;
    if (current is! BookingLoaded || current.busy) return;
    emit(current.copyWith(busy: true, actionFailure: null));
    final result = await _removeBooking(current.details.booking.id).run();
    if (isClosed) return;
    emit(
      result.match(
        (failure) => current.copyWith(busy: false, actionFailure: failure),
        (_) => const BookingState.removed(),
      ),
    );
  }

  /// Runs an action and reloads the booking so the page shows saved data.
  Future<void> _act(
    TaskEither<Failure, Unit> Function(BookingDetails details) action,
  ) async {
    final current = state;
    if (current is! BookingLoaded || current.busy) return;
    emit(current.copyWith(busy: true, actionFailure: null));
    final result = await action(current.details).flatMap((_) => _fetch()).run();
    if (isClosed) return;
    emit(
      result.match(
        (failure) => current.copyWith(busy: false, actionFailure: failure),
        BookingState.loaded,
      ),
    );
  }
}
