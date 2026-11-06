import 'package:intl/intl.dart';

/// Date formatting in es-MX. Call `initializeDateFormatting('es_MX')` once
/// at startup (done in main).
abstract final class DateFormats {
  static const String locale = 'es_MX';

  /// `20 mar 2027`
  static String date(DateTime date) =>
      DateFormat('d MMM y', locale).format(date);

  /// `20–25 mar 2027`, `28 mar – 2 abr 2027` or `30 dic 2026 – 3 ene 2027`.
  static String range(DateTime start, DateTime end) {
    if (start.year != end.year) return '${date(start)} – ${date(end)}';
    if (start.month != end.month) {
      return '${DateFormat('d MMM', locale).format(start)} – ${date(end)}';
    }
    if (start.day == end.day) return date(start);
    return '${start.day}–${date(end)}';
  }
}
