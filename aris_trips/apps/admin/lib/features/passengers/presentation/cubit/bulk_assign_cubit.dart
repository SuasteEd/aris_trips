import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../logistics/domain/entities/flight.dart';
import '../../../logistics/domain/entities/lodging.dart';
import '../../../logistics/domain/usecases/flight_usecases.dart';
import '../../../logistics/domain/usecases/lodging_usecases.dart';
import '../../domain/entities/booking.dart';
import '../../domain/usecases/assignment_usecases.dart';
import '../../domain/usecases/passenger_usecases.dart';

part 'bulk_assign_cubit.freezed.dart';

@freezed
sealed class BulkAssignState with _$BulkAssignState {
  const factory BulkAssignState.loading() = BulkAssignLoading;

  const factory BulkAssignState.ready({
    required List<Booking> bookings,
    required List<Flight> flights,
    required List<Lodging> lodgings,
    @Default(BulkTarget.flight) BulkTarget target,
    String? targetId,
    @Default({}) Set<String> selected,
    @Default(false) bool submitting,
    Failure? failure,

    /// Bookings added by the last submit.
    int? added,
  }) = BulkAssignReady;

  const factory BulkAssignState.failure(Failure failure) = BulkAssignFailure;
}

extension BulkAssignReadyX on BulkAssignReady {
  /// The booking already has the chosen flight or lodging.
  bool alreadyAssigned(Booking booking) {
    final id = targetId;
    if (id == null) return false;
    return target == BulkTarget.flight
        ? booking.hasFlight(id)
        : booking.hasLodging(id);
  }

  List<Booking> get selectable =>
      bookings.where((b) => !alreadyAssigned(b)).toList();

  bool get canSubmit => targetId != null && selected.isNotEmpty && !submitting;
}

@injectable
class BulkAssignCubit extends Cubit<BulkAssignState> {
  BulkAssignCubit(
    this._getBookings,
    this._getFlights,
    this._getLodgings,
    this._bulkAssign,
  ) : super(const BulkAssignState.loading());

  final GetBookings _getBookings;
  final GetFlights _getFlights;
  final GetLodgings _getLodgings;
  final BulkAssign _bulkAssign;

  late String _tripId;

  Future<void> load(String tripId) async {
    _tripId = tripId;
    emit(const BulkAssignState.loading());
    final result = await _fetch(_tripId).run();
    if (isClosed) return;
    emit(result.match(BulkAssignState.failure, (ready) => ready));
  }

  TaskEither<Failure, BulkAssignReady> _fetch(String tripId) =>
      TaskEither.Do(($) async {
        final bookings = await $(_getBookings(tripId));
        final flights = await $(_getFlights(tripId));
        final lodgings = await $(_getLodgings(tripId));
        return BulkAssignReady(
          bookings: bookings,
          flights: flights,
          lodgings: lodgings,
        );
      });

  void setTarget(BulkTarget target) {
    final current = state;
    if (current is! BulkAssignReady || current.target == target) return;
    emit(
      current.copyWith(
        target: target,
        targetId: null,
        selected: {},
        added: null,
        failure: null,
      ),
    );
  }

  /// Choosing a flight or lodging preselects every confirmed or pending
  /// booking that does not have it yet.
  void chooseTarget(String id) {
    final current = state;
    if (current is! BulkAssignReady) return;
    final next = current.copyWith(targetId: id, added: null, failure: null);
    emit(
      next.copyWith(
        selected: {
          for (final booking in next.selectable)
            if (booking.status != BookingStatus.cancelled) booking.id,
        },
      ),
    );
  }

  void toggle(String bookingId) {
    final current = state;
    if (current is! BulkAssignReady) return;
    final selected = {...current.selected};
    if (!selected.remove(bookingId)) selected.add(bookingId);
    emit(current.copyWith(selected: selected, added: null));
  }

  void selectAll(bool value) {
    final current = state;
    if (current is! BulkAssignReady) return;
    emit(
      current.copyWith(
        selected: value ? {for (final b in current.selectable) b.id} : {},
        added: null,
      ),
    );
  }

  Future<void> submit() async {
    final current = state;
    if (current is! BulkAssignReady || !current.canSubmit) return;
    emit(current.copyWith(submitting: true, failure: null, added: null));
    final chosen = [
      for (final booking in current.bookings)
        if (current.selected.contains(booking.id)) booking,
    ];
    final result = await _bulkAssign(
      target: current.target,
      targetId: current.targetId!,
      bookings: chosen,
    ).flatMap((added) => _fetch(_tripId).map((ready) => (added, ready))).run();
    if (isClosed) return;
    emit(
      result.match(
        (failure) => current.copyWith(submitting: false, failure: failure),
        (value) => value.$2.copyWith(
          target: current.target,
          targetId: current.targetId,
          added: value.$1,
        ),
      ),
    );
  }
}
