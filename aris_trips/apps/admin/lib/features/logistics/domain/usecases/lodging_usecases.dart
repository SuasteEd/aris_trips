import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../entities/lodging.dart';
import '../entities/lodging_draft.dart';
import '../repositories/logistics_repositories.dart';

@injectable
class GetLodgings {
  const GetLodgings(this._repository);

  final LodgingsRepository _repository;

  TaskEither<Failure, List<Lodging>> call(String tripId) =>
      _repository.getLodgings(tripId);
}

/// Creates when [id] is null, otherwise updates.
@injectable
class SaveLodging {
  const SaveLodging(this._repository);

  final LodgingsRepository _repository;

  TaskEither<Failure, Lodging> call({
    required String tripId,
    required LodgingDraft draft,
    String? id,
  }) {
    final normalized = draft.normalized();
    if (!normalized.isValid) {
      return TaskEither.left(const Failure.invalidInput());
    }
    return id == null
        ? _repository.createLodging(tripId, normalized)
        : _repository.updateLodging(id, normalized);
  }
}

@injectable
class DeleteLodging {
  const DeleteLodging(this._repository);

  final LodgingsRepository _repository;

  TaskEither<Failure, Unit> call(String id) => _repository.deleteLodging(id);
}
