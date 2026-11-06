// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logistics_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FlightModel _$FlightModelFromJson(Map<String, dynamic> json) => _FlightModel(
  id: json['id'] as String,
  tripId: json['trip_id'] as String,
  airline: json['airline'] as String,
  flightNumber: json['flight_number'] as String,
  origin: json['origin'] as String,
  destination: json['destination'] as String,
  departsAt: const InstantConverter().fromJson(json['departs_at'] as String),
  departureTz: json['departure_tz'] as String,
  arrivesAt: const InstantConverter().fromJson(json['arrives_at'] as String),
  arrivalTz: json['arrival_tz'] as String,
  terminal: json['terminal'] as String?,
);

Map<String, dynamic> _$FlightModelToJson(_FlightModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trip_id': instance.tripId,
      'airline': instance.airline,
      'flight_number': instance.flightNumber,
      'origin': instance.origin,
      'destination': instance.destination,
      'departs_at': const InstantConverter().toJson(instance.departsAt),
      'departure_tz': instance.departureTz,
      'arrives_at': const InstantConverter().toJson(instance.arrivesAt),
      'arrival_tz': instance.arrivalTz,
      'terminal': instance.terminal,
    };

_LodgingModel _$LodgingModelFromJson(
  Map<String, dynamic> json,
) => _LodgingModel(
  id: json['id'] as String,
  tripId: json['trip_id'] as String,
  name: json['name'] as String,
  address: json['address'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  checkInAt: const InstantConverter().fromJson(json['check_in_at'] as String),
  checkOutAt: const InstantConverter().fromJson(json['check_out_at'] as String),
  timezone: json['timezone'] as String,
);

Map<String, dynamic> _$LodgingModelToJson(_LodgingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trip_id': instance.tripId,
      'name': instance.name,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'check_in_at': const InstantConverter().toJson(instance.checkInAt),
      'check_out_at': const InstantConverter().toJson(instance.checkOutAt),
      'timezone': instance.timezone,
    };

_ItineraryItemModel _$ItineraryItemModelFromJson(Map<String, dynamic> json) =>
    _ItineraryItemModel(
      id: json['id'] as String,
      tripId: json['trip_id'] as String,
      bookingId: json['booking_id'] as String?,
      startsAt: const InstantConverter().fromJson(json['starts_at'] as String),
      endsAt: const NullableInstantConverter().fromJson(
        json['ends_at'] as String?,
      ),
      timezone: json['timezone'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$ItineraryItemModelToJson(_ItineraryItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trip_id': instance.tripId,
      'booking_id': instance.bookingId,
      'starts_at': const InstantConverter().toJson(instance.startsAt),
      'ends_at': const NullableInstantConverter().toJson(instance.endsAt),
      'timezone': instance.timezone,
      'title': instance.title,
      'description': instance.description,
      'location': instance.location,
    };
