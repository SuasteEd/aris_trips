import 'package:timezone/timezone.dart' as tz;

import 'time_zones.dart';

/// Conversions between instants and wall-clock times of an IANA zone.
///
/// A "wall time" is a [DateTime] whose fields (year…minute) are read as the
/// clock on the wall at [zone]; its own isUtc/local flag is ignored.
abstract final class ZonedTime {
  /// Instant (UTC) for [wallTime] at [zone]. Times skipped by a DST jump
  /// move forward; repeated times take the first occurrence.
  static DateTime toInstant(DateTime wallTime, String zone) {
    final location = _location(zone);
    return tz.TZDateTime(
      location,
      wallTime.year,
      wallTime.month,
      wallTime.day,
      wallTime.hour,
      wallTime.minute,
    ).toUtc();
  }

  /// Wall time at [zone] for [instant], as a plain (local-flagged) DateTime.
  static DateTime toWallTime(DateTime instant, String zone) {
    final zoned = tz.TZDateTime.from(instant, _location(zone));
    return DateTime(
      zoned.year,
      zoned.month,
      zoned.day,
      zoned.hour,
      zoned.minute,
    );
  }

  /// UTC offset at [zone] for [instant].
  static Duration offset(DateTime instant, String zone) =>
      tz.TZDateTime.from(instant, _location(zone)).timeZoneOffset;

  /// `GMT-6`, `GMT+5:30`, `GMT`.
  static String offsetLabel(DateTime instant, String zone) {
    final minutes = offset(instant, zone).inMinutes;
    if (minutes == 0) return 'GMT';
    final sign = minutes < 0 ? '-' : '+';
    final hours = minutes.abs() ~/ 60;
    final rest = minutes.abs() % 60;
    return rest == 0
        ? 'GMT$sign$hours'
        : 'GMT$sign$hours:${rest.toString().padLeft(2, '0')}';
  }

  static tz.Location _location(String zone) {
    TimeZones.ensureInitialized();
    return tz.getLocation(zone);
  }
}
