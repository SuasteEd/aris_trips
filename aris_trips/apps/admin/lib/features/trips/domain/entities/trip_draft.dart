import 'package:freezed_annotation/freezed_annotation.dart';

import 'trip_status.dart';

part 'trip_draft.freezed.dart';

enum TripDraftIssue {
  nameRequired,
  destinationRequired,
  startDateRequired,
  endDateRequired,
  endBeforeStart,
}

/// Editable fields of a trip, used to create or update it. Dates stay null
/// until the admin picks them; [issues] reports what is missing.
@freezed
abstract class TripDraft with _$TripDraft {
  const factory TripDraft({
    @Default('') String name,
    @Default('') String destination,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    @Default(TripStatus.draft) TripStatus status,
  }) = _TripDraft;

  const TripDraft._();

  /// Trimmed copy with date-only values; an empty description becomes null.
  TripDraft normalized() {
    final text = description?.trim();
    return copyWith(
      name: name.trim(),
      destination: destination.trim(),
      description: text == null || text.isEmpty ? null : text,
      startDate: _dateOnly(startDate),
      endDate: _dateOnly(endDate),
    );
  }

  Set<TripDraftIssue> get issues {
    final start = _dateOnly(startDate);
    final end = _dateOnly(endDate);
    return {
      if (name.trim().isEmpty) TripDraftIssue.nameRequired,
      if (destination.trim().isEmpty) TripDraftIssue.destinationRequired,
      if (start == null) TripDraftIssue.startDateRequired,
      if (end == null) TripDraftIssue.endDateRequired,
      if (start != null && end != null && end.isBefore(start))
        TripDraftIssue.endBeforeStart,
    };
  }

  bool get isValid => issues.isEmpty;

  static DateTime? _dateOnly(DateTime? value) =>
      value == null ? null : DateTime(value.year, value.month, value.day);
}
