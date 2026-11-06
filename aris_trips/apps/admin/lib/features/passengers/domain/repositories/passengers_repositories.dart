import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/booking.dart';
import '../entities/passenger.dart';
import '../entities/passenger_draft.dart';
import '../entities/passenger_import.dart';

abstract interface class PassengersRepository {
  /// Bookings of a trip with their passenger and assignments, by name.
  TaskEither<Failure, List<Booking>> getBookings(String tripId);

  TaskEither<Failure, Booking> getBooking(String bookingId);

  /// Passengers from any trip, by name or email (at most 20).
  TaskEither<Failure, List<Passenger>> searchPassengers(String query);

  /// Creates (or reuses, by email and name) passengers and books them on
  /// the trip in one transaction. Drafts must be valid and normalized.
  TaskEither<Failure, ImportResult> addPassengers(
    String tripId,
    List<PassengerDraft> drafts,
  );

  /// Books an existing passenger on the trip. Returns the booking id.
  TaskEither<Failure, String> addExistingPassenger(
    String tripId,
    String passengerId,
  );

  TaskEither<Failure, Passenger> updatePassenger(
    String passengerId,
    PassengerDraft draft,
  );

  TaskEither<Failure, Unit> updateBooking(
    String bookingId, {
    required BookingStatus status,
    required String? notes,
  });

  /// Removes the passenger from the trip (assignments go too). The
  /// passenger record stays for other trips.
  TaskEither<Failure, Unit> removeBooking(String bookingId);
}

abstract interface class AssignmentsRepository {
  TaskEither<Failure, Unit> assignFlight({
    required String bookingId,
    required String flightId,
    String? seat,
    String? recordLocator,
  });

  TaskEither<Failure, Unit> updateFlightAssignment(
    String assignmentId, {
    String? seat,
    String? recordLocator,
  });

  TaskEither<Failure, Unit> removeFlightAssignment(String assignmentId);

  TaskEither<Failure, Unit> assignLodging({
    required String bookingId,
    required String lodgingId,
    String? room,
    String? confirmationNumber,
  });

  TaskEither<Failure, Unit> updateLodgingAssignment(
    String assignmentId, {
    String? room,
    String? confirmationNumber,
  });

  TaskEither<Failure, Unit> removeLodgingAssignment(String assignmentId);

  /// Assigns to every booking that does not have it yet. Returns how many
  /// were added.
  TaskEither<Failure, int> bulkAssignFlight(
    String flightId,
    List<String> bookingIds,
  );

  TaskEither<Failure, int> bulkAssignLodging(
    String lodgingId,
    List<String> bookingIds,
  );
}
