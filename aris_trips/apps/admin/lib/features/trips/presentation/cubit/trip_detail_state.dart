part of 'trip_detail_cubit.dart';

@freezed
sealed class TripDetailState with _$TripDetailState {
  const factory TripDetailState.loading() = TripDetailLoading;

  /// [busy] while a status change or cover upload runs. [actionFailure] is
  /// the error of the last action, shown once by the page.
  const factory TripDetailState.loaded({
    required Trip trip,
    @Default(false) bool busy,
    Failure? actionFailure,
  }) = TripDetailLoaded;

  const factory TripDetailState.failure(Failure failure) = TripDetailFailure;
}
