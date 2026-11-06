import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/cover_image.dart';
import '../entities/trip.dart';
import '../entities/trip_draft.dart';
import '../entities/trip_status.dart';
import '../entities/trips_query.dart';

abstract interface class TripsRepository {
  /// Archived trips: most recent first. Otherwise: earliest start first.
  TaskEither<Failure, List<Trip>> getTrips(TripsQuery query);

  TaskEither<Failure, Trip> getTrip(String id);

  TaskEither<Failure, Trip> createTrip(TripDraft draft);

  TaskEither<Failure, Trip> updateTrip(String id, TripDraft draft);

  TaskEither<Failure, Trip> changeStatus(String id, TripStatus status);

  /// Uploads a new cover and removes the previous one.
  TaskEither<Failure, Trip> setCover(Trip trip, CoverImage image);
}
