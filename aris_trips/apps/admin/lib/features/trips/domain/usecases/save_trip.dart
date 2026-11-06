import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../entities/trip.dart';
import '../entities/trip_draft.dart';
import '../repositories/trips_repository.dart';

/// Creates a trip when [id] is null, otherwise updates it.
@injectable
class SaveTrip {
  const SaveTrip(this._repository);

  final TripsRepository _repository;

  TaskEither<Failure, Trip> call(TripDraft draft, {String? id}) {
    final normalized = draft.normalized();
    if (!normalized.isValid) {
      return TaskEither.left(const Failure.invalidInput());
    }
    return id == null
        ? _repository.createTrip(normalized)
        : _repository.updateTrip(id, normalized);
  }
}
