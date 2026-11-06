import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/flight.dart';
import '../../domain/entities/flight_draft.dart';
import '../../domain/entities/itinerary_draft.dart';
import '../../domain/entities/itinerary_item.dart';
import '../../domain/entities/lodging.dart';
import '../../domain/entities/lodging_draft.dart';
import 'instant_converter.dart';

part 'logistics_models.freezed.dart';
part 'logistics_models.g.dart';

String? _blankToNull(String value) => value.isEmpty ? null : value;

/// Row of `public.flights`.
@freezed
abstract class FlightModel with _$FlightModel {
  const factory FlightModel({
    required String id,
    required String tripId,
    required String airline,
    required String flightNumber,
    required String origin,
    required String destination,
    @InstantConverter() required DateTime departsAt,
    required String departureTz,
    @InstantConverter() required DateTime arrivesAt,
    required String arrivalTz,
    String? terminal,
  }) = _FlightModel;

  const FlightModel._();

  factory FlightModel.fromJson(Map<String, dynamic> json) =>
      _$FlightModelFromJson(json);

  static const String columns =
      'id, trip_id, airline, flight_number, origin, destination, departs_at, '
      'departure_tz, arrives_at, arrival_tz, terminal';

  static Map<String, dynamic> draftToJson(FlightDraft draft) {
    assert(draft.isValid, 'Only valid drafts reach the data layer');
    const instant = InstantConverter();
    return {
      'airline': draft.airline,
      'flight_number': draft.flightNumber,
      'origin': draft.origin,
      'destination': draft.destination,
      'departs_at': instant.toJson(draft.departsAt!),
      'departure_tz': draft.departureTz,
      'arrives_at': instant.toJson(draft.arrivesAt!),
      'arrival_tz': draft.arrivalTz,
      'terminal': _blankToNull(draft.terminal),
    };
  }

  Flight toEntity() => Flight(
    id: id,
    tripId: tripId,
    airline: airline,
    flightNumber: flightNumber,
    origin: origin,
    destination: destination,
    departsAt: departsAt,
    departureTz: departureTz,
    arrivesAt: arrivesAt,
    arrivalTz: arrivalTz,
    terminal: terminal,
  );
}

/// Row of `public.lodgings`.
@freezed
abstract class LodgingModel with _$LodgingModel {
  const factory LodgingModel({
    required String id,
    required String tripId,
    required String name,
    String? address,
    double? latitude,
    double? longitude,
    @InstantConverter() required DateTime checkInAt,
    @InstantConverter() required DateTime checkOutAt,
    required String timezone,
  }) = _LodgingModel;

  const LodgingModel._();

  factory LodgingModel.fromJson(Map<String, dynamic> json) =>
      _$LodgingModelFromJson(json);

  static const String columns =
      'id, trip_id, name, address, latitude, longitude, check_in_at, '
      'check_out_at, timezone';

  static Map<String, dynamic> draftToJson(LodgingDraft draft) {
    assert(draft.isValid, 'Only valid drafts reach the data layer');
    const instant = InstantConverter();
    return {
      'name': draft.name,
      'address': _blankToNull(draft.address),
      'latitude': draft.latitudeValue,
      'longitude': draft.longitudeValue,
      'check_in_at': instant.toJson(draft.checkInAt!),
      'check_out_at': instant.toJson(draft.checkOutAt!),
      'timezone': draft.timezone,
    };
  }

  Lodging toEntity() => Lodging(
    id: id,
    tripId: tripId,
    name: name,
    address: address,
    latitude: latitude,
    longitude: longitude,
    checkInAt: checkInAt,
    checkOutAt: checkOutAt,
    timezone: timezone,
  );
}

/// Row of `public.itinerary_items`.
@freezed
abstract class ItineraryItemModel with _$ItineraryItemModel {
  const factory ItineraryItemModel({
    required String id,
    required String tripId,
    String? bookingId,
    @InstantConverter() required DateTime startsAt,
    @NullableInstantConverter() DateTime? endsAt,
    required String timezone,
    required String title,
    String? description,
    String? location,
  }) = _ItineraryItemModel;

  const ItineraryItemModel._();

  factory ItineraryItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItineraryItemModelFromJson(json);

  static const String columns =
      'id, trip_id, booking_id, starts_at, ends_at, timezone, title, '
      'description, location';

  /// A null booking_id makes the item apply to the whole group. The database
  /// rejects a booking from another trip.
  static Map<String, dynamic> draftToJson(ItineraryDraft draft) {
    assert(draft.isValid, 'Only valid drafts reach the data layer');
    const instant = InstantConverter();
    const optional = NullableInstantConverter();
    return {
      'starts_at': instant.toJson(draft.startsAt!),
      'ends_at': optional.toJson(draft.endsAt),
      'timezone': draft.timezone,
      'title': draft.title,
      'description': _blankToNull(draft.description),
      'location': _blankToNull(draft.location),
      'booking_id': draft.bookingId,
    };
  }

  ItineraryItem toEntity() => ItineraryItem(
    id: id,
    tripId: tripId,
    bookingId: bookingId,
    startsAt: startsAt,
    endsAt: endsAt,
    timezone: timezone,
    title: title,
    description: description,
    location: location,
  );
}
