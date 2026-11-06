import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/media/image_picker_service.dart';
import '../../domain/entities/cover_image.dart';
import '../../domain/entities/trip.dart';
import '../../domain/entities/trip_status.dart';
import '../../domain/usecases/change_trip_status.dart';
import '../../domain/usecases/get_trip.dart';
import '../../domain/usecases/set_trip_cover.dart';

part 'trip_detail_cubit.freezed.dart';
part 'trip_detail_state.dart';

@injectable
class TripDetailCubit extends Cubit<TripDetailState> {
  TripDetailCubit(
    this._getTrip,
    this._changeStatus,
    this._setCover,
    this._imagePicker,
  ) : super(const TripDetailState.loading());

  final GetTrip _getTrip;
  final ChangeTripStatus _changeStatus;
  final SetTripCover _setCover;
  final ImagePickerService _imagePicker;

  Future<void> load(String id) async {
    emit(const TripDetailState.loading());
    final result = await _getTrip(id).run();
    if (isClosed) return;
    emit(
      result.match(
        TripDetailState.failure,
        (trip) => TripDetailState.loaded(trip: trip),
      ),
    );
  }

  Future<void> changeStatus(TripStatus status) async {
    final current = state;
    if (current is! TripDetailLoaded || current.busy) return;
    await _runAction(current, _changeStatus(current.trip, status));
  }

  /// Opens the gallery; does nothing if the admin cancels.
  Future<void> pickCover() async {
    final current = state;
    if (current is! TripDetailLoaded || current.busy) return;
    final picked = await _imagePicker.pickFromGallery();
    if (picked == null || isClosed) return;
    await _runAction(
      current,
      _setCover(
        current.trip,
        CoverImage(bytes: picked.bytes, contentType: picked.contentType),
      ),
    );
  }

  Future<void> _runAction(
    TripDetailLoaded current,
    TaskEither<Failure, Trip> action,
  ) async {
    emit(current.copyWith(busy: true, actionFailure: null));
    final result = await action.run();
    if (isClosed) return;
    emit(
      result.match(
        (failure) => current.copyWith(busy: false, actionFailure: failure),
        (trip) => TripDetailState.loaded(trip: trip),
      ),
    );
  }
}
