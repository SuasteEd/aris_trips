import 'package:freezed_annotation/freezed_annotation.dart';

import 'trip_status.dart';

part 'trip_draft.freezed.dart';

enum TripDraftIssue { nameRequired, destinationRequired, endBeforeStart }

/// Editable fields of a trip, used to create or update it.
@freezed
abstract class TripDraft with _$TripDraft {
  const factory TripDraft({
    required String name,
    required String destination,
    String? description,
    required DateTime startDate,
    required DateTime endDate,
    @Default(TripStatus.draft) TripStatus status,
  }) = _TripDraft;

  const TripDraft._();

  /// Trimmed copy; an empty description becomes null.
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

  Set<TripDraftIssue> get issues => {
    if (name.trim().isEmpty) TripDraftIssue.nameRequired,
    if (destination.trim().isEmpty) TripDraftIssue.destinationRequired,
    if (_dateOnly(endDate).isBefore(_dateOnly(startDate)))
      TripDraftIssue.endBeforeStart,
  };

  bool get isValid => issues.isEmpty;

  static DateTime _dateOnly(DateTime value) =>
      DateTime(value.year, value.month, value.day);
}
