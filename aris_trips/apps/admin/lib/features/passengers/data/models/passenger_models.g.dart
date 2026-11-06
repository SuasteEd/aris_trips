// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passenger_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PassengerModel _$PassengerModelFromJson(Map<String, dynamic> json) =>
    _PassengerModel(
      id: json['id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$PassengerModelToJson(_PassengerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
    };

_FlightAssignmentModel _$FlightAssignmentModelFromJson(
  Map<String, dynamic> json,
) => _FlightAssignmentModel(
  id: json['id'] as String,
  bookingId: json['booking_id'] as String,
  flightId: json['flight_id'] as String,
  seat: json['seat'] as String?,
  recordLocator: json['record_locator'] as String?,
);

Map<String, dynamic> _$FlightAssignmentModelToJson(
  _FlightAssignmentModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'booking_id': instance.bookingId,
  'flight_id': instance.flightId,
  'seat': instance.seat,
  'record_locator': instance.recordLocator,
};

_LodgingAssignmentModel _$LodgingAssignmentModelFromJson(
  Map<String, dynamic> json,
) => _LodgingAssignmentModel(
  id: json['id'] as String,
  bookingId: json['booking_id'] as String,
  lodgingId: json['lodging_id'] as String,
  room: json['room'] as String?,
  confirmationNumber: json['confirmation_number'] as String?,
);

Map<String, dynamic> _$LodgingAssignmentModelToJson(
  _LodgingAssignmentModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'booking_id': instance.bookingId,
  'lodging_id': instance.lodgingId,
  'room': instance.room,
  'confirmation_number': instance.confirmationNumber,
};

_BookingModel _$BookingModelFromJson(Map<String, dynamic> json) =>
    _BookingModel(
      id: json['id'] as String,
      tripId: json['trip_id'] as String,
      status: json['status'] as String,
      notes: json['notes'] as String?,
      passenger: PassengerModel.fromJson(
        json['passenger'] as Map<String, dynamic>,
      ),
      flightAssignments:
          (json['flight_assignments'] as List<dynamic>?)
              ?.map(
                (e) =>
                    FlightAssignmentModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      lodgingAssignments:
          (json['lodging_assignments'] as List<dynamic>?)
              ?.map(
                (e) =>
                    LodgingAssignmentModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BookingModelToJson(_BookingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trip_id': instance.tripId,
      'status': instance.status,
      'notes': instance.notes,
      'passenger': instance.passenger.toJson(),
      'flight_assignments': instance.flightAssignments
          .map((e) => e.toJson())
          .toList(),
      'lodging_assignments': instance.lodgingAssignments
          .map((e) => e.toJson())
          .toList(),
    };
