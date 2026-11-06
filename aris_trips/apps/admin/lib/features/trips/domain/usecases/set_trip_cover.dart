import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../entities/cover_image.dart';
import '../entities/trip.dart';
import '../repositories/trips_repository.dart';

@injectable
class SetTripCover {
  const SetTripCover(this._repository);

  final TripsRepository _repository;

  /// Max size accepted by the `public-media` bucket.
  static const int maxBytes = 5 * 1024 * 1024;

  TaskEither<Failure, Trip> call(Trip trip, CoverImage image) {
    if (!image.isAllowedType || image.bytes.lengthInBytes > maxBytes) {
      return TaskEither.left(const Failure.invalidInput());
    }
    return _repository.setCover(trip, image);
  }
}
