part of 'items_cubit.dart';

@freezed
sealed class ItemsState<T> with _$ItemsState<T> {
  const factory ItemsState.loading() = ItemsLoading<T>;

  /// An empty [items] list is the "empty" state. [busy] while deleting;
  /// [actionFailure] is the error of the last delete, shown once.
  const factory ItemsState.loaded({
    required List<T> items,
    @Default(false) bool busy,
    Failure? actionFailure,
  }) = ItemsLoaded<T>;

  const factory ItemsState.failure(Failure failure) = ItemsFailure<T>;
}
