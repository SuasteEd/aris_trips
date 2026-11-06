import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/time/time_zones.dart';
import '../../../../core/time/zoned_time.dart';

part 'lodging_draft.freezed.dart';

enum LodgingDraftIssue {
  nameRequired,
  checkInRequired,
  checkOutRequired,
  timezoneInvalid,
  checkOutNotAfterCheckIn,
  latitudeInvalid,
  longitudeInvalid,
  coordinatesIncomplete,
}

/// Lodging as typed by the admin. Coordinates are text so the domain can
/// report bad input; both or neither must be given.
@freezed
abstract class LodgingDraft with _$LodgingDraft {
  const factory LodgingDraft({
    @Default('') String name,
    @Default('') String address,
    @Default('') String latitude,
    @Default('') String longitude,
    DateTime? checkInLocal,
    DateTime? checkOutLocal,
    @Default(TimeZones.defaultZone) String timezone,
  }) = _LodgingDraft;

  const LodgingDraft._();

  DateTime? get checkInAt => _instant(checkInLocal);

  DateTime? get checkOutAt => _instant(checkOutLocal);

  /// Null when empty or invalid. Accepts a decimal comma.
  double? get latitudeValue => _parse(latitude, 90);

  double? get longitudeValue => _parse(longitude, 180);

  Set<LodgingDraftIssue> get issues {
    final checkIn = checkInAt;
    final checkOut = checkOutAt;
    final hasLat = latitude.trim().isNotEmpty;
    final hasLng = longitude.trim().isNotEmpty;
    return {
      if (name.trim().isEmpty) LodgingDraftIssue.nameRequired,
      if (checkInLocal == null) LodgingDraftIssue.checkInRequired,
      if (checkOutLocal == null) LodgingDraftIssue.checkOutRequired,
      if (!TimeZones.isValid(timezone)) LodgingDraftIssue.timezoneInvalid,
      if (checkIn != null && checkOut != null && !checkOut.isAfter(checkIn))
        LodgingDraftIssue.checkOutNotAfterCheckIn,
      if (hasLat && latitudeValue == null) LodgingDraftIssue.latitudeInvalid,
      if (hasLng && longitudeValue == null) LodgingDraftIssue.longitudeInvalid,
      if (hasLat != hasLng) LodgingDraftIssue.coordinatesIncomplete,
    };
  }

  bool get isValid => issues.isEmpty;

  LodgingDraft normalized() => copyWith(
    name: name.trim(),
    address: address.trim(),
    latitude: latitude.trim(),
    longitude: longitude.trim(),
  );

  DateTime? _instant(DateTime? wallTime) =>
      wallTime == null || !TimeZones.isValid(timezone)
      ? null
      : ZonedTime.toInstant(wallTime, timezone);

  static double? _parse(String text, double limit) {
    final value = double.tryParse(text.trim().replaceAll(',', '.'));
    if (value == null || !value.isFinite || value.abs() > limit) return null;
    return value;
  }
}
