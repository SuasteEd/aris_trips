import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../entities/flight.dart';
import '../entities/flight_draft.dart';
import '../repositories/logistics_repositories.dart';

@injectable
class GetFlights {
  const GetFlights(this._repository);

  final FlightsRepository _repository;

  TaskEither<Failure, List<Flight>> call(String tripId) =>
      _repository.getFlights(tripId);
}

/// Creates when [id] is null, otherwise updates.
@injectable
class SaveFlight {
  const SaveFlight(this._repository);

  final FlightsRepository _repository;

  TaskEither<Failure, Flight> call({
    required String tripId,
    required FlightDraft draft,
    String? id,
  }) {
    final normalized = draft.normalized();
    if (!normalized.isValid) {
      return TaskEither.left(const Failure.invalidInput());
    }
    return id == null
        ? _repository.createFlight(tripId, normalized)
        : _repository.updateFlight(id, normalized);
  }
}

@injectable
class DeleteFlight {
  const DeleteFlight(this._repository);

  final FlightsRepository _repository;

  TaskEither<Failure, Unit> call(String id) => _repository.deleteFlight(id);
}
