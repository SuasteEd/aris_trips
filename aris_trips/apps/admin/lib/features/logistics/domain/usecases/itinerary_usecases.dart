import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../entities/itinerary_item.dart';
import '../entities/itinerary_draft.dart';
import '../repositories/logistics_repositories.dart';

@injectable
class GetItinerary {
  const GetItinerary(this._repository);

  final ItineraryRepository _repository;

  TaskEither<Failure, List<ItineraryItem>> call(String tripId) =>
      _repository.getItinerary(tripId);
}

/// Creates when [id] is null, otherwise updates.
@injectable
class SaveItineraryItem {
  const SaveItineraryItem(this._repository);

  final ItineraryRepository _repository;

  TaskEither<Failure, ItineraryItem> call({
    required String tripId,
    required ItineraryDraft draft,
    String? id,
  }) {
    final normalized = draft.normalized();
    if (!normalized.isValid) {
      return TaskEither.left(const Failure.invalidInput());
    }
    return id == null
        ? _repository.createItem(tripId, normalized)
        : _repository.updateItem(id, normalized);
  }
}

@injectable
class DeleteItineraryItem {
  const DeleteItineraryItem(this._repository);

  final ItineraryRepository _repository;

  TaskEither<Failure, Unit> call(String id) => _repository.deleteItem(id);
}
