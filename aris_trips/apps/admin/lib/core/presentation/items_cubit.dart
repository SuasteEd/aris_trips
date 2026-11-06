import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../error/failure.dart';

part 'items_cubit.freezed.dart';
part 'items_state.dart';

/// Loads and deletes the items of one trip (flights, lodgings, bookings…).
abstract class ItemsCubit<T> extends Cubit<ItemsState<T>> {
  ItemsCubit() : super(ItemsState<T>.loading());

  String? _tripId;

  String? get tripId => _tripId;

  @protected
  TaskEither<Failure, List<T>> fetch(String tripId);

  @protected
  TaskEither<Failure, Unit> remove(T item);

  @protected
  String idOf(T item);

  Future<void> load(String tripId) async {
    _tripId = tripId;
    emit(ItemsState<T>.loading());
    final result = await fetch(tripId).run();
    if (isClosed) return;
    emit(
      result.match(
        ItemsState<T>.failure,
        (items) => ItemsState<T>.loaded(items: items),
      ),
    );
  }

  /// Reloads after a create or edit, without the loading flash.
  Future<void> refresh() async {
    final id = _tripId;
    if (id == null) return;
    final result = await fetch(id).run();
    if (isClosed) return;
    result.match(
      (failure) => emit(ItemsState<T>.failure(failure)),
      (items) => emit(ItemsState<T>.loaded(items: items)),
    );
  }

  Future<void> delete(T item) async {
    final current = state;
    if (current is! ItemsLoaded<T> || current.busy) return;
    emit(current.copyWith(busy: true, actionFailure: null));
    final result = await remove(item).run();
    if (isClosed) return;
    emit(
      result.match(
        (failure) => current.copyWith(busy: false, actionFailure: failure),
        (_) => ItemsState<T>.loaded(
          items: [
            for (final other in current.items)
              if (idOf(other) != idOf(item)) other,
          ],
        ),
      ),
    );
  }
}
