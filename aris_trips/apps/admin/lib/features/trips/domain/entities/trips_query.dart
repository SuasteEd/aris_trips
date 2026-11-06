import 'package:freezed_annotation/freezed_annotation.dart';

import 'trip_status.dart';

part 'trips_query.freezed.dart';

/// Filter for the trips list. A null [status] means every status.
@freezed
abstract class TripsQuery with _$TripsQuery {
  const factory TripsQuery({TripStatus? status, @Default('') String search}) =
      _TripsQuery;
}
