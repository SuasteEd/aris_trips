// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TripModel _$TripModelFromJson(Map<String, dynamic> json) => _TripModel(
  id: json['id'] as String,
  name: json['name'] as String,
  destination: json['destination'] as String,
  description: json['description'] as String?,
  coverPath: json['cover_path'] as String?,
  startDate: const DateOnlyConverter().fromJson(json['start_date'] as String),
  endDate: const DateOnlyConverter().fromJson(json['end_date'] as String),
  status: json['status'] as String,
);

Map<String, dynamic> _$TripModelToJson(_TripModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'destination': instance.destination,
      'description': instance.description,
      'cover_path': instance.coverPath,
      'start_date': const DateOnlyConverter().toJson(instance.startDate),
      'end_date': const DateOnlyConverter().toJson(instance.endDate),
      'status': instance.status,
    };
