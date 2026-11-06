import 'package:freezed_annotation/freezed_annotation.dart';

import 'trip_draft.dart';
import 'trip_status.dart';

part 'trip.freezed.dart';

@freezed
abstract class Trip with _$Trip {
  const factory Trip({
    required String id,
    required String name,
    required String destination,
    String? description,
    String? coverPath,

    /// Public URL of the cover, resolved by the data layer.
    String? coverUrl,

    /// Calendar dates without time zone (`date` columns).
    required DateTime startDate,
    required DateTime endDate,
    required TripStatus status,
  }) = _Trip;

  const Trip._();

  /// Editable copy of this trip's fields.
  TripDraft toDraft() => TripDraft(
    name: name,
    destination: destination,
    description: description,
    startDate: startDate,
    endDate: endDate,
    status: status,
  );
}
