import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/time/time_zones.dart';
import '../../../../core/time/zoned_time.dart';

part 'flight_draft.freezed.dart';

enum FlightDraftIssue {
  airlineRequired,
  flightNumberRequired,
  originRequired,
  destinationRequired,
  departureRequired,
  arrivalRequired,
  departureTzInvalid,
  arrivalTzInvalid,
  arrivalNotAfterDeparture,
}

/// Flight as typed by the admin: wall-clock times at each airport's zone.
@freezed
abstract class FlightDraft with _$FlightDraft {
  const factory FlightDraft({
    @Default('') String airline,
    @Default('') String flightNumber,
    @Default('') String origin,
    @Default('') String destination,
    DateTime? departsLocal,
    @Default(TimeZones.defaultZone) String departureTz,
    DateTime? arrivesLocal,
    @Default(TimeZones.defaultZone) String arrivalTz,
    @Default('') String terminal,
  }) = _FlightDraft;

  const FlightDraft._();

  DateTime? get departsAt => _instant(departsLocal, departureTz);

  DateTime? get arrivesAt => _instant(arrivesLocal, arrivalTz);

  /// Compared as instants: a westbound flight may "land earlier" on the
  /// clock and still be valid.
  Set<FlightDraftIssue> get issues {
    final departs = departsAt;
    final arrives = arrivesAt;
    return {
      if (airline.trim().isEmpty) FlightDraftIssue.airlineRequired,
      if (flightNumber.trim().isEmpty) FlightDraftIssue.flightNumberRequired,
      if (origin.trim().isEmpty) FlightDraftIssue.originRequired,
      if (destination.trim().isEmpty) FlightDraftIssue.destinationRequired,
      if (departsLocal == null) FlightDraftIssue.departureRequired,
      if (arrivesLocal == null) FlightDraftIssue.arrivalRequired,
      if (!TimeZones.isValid(departureTz)) FlightDraftIssue.departureTzInvalid,
      if (!TimeZones.isValid(arrivalTz)) FlightDraftIssue.arrivalTzInvalid,
      if (departs != null && arrives != null && !arrives.isAfter(departs))
        FlightDraftIssue.arrivalNotAfterDeparture,
    };
  }

  bool get isValid => issues.isEmpty;

  /// Trimmed copy; airport codes in uppercase.
  FlightDraft normalized() => copyWith(
    airline: airline.trim(),
    flightNumber: flightNumber.trim().toUpperCase(),
    origin: origin.trim().toUpperCase(),
    destination: destination.trim().toUpperCase(),
    terminal: terminal.trim(),
  );

  static DateTime? _instant(DateTime? wallTime, String zone) =>
      wallTime == null || !TimeZones.isValid(zone)
      ? null
      : ZonedTime.toInstant(wallTime, zone);
}
