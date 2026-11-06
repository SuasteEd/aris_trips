import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../entities/trip.dart';
import '../entities/trip_status.dart';
import '../repositories/trips_repository.dart';

@injectable
class ChangeTripStatus {
  const ChangeTripStatus(this._repository);

  final TripsRepository _repository;

  TaskEither<Failure, Trip> call(Trip trip, TripStatus status) =>
      trip.status == status
      ? TaskEither.right(trip)
      : _repository.changeStatus(trip.id, status);
}
