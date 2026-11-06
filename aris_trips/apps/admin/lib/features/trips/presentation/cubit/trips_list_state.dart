part of 'trips_list_cubit.dart';

@freezed
sealed class TripsListState with _$TripsListState {
  const factory TripsListState.loading({required TripsQuery query}) =
      TripsListLoading;

  const factory TripsListState.loaded({
    required TripsQuery query,
    required List<Trip> trips,
  }) = TripsListLoaded;

  /// No trips match. [TripsListStateX.isFiltered] tells "no trips yet"
  /// apart from "no results".
  const factory TripsListState.empty({required TripsQuery query}) =
      TripsListEmpty;

  const factory TripsListState.failure({
    required TripsQuery query,
    required Failure failure,
  }) = TripsListFailure;
}

extension TripsListStateX on TripsListState {
  bool get isFiltered => query.status != null || query.search.trim().isNotEmpty;
}
