import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../entities/trip.dart';
import '../repositories/trips_repository.dart';

@injectable
class GetTrip {
  const GetTrip(this._repository);

  final TripsRepository _repository;

  TaskEither<Failure, Trip> call(String id) => _repository.getTrip(id);
}
