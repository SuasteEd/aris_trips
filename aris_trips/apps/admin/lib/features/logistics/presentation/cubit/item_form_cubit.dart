import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/flight.dart';
import '../../domain/entities/flight_draft.dart';
import '../../domain/entities/itinerary_draft.dart';
import '../../domain/entities/itinerary_item.dart';
import '../../domain/entities/lodging.dart';
import '../../domain/entities/lodging_draft.dart';
import '../../domain/usecases/flight_usecases.dart';
import '../../domain/usecases/itinerary_usecases.dart';
import '../../domain/usecases/lodging_usecases.dart';

part 'item_form_cubit.freezed.dart';
part 'item_form_state.dart';

/// Create or edit one logistics item. Call [configure] before [submit].
abstract class ItemFormCubit<T, D, I> extends Cubit<ItemFormState<T, I>> {
  ItemFormCubit() : super(ItemFormState<T, I>.editing());

  late String _tripId;
  String? _itemId;

  /// [itemId] is null when creating.
  void configure({required String tripId, String? itemId}) {
    _tripId = tripId;
    _itemId = itemId;
  }

  @protected
  Set<I> issuesOf(D draft);

  @protected
  TaskEither<Failure, T> save({
    required String tripId,
    required D draft,
    String? id,
  });

  Future<void> submit(D draft) async {
    final current = state;
    if (current is! ItemFormEditing<T, I> || current.submitting) return;

    final issues = issuesOf(draft);
    if (issues.isNotEmpty) {
      emit(current.copyWith(issues: issues, failure: null));
      return;
    }

    emit(current.copyWith(submitting: true, issues: {}, failure: null));
    final result = await save(tripId: _tripId, draft: draft, id: _itemId).run();
    if (isClosed) return;
    emit(
      result.match(
        (failure) =>
            current.copyWith(submitting: false, issues: {}, failure: failure),
        ItemFormState<T, I>.saved,
      ),
    );
  }
}

@injectable
class FlightFormCubit
    extends ItemFormCubit<Flight, FlightDraft, FlightDraftIssue> {
  FlightFormCubit(this._save);

  final SaveFlight _save;

  @override
  Set<FlightDraftIssue> issuesOf(FlightDraft draft) => draft.issues;

  @override
  TaskEither<Failure, Flight> save({
    required String tripId,
    required FlightDraft draft,
    String? id,
  }) => _save(tripId: tripId, draft: draft, id: id);
}

@injectable
class LodgingFormCubit
    extends ItemFormCubit<Lodging, LodgingDraft, LodgingDraftIssue> {
  LodgingFormCubit(this._save);

  final SaveLodging _save;

  @override
  Set<LodgingDraftIssue> issuesOf(LodgingDraft draft) => draft.issues;

  @override
  TaskEither<Failure, Lodging> save({
    required String tripId,
    required LodgingDraft draft,
    String? id,
  }) => _save(tripId: tripId, draft: draft, id: id);
}

@injectable
class ItineraryFormCubit
    extends ItemFormCubit<ItineraryItem, ItineraryDraft, ItineraryDraftIssue> {
  ItineraryFormCubit(this._save);

  final SaveItineraryItem _save;

  @override
  Set<ItineraryDraftIssue> issuesOf(ItineraryDraft draft) => draft.issues;

  @override
  TaskEither<Failure, ItineraryItem> save({
    required String tripId,
    required ItineraryDraft draft,
    String? id,
  }) => _save(tripId: tripId, draft: draft, id: id);
}
