import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/supabase_exception_mapper.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/cover_image.dart';
import '../../domain/entities/trip.dart';
import '../../domain/entities/trip_draft.dart';
import '../../domain/entities/trip_status.dart';
import '../../domain/entities/trips_query.dart';
import '../../domain/repositories/trips_repository.dart';
import '../datasources/trips_remote_data_source.dart';

@LazySingleton(as: TripsRepository)
class TripsRepositoryImpl implements TripsRepository {
  const TripsRepositoryImpl(this._remote);

  final TripsRemoteDataSource _remote;

  TaskEither<Failure, T> _run<T>(Future<T> Function() action) =>
      TaskEither.tryCatch(
        action,
        (error, _) => mapSupabaseException(error, logName: 'trips'),
      );

  @override
  TaskEither<Failure, List<Trip>> getTrips(TripsQuery query) =>
      _run(() => _remote.fetchTrips(query));

  @override
  TaskEither<Failure, Trip> getTrip(String id) =>
      _run(() => _remote.fetchTrip(id));

  @override
  TaskEither<Failure, Trip> createTrip(TripDraft draft) =>
      _run(() => _remote.insertTrip(draft));

  @override
  TaskEither<Failure, Trip> updateTrip(String id, TripDraft draft) =>
      _run(() => _remote.updateTrip(id, draft));

  @override
  TaskEither<Failure, Trip> changeStatus(String id, TripStatus status) =>
      _run(() => _remote.updateStatus(id, status));

  @override
  TaskEither<Failure, Trip> setCover(Trip trip, CoverImage image) =>
      _run(() => _remote.replaceCover(trip, image));
}
