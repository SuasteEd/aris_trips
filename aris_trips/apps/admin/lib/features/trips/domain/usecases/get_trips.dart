import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../entities/trip.dart';
import '../entities/trips_query.dart';
import '../repositories/trips_repository.dart';

@injectable
class GetTrips {
  const GetTrips(this._repository);

  final TripsRepository _repository;

  TaskEither<Failure, List<Trip>> call(TripsQuery query) =>
      _repository.getTrips(query.copyWith(search: query.search.trim()));
}
