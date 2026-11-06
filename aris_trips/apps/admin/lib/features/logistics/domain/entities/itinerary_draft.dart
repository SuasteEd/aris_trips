import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/time/time_zones.dart';
import '../../../../core/time/zoned_time.dart';

part 'itinerary_draft.freezed.dart';

enum ItineraryDraftIssue {
  titleRequired,
  startRequired,
  timezoneInvalid,
  endBeforeStart,
}

/// Group itinerary item as typed by the admin; the end is optional.
@freezed
abstract class ItineraryDraft with _$ItineraryDraft {
  const factory ItineraryDraft({
    @Default('') String title,
    DateTime? startsLocal,
    DateTime? endsLocal,
    @Default(TimeZones.defaultZone) String timezone,
    @Default('') String location,
    @Default('') String description,
  }) = _ItineraryDraft;

  const ItineraryDraft._();

  DateTime? get startsAt => _instant(startsLocal);

  DateTime? get endsAt => _instant(endsLocal);

  Set<ItineraryDraftIssue> get issues {
    final starts = startsAt;
    final ends = endsAt;
    return {
      if (title.trim().isEmpty) ItineraryDraftIssue.titleRequired,
      if (startsLocal == null) ItineraryDraftIssue.startRequired,
      if (!TimeZones.isValid(timezone)) ItineraryDraftIssue.timezoneInvalid,
      if (starts != null && ends != null && ends.isBefore(starts))
        ItineraryDraftIssue.endBeforeStart,
    };
  }

  bool get isValid => issues.isEmpty;

  ItineraryDraft normalized() => copyWith(
    title: title.trim(),
    location: location.trim(),
    description: description.trim(),
  );

  DateTime? _instant(DateTime? wallTime) =>
      wallTime == null || !TimeZones.isValid(timezone)
      ? null
      : ZonedTime.toInstant(wallTime, timezone);
}
