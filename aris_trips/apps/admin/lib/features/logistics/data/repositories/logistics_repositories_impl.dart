import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/supabase_exception_mapper.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/flight.dart';
import '../../domain/entities/flight_draft.dart';
import '../../domain/entities/itinerary_draft.dart';
import '../../domain/entities/itinerary_item.dart';
import '../../domain/entities/lodging.dart';
import '../../domain/entities/lodging_draft.dart';
import '../../domain/repositories/logistics_repositories.dart';
import '../datasources/logistics_remote_data_source.dart';
import '../models/logistics_models.dart';

TaskEither<Failure, T> _run<T>(Future<T> Function() action) =>
    TaskEither.tryCatch(
      action,
      (error, _) => mapSupabaseException(error, logName: 'logistics'),
    );

@LazySingleton(as: FlightsRepository)
class FlightsRepositoryImpl implements FlightsRepository {
  const FlightsRepositoryImpl(this._remote);

  final LogisticsRemoteDataSource _remote;

  static const _table = LogisticsTable.flights;

  @override
  TaskEither<Failure, List<Flight>> getFlights(String tripId) => _run(
    () async => (await _remote.list(
      table: _table,
      tripId: tripId,
    )).map((row) => FlightModel.fromJson(row).toEntity()).toList(),
  );

  @override
  TaskEither<Failure, Flight> createFlight(String tripId, FlightDraft draft) =>
      _run(
        () async => FlightModel.fromJson(
          await _remote.insert(
            table: _table,
            tripId: tripId,
            values: FlightModel.draftToJson(draft),
          ),
        ).toEntity(),
      );

  @override
  TaskEither<Failure, Flight> updateFlight(String id, FlightDraft draft) =>
      _run(
        () async => FlightModel.fromJson(
          await _remote.update(
            table: _table,
            id: id,
            values: FlightModel.draftToJson(draft),
          ),
        ).toEntity(),
      );

  @override
  TaskEither<Failure, Unit> deleteFlight(String id) => _run(() async {
    await _remote.delete(table: _table, id: id);
    return unit;
  });
}

@LazySingleton(as: LodgingsRepository)
class LodgingsRepositoryImpl implements LodgingsRepository {
  const LodgingsRepositoryImpl(this._remote);

  final LogisticsRemoteDataSource _remote;

  static const _table = LogisticsTable.lodgings;

  @override
  TaskEither<Failure, List<Lodging>> getLodgings(String tripId) => _run(
    () async => (await _remote.list(
      table: _table,
      tripId: tripId,
    )).map((row) => LodgingModel.fromJson(row).toEntity()).toList(),
  );

  @override
  TaskEither<Failure, Lodging> createLodging(
    String tripId,
    LodgingDraft draft,
  ) => _run(
    () async => LodgingModel.fromJson(
      await _remote.insert(
        table: _table,
        tripId: tripId,
        values: LodgingModel.draftToJson(draft),
      ),
    ).toEntity(),
  );

  @override
  TaskEither<Failure, Lodging> updateLodging(String id, LodgingDraft draft) =>
      _run(
        () async => LodgingModel.fromJson(
          await _remote.update(
            table: _table,
            id: id,
            values: LodgingModel.draftToJson(draft),
          ),
        ).toEntity(),
      );

  @override
  TaskEither<Failure, Unit> deleteLodging(String id) => _run(() async {
    await _remote.delete(table: _table, id: id);
    return unit;
  });
}

@LazySingleton(as: ItineraryRepository)
class ItineraryRepositoryImpl implements ItineraryRepository {
  const ItineraryRepositoryImpl(this._remote);

  final LogisticsRemoteDataSource _remote;

  static const _table = LogisticsTable.itineraryItems;

  @override
  TaskEither<Failure, List<ItineraryItem>> getItinerary(String tripId) => _run(
    () async => (await _remote.list(
      table: _table,
      tripId: tripId,
    )).map((row) => ItineraryItemModel.fromJson(row).toEntity()).toList(),
  );

  @override
  TaskEither<Failure, ItineraryItem> createItem(
    String tripId,
    ItineraryDraft draft,
  ) => _run(
    () async => ItineraryItemModel.fromJson(
      await _remote.insert(
        table: _table,
        tripId: tripId,
        values: ItineraryItemModel.draftToJson(draft),
      ),
    ).toEntity(),
  );

  @override
  TaskEither<Failure, ItineraryItem> updateItem(
    String id,
    ItineraryDraft draft,
  ) => _run(
    () async => ItineraryItemModel.fromJson(
      await _remote.update(
        table: _table,
        id: id,
        values: ItineraryItemModel.draftToJson(draft),
      ),
    ).toEntity(),
  );

  @override
  TaskEither<Failure, Unit> deleteItem(String id) => _run(() async {
    await _remote.delete(table: _table, id: id);
    return unit;
  });
}
