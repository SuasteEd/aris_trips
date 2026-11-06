import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/trip.dart';
import '../../domain/entities/trip_status.dart';
import '../../domain/entities/trips_query.dart';
import '../../domain/usecases/get_trips.dart';

part 'trips_list_cubit.freezed.dart';
part 'trips_list_state.dart';

@injectable
class TripsListCubit extends Cubit<TripsListState> {
  TripsListCubit(this._getTrips)
    : super(const TripsListState.loading(query: TripsQuery()));

  final GetTrips _getTrips;
  Timer? _debounce;
  int _request = 0;

  static const Duration searchDebounce = Duration(milliseconds: 350);

  Future<void> load() => _fetch(state.query);

  Future<void> setStatus(TripStatus? status) {
    _debounce?.cancel();
    return _fetch(state.query.copyWith(status: status));
  }

  /// Debounced so typing does not fire one request per key.
  void search(String text) {
    _debounce?.cancel();
    _debounce = Timer(
      searchDebounce,
      () => _fetch(state.query.copyWith(search: text)),
    );
  }

  Future<void> _fetch(TripsQuery query) async {
    final request = ++_request;
    emit(TripsListState.loading(query: query));
    final result = await _getTrips(query).run();
    // Drop responses that a newer filter or search already replaced.
    if (isClosed || request != _request) return;
    emit(
      result.match(
        (failure) => TripsListState.failure(query: query, failure: failure),
        (trips) => trips.isEmpty
            ? TripsListState.empty(query: query)
            : TripsListState.loaded(query: query, trips: trips),
      ),
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
