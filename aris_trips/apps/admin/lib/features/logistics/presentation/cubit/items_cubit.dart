import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/flight.dart';
import '../../domain/entities/itinerary_item.dart';
import '../../domain/entities/lodging.dart';
import '../../domain/usecases/flight_usecases.dart';
import '../../domain/usecases/itinerary_usecases.dart';
import '../../domain/usecases/lodging_usecases.dart';

part 'items_cubit.freezed.dart';
part 'items_state.dart';

/// Loads and deletes the logistics items of one trip.
abstract class ItemsCubit<T> extends Cubit<ItemsState<T>> {
  ItemsCubit() : super(ItemsState<T>.loading());

  String? _tripId;

  String? get tripId => _tripId;

  @protected
  TaskEither<Failure, List<T>> fetch(String tripId);

  @protected
  TaskEither<Failure, Unit> remove(T item);

  @protected
  String idOf(T item);

  Future<void> load(String tripId) async {
    _tripId = tripId;
    emit(ItemsState<T>.loading());
    final result = await fetch(tripId).run();
    if (isClosed) return;
    emit(
      result.match(
        ItemsState<T>.failure,
        (items) => ItemsState<T>.loaded(items: items),
      ),
    );
  }

  /// Reloads after a create or edit, without the loading flash.
  Future<void> refresh() async {
    final id = _tripId;
    if (id == null) return;
    final result = await fetch(id).run();
    if (isClosed) return;
    result.match(
      (failure) => emit(ItemsState<T>.failure(failure)),
      (items) => emit(ItemsState<T>.loaded(items: items)),
    );
  }

  Future<void> delete(T item) async {
    final current = state;
    if (current is! ItemsLoaded<T> || current.busy) return;
    emit(current.copyWith(busy: true, actionFailure: null));
    final result = await remove(item).run();
    if (isClosed) return;
    emit(
      result.match(
        (failure) => current.copyWith(busy: false, actionFailure: failure),
        (_) => ItemsState<T>.loaded(
          items: [
            for (final other in current.items)
              if (idOf(other) != idOf(item)) other,
          ],
        ),
      ),
    );
  }
}

@injectable
class FlightsCubit extends ItemsCubit<Flight> {
  FlightsCubit(this._get, this._delete);

  final GetFlights _get;
  final DeleteFlight _delete;

  @override
  TaskEither<Failure, List<Flight>> fetch(String tripId) => _get(tripId);

  @override
  TaskEither<Failure, Unit> remove(Flight item) => _delete(item.id);

  @override
  String idOf(Flight item) => item.id;
}

@injectable
class LodgingsCubit extends ItemsCubit<Lodging> {
  LodgingsCubit(this._get, this._delete);

  final GetLodgings _get;
  final DeleteLodging _delete;

  @override
  TaskEither<Failure, List<Lodging>> fetch(String tripId) => _get(tripId);

  @override
  TaskEither<Failure, Unit> remove(Lodging item) => _delete(item.id);

  @override
  String idOf(Lodging item) => item.id;

  /// Zone of the latest lodging, used as the default for new items.
  String? get suggestedZone => switch (state) {
    ItemsLoaded(:final items) when items.isNotEmpty => items.last.timezone,
    _ => null,
  };
}

@injectable
class ItineraryCubit extends ItemsCubit<ItineraryItem> {
  ItineraryCubit(this._get, this._delete);

  final GetItinerary _get;
  final DeleteItineraryItem _delete;

  @override
  TaskEither<Failure, List<ItineraryItem>> fetch(String tripId) => _get(tripId);

  @override
  TaskEither<Failure, Unit> remove(ItineraryItem item) => _delete(item.id);

  @override
  String idOf(ItineraryItem item) => item.id;
}
