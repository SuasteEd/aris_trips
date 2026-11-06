import 'package:json_annotation/json_annotation.dart';

/// `timestamptz` ⇄ UTC [DateTime].
class InstantConverter implements JsonConverter<DateTime, String> {
  const InstantConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json).toUtc();

  @override
  String toJson(DateTime instant) => instant.toUtc().toIso8601String();
}

class NullableInstantConverter implements JsonConverter<DateTime?, String?> {
  const NullableInstantConverter();

  @override
  DateTime? fromJson(String? json) =>
      json == null ? null : DateTime.parse(json).toUtc();

  @override
  String? toJson(DateTime? instant) => instant?.toUtc().toIso8601String();
}
