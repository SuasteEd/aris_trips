import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/passenger.dart';
import '../../domain/entities/passenger_draft.dart';
import '../../domain/entities/passenger_import.dart';
import '../../domain/usecases/passenger_usecases.dart';

part 'add_passenger_cubit.freezed.dart';

@freezed
abstract class AddPassengerState with _$AddPassengerState {
  const factory AddPassengerState({
    @Default('') String query,
    @Default(false) bool searching,
    @Default([]) List<Passenger> results,
    Failure? searchFailure,
    @Default(false) bool submitting,
    @Default({}) Set<PassengerDraftIssue> issues,
    Failure? failure,

    /// Set when the passenger was added. Null [result] means an existing
    /// passenger was picked from the search.
    @Default(false) bool added,
    ImportResult? result,
  }) = _AddPassengerState;
}

/// Adds a passenger to a trip: pick an existing one or create a new one
/// (reused automatically when email and name match).
@injectable
class AddPassengerCubit extends Cubit<AddPassengerState> {
  AddPassengerCubit(this._search, this._addNew, this._addExisting)
    : super(const AddPassengerState());

  final SearchPassengers _search;
  final AddNewPassenger _addNew;
  final AddExistingPassenger _addExisting;

  late String _tripId;
  Set<String> _onTrip = const {};
  Timer? _debounce;
  int _request = 0;

  static const Duration searchDebounce = Duration(milliseconds: 350);

  void configure({required String tripId, required Set<String> onTrip}) {
    _tripId = tripId;
    _onTrip = onTrip;
  }

  bool isOnTrip(Passenger passenger) => _onTrip.contains(passenger.id);

  void search(String text) {
    _debounce?.cancel();
    emit(state.copyWith(query: text));
    _debounce = Timer(searchDebounce, () => _runSearch(text));
  }

  Future<void> _runSearch(String text) async {
    final request = ++_request;
    emit(state.copyWith(searching: true, searchFailure: null));
    final result = await _search(text).run();
    if (isClosed || request != _request) return;
    emit(
      result.match(
        (failure) => state.copyWith(searching: false, searchFailure: failure),
        (passengers) => state.copyWith(searching: false, results: passengers),
      ),
    );
  }

  Future<void> addExisting(Passenger passenger) async {
    if (state.submitting || isOnTrip(passenger)) return;
    emit(state.copyWith(submitting: true, failure: null));
    final result = await _addExisting(_tripId, passenger.id).run();
    if (isClosed) return;
    emit(
      result.match(
        (failure) => state.copyWith(submitting: false, failure: failure),
        (_) => state.copyWith(submitting: false, added: true),
      ),
    );
  }

  Future<void> addNew(PassengerDraft draft) async {
    if (state.submitting) return;
    final issues = draft.issues;
    if (issues.isNotEmpty) {
      emit(state.copyWith(issues: issues, failure: null));
      return;
    }
    emit(state.copyWith(submitting: true, issues: {}, failure: null));
    final result = await _addNew(_tripId, draft).run();
    if (isClosed) return;
    emit(
      result.match(
        (failure) => state.copyWith(submitting: false, failure: failure),
        (imported) =>
            state.copyWith(submitting: false, added: true, result: imported),
      ),
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
