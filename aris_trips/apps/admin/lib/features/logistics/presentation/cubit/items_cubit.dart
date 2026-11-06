import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/presentation/items_cubit.dart';
import '../../domain/entities/flight.dart';
import '../../domain/entities/itinerary_item.dart';
import '../../domain/entities/lodging.dart';
import '../../domain/usecases/flight_usecases.dart';
import '../../domain/usecases/itinerary_usecases.dart';
import '../../domain/usecases/lodging_usecases.dart';

export '../../../../core/presentation/items_cubit.dart';

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
