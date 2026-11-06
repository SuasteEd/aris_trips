import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/trip.dart';
import '../../domain/entities/trip_draft.dart';
import '../../domain/usecases/get_trip.dart';
import '../../domain/usecases/save_trip.dart';

part 'trip_form_cubit.freezed.dart';
part 'trip_form_state.dart';

@injectable
class TripFormCubit extends Cubit<TripFormState> {
  TripFormCubit(this._getTrip, this._saveTrip)
    : super(const TripFormState.editing());

  final GetTrip _getTrip;
  final SaveTrip _saveTrip;

  /// Loads the trip to edit; without [tripId] the form starts empty.
  Future<void> start({String? tripId}) async {
    if (tripId == null) {
      if (state != const TripFormState.editing()) {
        emit(const TripFormState.editing());
      }
      return;
    }
    emit(const TripFormState.loading());
    final result = await _getTrip(tripId).run();
    if (isClosed) return;
    emit(
      result.match(
        TripFormState.loadFailure,
        (trip) => TripFormState.editing(original: trip),
      ),
    );
  }

  Future<void> submit(TripDraft draft) async {
    final current = state;
    if (current is! TripFormEditing || current.submitting) return;

    final issues = draft.issues;
    if (issues.isNotEmpty) {
      emit(current.copyWith(issues: issues, failure: null));
      return;
    }

    emit(current.copyWith(submitting: true, issues: const {}, failure: null));
    final original = current.original;
    final result = await _saveTrip(draft, id: original?.id).run();
    if (isClosed) return;
    emit(
      result.match(
        (failure) => current.copyWith(
          submitting: false,
          issues: const {},
          failure: failure,
        ),
        (trip) => TripFormState.saved(trip, created: original == null),
      ),
    );
  }
}
