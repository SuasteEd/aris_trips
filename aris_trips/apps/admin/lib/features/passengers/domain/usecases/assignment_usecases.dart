import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../entities/booking.dart';
import '../repositories/passengers_repositories.dart';

String? _blankToNull(String? value) {
  final text = value?.trim() ?? '';
  return text.isEmpty ? null : text;
}

/// Assigns a flight to a booking, or updates seat and locator when
/// [assignmentId] is given.
@injectable
class SaveFlightAssignment {
  const SaveFlightAssignment(this._repository);

  final AssignmentsRepository _repository;

  TaskEither<Failure, Unit> call({
    required String bookingId,
    required String flightId,
    String? assignmentId,
    String? seat,
    String? recordLocator,
  }) {
    final cleanSeat = _blankToNull(seat)?.toUpperCase();
    final cleanLocator = _blankToNull(recordLocator)?.toUpperCase();
    return assignmentId == null
        ? _repository.assignFlight(
            bookingId: bookingId,
            flightId: flightId,
            seat: cleanSeat,
            recordLocator: cleanLocator,
          )
        : _repository.updateFlightAssignment(
            assignmentId,
            seat: cleanSeat,
            recordLocator: cleanLocator,
          );
  }
}

@injectable
class SaveLodgingAssignment {
  const SaveLodgingAssignment(this._repository);

  final AssignmentsRepository _repository;

  TaskEither<Failure, Unit> call({
    required String bookingId,
    required String lodgingId,
    String? assignmentId,
    String? room,
    String? confirmationNumber,
  }) {
    final cleanRoom = _blankToNull(room);
    final cleanNumber = _blankToNull(confirmationNumber);
    return assignmentId == null
        ? _repository.assignLodging(
            bookingId: bookingId,
            lodgingId: lodgingId,
            room: cleanRoom,
            confirmationNumber: cleanNumber,
          )
        : _repository.updateLodgingAssignment(
            assignmentId,
            room: cleanRoom,
            confirmationNumber: cleanNumber,
          );
  }
}

@injectable
class RemoveAssignment {
  const RemoveAssignment(this._repository);

  final AssignmentsRepository _repository;

  TaskEither<Failure, Unit> flight(FlightAssignment assignment) =>
      _repository.removeFlightAssignment(assignment.id);

  TaskEither<Failure, Unit> lodging(LodgingAssignment assignment) =>
      _repository.removeLodgingAssignment(assignment.id);
}

enum BulkTarget { flight, lodging }

/// Assigns one flight or lodging to many bookings, skipping those that
/// already have it.
@injectable
class BulkAssign {
  const BulkAssign(this._repository);

  final AssignmentsRepository _repository;

  TaskEither<Failure, int> call({
    required BulkTarget target,
    required String targetId,
    required List<Booking> bookings,
  }) {
    final pending = [
      for (final booking in bookings)
        if (!(target == BulkTarget.flight
            ? booking.hasFlight(targetId)
            : booking.hasLodging(targetId)))
          booking.id,
    ];
    if (pending.isEmpty) return TaskEither.right(0);
    return target == BulkTarget.flight
        ? _repository.bulkAssignFlight(targetId, pending)
        : _repository.bulkAssignLodging(targetId, pending);
  }
}
