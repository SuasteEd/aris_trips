import 'package:json_annotation/json_annotation.dart';

/// Maps Postgres `date` values (`yyyy-MM-dd`) to local midnight [DateTime].
class DateOnlyConverter implements JsonConverter<DateTime, String> {
  const DateOnlyConverter();

  @override
  DateTime fromJson(String json) {
    final parts = json.split('-').map(int.parse).toList();
    return DateTime(parts[0], parts[1], parts[2]);
  }

  @override
  String toJson(DateTime date) =>
      '${date.year.toString().padLeft(4, '0')}-'
      '${date.month.toString().padLeft(2, '0')}-'
      '${date.day.toString().padLeft(2, '0')}';
}
