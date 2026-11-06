import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/time/zoned_time.dart';
import 'flight_draft.dart';

part 'flight.freezed.dart';

/// Instants are UTC; each end keeps the IANA zone of its airport.
@freezed
abstract class Flight with _$Flight {
  const factory Flight({
    required String id,
    required String tripId,
    required String airline,
    required String flightNumber,
    required String origin,
    required String destination,
    required DateTime departsAt,
    required String departureTz,
    required DateTime arrivesAt,
    required String arrivalTz,
    String? terminal,
  }) = _Flight;

  const Flight._();

  Duration get duration => arrivesAt.difference(departsAt);

  FlightDraft toDraft() => FlightDraft(
    airline: airline,
    flightNumber: flightNumber,
    origin: origin,
    destination: destination,
    departsLocal: ZonedTime.toWallTime(departsAt, departureTz),
    departureTz: departureTz,
    arrivesLocal: ZonedTime.toWallTime(arrivesAt, arrivalTz),
    arrivalTz: arrivalTz,
    terminal: terminal ?? '',
  );
}
