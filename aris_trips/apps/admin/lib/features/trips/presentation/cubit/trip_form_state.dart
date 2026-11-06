part of 'trip_form_cubit.dart';

@freezed
sealed class TripFormState with _$TripFormState {
  /// Loading the trip to edit.
  const factory TripFormState.loading() = TripFormLoading;

  /// Ready for input. [original] is null when creating. [issues] lists the
  /// fields to fix after a submit attempt.
  const factory TripFormState.editing({
    Trip? original,
    @Default(false) bool submitting,
    @Default(<TripDraftIssue>{}) Set<TripDraftIssue> issues,
    Failure? failure,
  }) = TripFormEditing;

  const factory TripFormState.saved(Trip trip, {required bool created}) =
      TripFormSaved;

  /// The trip to edit could not be loaded.
  const factory TripFormState.loadFailure(Failure failure) =
      TripFormLoadFailure;
}
