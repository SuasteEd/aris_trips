part of 'item_form_cubit.dart';

@freezed
sealed class ItemFormState<T, I> with _$ItemFormState<T, I> {
  /// [issues] lists the fields to fix after a submit attempt.
  const factory ItemFormState.editing({
    @Default(false) bool submitting,
    @Default({}) Set<I> issues,
    Failure? failure,
  }) = ItemFormEditing<T, I>;

  const factory ItemFormState.saved(T item) = ItemFormSaved<T, I>;
}
