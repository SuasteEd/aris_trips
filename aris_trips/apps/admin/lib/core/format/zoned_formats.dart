import 'package:intl/intl.dart';

import '../time/zoned_time.dart';
import 'date_formats.dart';

/// Formats instants in the local time of a place, never the phone's zone.
abstract final class ZonedFormats {
  /// `08:00`
  static String time(DateTime instant, String zone) => DateFormat(
    'HH:mm',
    DateFormats.locale,
  ).format(ZonedTime.toWallTime(instant, zone));

  /// `20 mar 2027`
  static String date(DateTime instant, String zone) =>
      DateFormats.date(ZonedTime.toWallTime(instant, zone));

  /// `sáb 20 mar 2027`
  static String weekdayDate(DateTime instant, String zone) => DateFormat(
    'EEE d MMM y',
    DateFormats.locale,
  ).format(ZonedTime.toWallTime(instant, zone));

  /// `20 mar 2027, 08:00`
  static String dateTime(DateTime instant, String zone) =>
      '${date(instant, zone)}, ${time(instant, zone)}';

  /// `08:00 GMT-6`
  static String timeWithOffset(DateTime instant, String zone) =>
      '${time(instant, zone)} ${ZonedTime.offsetLabel(instant, zone)}';

  /// `2 h 15 min`, `45 min`, `3 h`
  static String duration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    if (hours == 0) return '$minutes min';
    if (minutes == 0) return '$hours h';
    return '$hours h $minutes min';
  }

  /// Readable zone name: `America/Mexico_City` → `Mexico City (America)`.
  static String zoneName(String zone) {
    final parts = zone.split('/');
    final city = parts.last.replaceAll('_', ' ');
    return parts.length == 1 ? city : '$city (${parts.first})';
  }
}
