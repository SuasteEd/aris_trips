import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/time/zoned_time.dart';
import 'itinerary_draft.dart';

part 'itinerary_item.freezed.dart';

@freezed
abstract class ItineraryItem with _$ItineraryItem {
  const factory ItineraryItem({
    required String id,
    required String tripId,

    /// Null: the item applies to the whole group.
    String? bookingId,
    required DateTime startsAt,
    DateTime? endsAt,
    required String timezone,
    required String title,
    String? description,
    String? location,
  }) = _ItineraryItem;

  const ItineraryItem._();

  bool get isForGroup => bookingId == null;

  ItineraryDraft toDraft() {
    final ends = endsAt;
    return ItineraryDraft(
      title: title,
      startsLocal: ZonedTime.toWallTime(startsAt, timezone),
      endsLocal: ends == null ? null : ZonedTime.toWallTime(ends, timezone),
      timezone: timezone,
      location: location ?? '',
      description: description ?? '',
      bookingId: bookingId,
    );
  }
}
