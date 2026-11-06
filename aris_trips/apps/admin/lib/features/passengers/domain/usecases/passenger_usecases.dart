import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../entities/booking.dart';
import '../entities/passenger.dart';
import '../entities/passenger_draft.dart';
import '../entities/passenger_import.dart';
import '../repositories/passengers_repositories.dart';
import '../services/import_preview_builder.dart';

@injectable
class GetBookings {
  const GetBookings(this._repository);

  final PassengersRepository _repository;

  TaskEither<Failure, List<Booking>> call(String tripId) =>
      _repository.getBookings(tripId);
}

@injectable
class GetBooking {
  const GetBooking(this._repository);

  final PassengersRepository _repository;

  TaskEither<Failure, Booking> call(String bookingId) =>
      _repository.getBooking(bookingId);
}

@injectable
class SearchPassengers {
  const SearchPassengers(this._repository);

  final PassengersRepository _repository;

  /// Fewer than 2 characters returns nothing without a request.
  TaskEither<Failure, List<Passenger>> call(String query) {
    final text = query.trim();
    return text.length < 2
        ? TaskEither.right(const [])
        : _repository.searchPassengers(text);
  }
}

/// Adds one new passenger (or reuses a matching one) to the trip.
@injectable
class AddNewPassenger {
  const AddNewPassenger(this._repository);

  final PassengersRepository _repository;

  TaskEither<Failure, ImportResult> call(String tripId, PassengerDraft draft) {
    final normalized = draft.normalized();
    if (!normalized.isValid) {
      return TaskEither.left(const Failure.invalidInput());
    }
    return _repository.addPassengers(tripId, [normalized]);
  }
}

@injectable
class AddExistingPassenger {
  const AddExistingPassenger(this._repository);

  final PassengersRepository _repository;

  TaskEither<Failure, String> call(String tripId, String passengerId) =>
      _repository.addExistingPassenger(tripId, passengerId);
}

@injectable
class BuildImportPreview {
  const BuildImportPreview();

  ImportPreview call(
    List<List<String>> table, {
    required List<Booking> existing,
  }) => ImportPreviewBuilder.build(table, existing: existing);
}

/// Imports only the valid rows of a preview, all or nothing.
@injectable
class ImportPassengers {
  const ImportPassengers(this._repository);

  final PassengersRepository _repository;

  TaskEither<Failure, ImportResult> call(String tripId, ImportPreview preview) {
    if (!preview.canImport) {
      return TaskEither.left(const Failure.invalidInput());
    }
    return _repository.addPassengers(tripId, [
      for (final row in preview.validRows) row.draft,
    ]);
  }
}

@injectable
class UpdatePassenger {
  const UpdatePassenger(this._repository);

  final PassengersRepository _repository;

  TaskEither<Failure, Passenger> call(
    String passengerId,
    PassengerDraft draft,
  ) {
    final normalized = draft.normalized();
    if (!normalized.isValid) {
      return TaskEither.left(const Failure.invalidInput());
    }
    return _repository.updatePassenger(passengerId, normalized);
  }
}

@injectable
class UpdateBooking {
  const UpdateBooking(this._repository);

  final PassengersRepository _repository;

  TaskEither<Failure, Unit> call(
    String bookingId, {
    required BookingStatus status,
    required String notes,
  }) {
    final text = notes.trim();
    return _repository.updateBooking(
      bookingId,
      status: status,
      notes: text.isEmpty ? null : text,
    );
  }
}

@injectable
class RemoveBooking {
  const RemoveBooking(this._repository);

  final PassengersRepository _repository;

  TaskEither<Failure, Unit> call(String bookingId) =>
      _repository.removeBooking(bookingId);
}
