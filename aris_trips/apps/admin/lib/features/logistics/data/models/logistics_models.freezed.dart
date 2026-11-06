// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logistics_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FlightModel {

 String get id; String get tripId; String get airline; String get flightNumber; String get origin; String get destination;@InstantConverter() DateTime get departsAt; String get departureTz;@InstantConverter() DateTime get arrivesAt; String get arrivalTz; String? get terminal;
/// Create a copy of FlightModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlightModelCopyWith<FlightModel> get copyWith => _$FlightModelCopyWithImpl<FlightModel>(this as FlightModel, _$identity);

  /// Serializes this FlightModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FlightModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.tripId, _this.tripId) || other.tripId == _this.tripId)&&(identical(other.airline, _this.airline) || other.airline == _this.airline)&&(identical(other.flightNumber, _this.flightNumber) || other.flightNumber == _this.flightNumber)&&(identical(other.origin, _this.origin) || other.origin == _this.origin)&&(identical(other.destination, _this.destination) || other.destination == _this.destination)&&(identical(other.departsAt, _this.departsAt) || other.departsAt == _this.departsAt)&&(identical(other.departureTz, _this.departureTz) || other.departureTz == _this.departureTz)&&(identical(other.arrivesAt, _this.arrivesAt) || other.arrivesAt == _this.arrivesAt)&&(identical(other.arrivalTz, _this.arrivalTz) || other.arrivalTz == _this.arrivalTz)&&(identical(other.terminal, _this.terminal) || other.terminal == _this.terminal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FlightModel;
  return Object.hash(runtimeType,_this.id,_this.tripId,_this.airline,_this.flightNumber,_this.origin,_this.destination,_this.departsAt,_this.departureTz,_this.arrivesAt,_this.arrivalTz,_this.terminal);
}

@override
String toString() {
  final _this = this as FlightModel;
  return 'FlightModel(id: ${_this.id}, tripId: ${_this.tripId}, airline: ${_this.airline}, flightNumber: ${_this.flightNumber}, origin: ${_this.origin}, destination: ${_this.destination}, departsAt: ${_this.departsAt}, departureTz: ${_this.departureTz}, arrivesAt: ${_this.arrivesAt}, arrivalTz: ${_this.arrivalTz}, terminal: ${_this.terminal})';
}


}

/// @nodoc
abstract mixin class $FlightModelCopyWith<$Res>  {
  factory $FlightModelCopyWith(FlightModel value, $Res Function(FlightModel) _then) = _$FlightModelCopyWithImpl;
@useResult
$Res call({
 String id, String tripId, String airline, String flightNumber, String origin, String destination,@InstantConverter() DateTime departsAt, String departureTz,@InstantConverter() DateTime arrivesAt, String arrivalTz, String? terminal
});




}
/// @nodoc
class _$FlightModelCopyWithImpl<$Res>
    implements $FlightModelCopyWith<$Res> {
  _$FlightModelCopyWithImpl(this._self, this._then);

  final FlightModel _self;
  final $Res Function(FlightModel) _then;

/// Create a copy of FlightModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tripId = null,Object? airline = null,Object? flightNumber = null,Object? origin = null,Object? destination = null,Object? departsAt = null,Object? departureTz = null,Object? arrivesAt = null,Object? arrivalTz = null,Object? terminal = freezed,}) {
  return _then(FlightModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as String,airline: null == airline ? _self.airline : airline // ignore: cast_nullable_to_non_nullable
as String,flightNumber: null == flightNumber ? _self.flightNumber : flightNumber // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,departsAt: null == departsAt ? _self.departsAt : departsAt // ignore: cast_nullable_to_non_nullable
as DateTime,departureTz: null == departureTz ? _self.departureTz : departureTz // ignore: cast_nullable_to_non_nullable
as String,arrivesAt: null == arrivesAt ? _self.arrivesAt : arrivesAt // ignore: cast_nullable_to_non_nullable
as DateTime,arrivalTz: null == arrivalTz ? _self.arrivalTz : arrivalTz // ignore: cast_nullable_to_non_nullable
as String,terminal: freezed == terminal ? _self.terminal : terminal // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FlightModel].
extension FlightModelPatterns on FlightModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlightModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlightModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlightModel value)  $default,){
final _that = this;
switch (_that) {
case _FlightModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlightModel value)?  $default,){
final _that = this;
switch (_that) {
case _FlightModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tripId,  String airline,  String flightNumber,  String origin,  String destination, @InstantConverter()  DateTime departsAt,  String departureTz, @InstantConverter()  DateTime arrivesAt,  String arrivalTz,  String? terminal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlightModel() when $default != null:
return $default(_that.id,_that.tripId,_that.airline,_that.flightNumber,_that.origin,_that.destination,_that.departsAt,_that.departureTz,_that.arrivesAt,_that.arrivalTz,_that.terminal);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tripId,  String airline,  String flightNumber,  String origin,  String destination, @InstantConverter()  DateTime departsAt,  String departureTz, @InstantConverter()  DateTime arrivesAt,  String arrivalTz,  String? terminal)  $default,) {final _that = this;
switch (_that) {
case _FlightModel():
return $default(_that.id,_that.tripId,_that.airline,_that.flightNumber,_that.origin,_that.destination,_that.departsAt,_that.departureTz,_that.arrivesAt,_that.arrivalTz,_that.terminal);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tripId,  String airline,  String flightNumber,  String origin,  String destination, @InstantConverter()  DateTime departsAt,  String departureTz, @InstantConverter()  DateTime arrivesAt,  String arrivalTz,  String? terminal)?  $default,) {final _that = this;
switch (_that) {
case _FlightModel() when $default != null:
return $default(_that.id,_that.tripId,_that.airline,_that.flightNumber,_that.origin,_that.destination,_that.departsAt,_that.departureTz,_that.arrivesAt,_that.arrivalTz,_that.terminal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlightModel extends FlightModel {
  const _FlightModel({required this.id, required this.tripId, required this.airline, required this.flightNumber, required this.origin, required this.destination, @InstantConverter() required this.departsAt, required this.departureTz, @InstantConverter() required this.arrivesAt, required this.arrivalTz, this.terminal}): super._();
  factory _FlightModel.fromJson(Map<String, dynamic> json) => _$FlightModelFromJson(json);

@override final  String id;
@override final  String tripId;
@override final  String airline;
@override final  String flightNumber;
@override final  String origin;
@override final  String destination;
@override@InstantConverter() final  DateTime departsAt;
@override final  String departureTz;
@override@InstantConverter() final  DateTime arrivesAt;
@override final  String arrivalTz;
@override final  String? terminal;

/// Create a copy of FlightModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlightModelCopyWith<_FlightModel> get copyWith => __$FlightModelCopyWithImpl<_FlightModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlightModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlightModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.airline, airline) || other.airline == airline)&&(identical(other.flightNumber, flightNumber) || other.flightNumber == flightNumber)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.departsAt, departsAt) || other.departsAt == departsAt)&&(identical(other.departureTz, departureTz) || other.departureTz == departureTz)&&(identical(other.arrivesAt, arrivesAt) || other.arrivesAt == arrivesAt)&&(identical(other.arrivalTz, arrivalTz) || other.arrivalTz == arrivalTz)&&(identical(other.terminal, terminal) || other.terminal == terminal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,tripId,airline,flightNumber,origin,destination,departsAt,departureTz,arrivesAt,arrivalTz,terminal);
}

@override
String toString() {
    return 'FlightModel(id: $id, tripId: $tripId, airline: $airline, flightNumber: $flightNumber, origin: $origin, destination: $destination, departsAt: $departsAt, departureTz: $departureTz, arrivesAt: $arrivesAt, arrivalTz: $arrivalTz, terminal: $terminal)';
}


}

/// @nodoc
abstract mixin class _$FlightModelCopyWith<$Res> implements $FlightModelCopyWith<$Res> {
  factory _$FlightModelCopyWith(_FlightModel value, $Res Function(_FlightModel) _then) = __$FlightModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String tripId, String airline, String flightNumber, String origin, String destination,@InstantConverter() DateTime departsAt, String departureTz,@InstantConverter() DateTime arrivesAt, String arrivalTz, String? terminal
});




}
/// @nodoc
class __$FlightModelCopyWithImpl<$Res>
    implements _$FlightModelCopyWith<$Res> {
  __$FlightModelCopyWithImpl(this._self, this._then);

  final _FlightModel _self;
  final $Res Function(_FlightModel) _then;

/// Create a copy of FlightModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tripId = null,Object? airline = null,Object? flightNumber = null,Object? origin = null,Object? destination = null,Object? departsAt = null,Object? departureTz = null,Object? arrivesAt = null,Object? arrivalTz = null,Object? terminal = freezed,}) {
  return _then(_FlightModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as String,airline: null == airline ? _self.airline : airline // ignore: cast_nullable_to_non_nullable
as String,flightNumber: null == flightNumber ? _self.flightNumber : flightNumber // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,departsAt: null == departsAt ? _self.departsAt : departsAt // ignore: cast_nullable_to_non_nullable
as DateTime,departureTz: null == departureTz ? _self.departureTz : departureTz // ignore: cast_nullable_to_non_nullable
as String,arrivesAt: null == arrivesAt ? _self.arrivesAt : arrivesAt // ignore: cast_nullable_to_non_nullable
as DateTime,arrivalTz: null == arrivalTz ? _self.arrivalTz : arrivalTz // ignore: cast_nullable_to_non_nullable
as String,terminal: freezed == terminal ? _self.terminal : terminal // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LodgingModel {

 String get id; String get tripId; String get name; String? get address; double? get latitude; double? get longitude;@InstantConverter() DateTime get checkInAt;@InstantConverter() DateTime get checkOutAt; String get timezone;
/// Create a copy of LodgingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LodgingModelCopyWith<LodgingModel> get copyWith => _$LodgingModelCopyWithImpl<LodgingModel>(this as LodgingModel, _$identity);

  /// Serializes this LodgingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LodgingModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LodgingModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.tripId, _this.tripId) || other.tripId == _this.tripId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.checkInAt, _this.checkInAt) || other.checkInAt == _this.checkInAt)&&(identical(other.checkOutAt, _this.checkOutAt) || other.checkOutAt == _this.checkOutAt)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LodgingModel;
  return Object.hash(runtimeType,_this.id,_this.tripId,_this.name,_this.address,_this.latitude,_this.longitude,_this.checkInAt,_this.checkOutAt,_this.timezone);
}

@override
String toString() {
  final _this = this as LodgingModel;
  return 'LodgingModel(id: ${_this.id}, tripId: ${_this.tripId}, name: ${_this.name}, address: ${_this.address}, latitude: ${_this.latitude}, longitude: ${_this.longitude}, checkInAt: ${_this.checkInAt}, checkOutAt: ${_this.checkOutAt}, timezone: ${_this.timezone})';
}


}

/// @nodoc
abstract mixin class $LodgingModelCopyWith<$Res>  {
  factory $LodgingModelCopyWith(LodgingModel value, $Res Function(LodgingModel) _then) = _$LodgingModelCopyWithImpl;
@useResult
$Res call({
 String id, String tripId, String name, String? address, double? latitude, double? longitude,@InstantConverter() DateTime checkInAt,@InstantConverter() DateTime checkOutAt, String timezone
});




}
/// @nodoc
class _$LodgingModelCopyWithImpl<$Res>
    implements $LodgingModelCopyWith<$Res> {
  _$LodgingModelCopyWithImpl(this._self, this._then);

  final LodgingModel _self;
  final $Res Function(LodgingModel) _then;

/// Create a copy of LodgingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tripId = null,Object? name = null,Object? address = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? checkInAt = null,Object? checkOutAt = null,Object? timezone = null,}) {
  return _then(LodgingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,checkInAt: null == checkInAt ? _self.checkInAt : checkInAt // ignore: cast_nullable_to_non_nullable
as DateTime,checkOutAt: null == checkOutAt ? _self.checkOutAt : checkOutAt // ignore: cast_nullable_to_non_nullable
as DateTime,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LodgingModel].
extension LodgingModelPatterns on LodgingModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LodgingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LodgingModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LodgingModel value)  $default,){
final _that = this;
switch (_that) {
case _LodgingModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LodgingModel value)?  $default,){
final _that = this;
switch (_that) {
case _LodgingModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tripId,  String name,  String? address,  double? latitude,  double? longitude, @InstantConverter()  DateTime checkInAt, @InstantConverter()  DateTime checkOutAt,  String timezone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LodgingModel() when $default != null:
return $default(_that.id,_that.tripId,_that.name,_that.address,_that.latitude,_that.longitude,_that.checkInAt,_that.checkOutAt,_that.timezone);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tripId,  String name,  String? address,  double? latitude,  double? longitude, @InstantConverter()  DateTime checkInAt, @InstantConverter()  DateTime checkOutAt,  String timezone)  $default,) {final _that = this;
switch (_that) {
case _LodgingModel():
return $default(_that.id,_that.tripId,_that.name,_that.address,_that.latitude,_that.longitude,_that.checkInAt,_that.checkOutAt,_that.timezone);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tripId,  String name,  String? address,  double? latitude,  double? longitude, @InstantConverter()  DateTime checkInAt, @InstantConverter()  DateTime checkOutAt,  String timezone)?  $default,) {final _that = this;
switch (_that) {
case _LodgingModel() when $default != null:
return $default(_that.id,_that.tripId,_that.name,_that.address,_that.latitude,_that.longitude,_that.checkInAt,_that.checkOutAt,_that.timezone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LodgingModel extends LodgingModel {
  const _LodgingModel({required this.id, required this.tripId, required this.name, this.address, this.latitude, this.longitude, @InstantConverter() required this.checkInAt, @InstantConverter() required this.checkOutAt, required this.timezone}): super._();
  factory _LodgingModel.fromJson(Map<String, dynamic> json) => _$LodgingModelFromJson(json);

@override final  String id;
@override final  String tripId;
@override final  String name;
@override final  String? address;
@override final  double? latitude;
@override final  double? longitude;
@override@InstantConverter() final  DateTime checkInAt;
@override@InstantConverter() final  DateTime checkOutAt;
@override final  String timezone;

/// Create a copy of LodgingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LodgingModelCopyWith<_LodgingModel> get copyWith => __$LodgingModelCopyWithImpl<_LodgingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LodgingModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LodgingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.checkInAt, checkInAt) || other.checkInAt == checkInAt)&&(identical(other.checkOutAt, checkOutAt) || other.checkOutAt == checkOutAt)&&(identical(other.timezone, timezone) || other.timezone == timezone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,tripId,name,address,latitude,longitude,checkInAt,checkOutAt,timezone);
}

@override
String toString() {
    return 'LodgingModel(id: $id, tripId: $tripId, name: $name, address: $address, latitude: $latitude, longitude: $longitude, checkInAt: $checkInAt, checkOutAt: $checkOutAt, timezone: $timezone)';
}


}

/// @nodoc
abstract mixin class _$LodgingModelCopyWith<$Res> implements $LodgingModelCopyWith<$Res> {
  factory _$LodgingModelCopyWith(_LodgingModel value, $Res Function(_LodgingModel) _then) = __$LodgingModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String tripId, String name, String? address, double? latitude, double? longitude,@InstantConverter() DateTime checkInAt,@InstantConverter() DateTime checkOutAt, String timezone
});




}
/// @nodoc
class __$LodgingModelCopyWithImpl<$Res>
    implements _$LodgingModelCopyWith<$Res> {
  __$LodgingModelCopyWithImpl(this._self, this._then);

  final _LodgingModel _self;
  final $Res Function(_LodgingModel) _then;

/// Create a copy of LodgingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tripId = null,Object? name = null,Object? address = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? checkInAt = null,Object? checkOutAt = null,Object? timezone = null,}) {
  return _then(_LodgingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,checkInAt: null == checkInAt ? _self.checkInAt : checkInAt // ignore: cast_nullable_to_non_nullable
as DateTime,checkOutAt: null == checkOutAt ? _self.checkOutAt : checkOutAt // ignore: cast_nullable_to_non_nullable
as DateTime,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ItineraryItemModel {

 String get id; String get tripId; String? get bookingId;@InstantConverter() DateTime get startsAt;@NullableInstantConverter() DateTime? get endsAt; String get timezone; String get title; String? get description; String? get location;
/// Create a copy of ItineraryItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItineraryItemModelCopyWith<ItineraryItemModel> get copyWith => _$ItineraryItemModelCopyWithImpl<ItineraryItemModel>(this as ItineraryItemModel, _$identity);

  /// Serializes this ItineraryItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ItineraryItemModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItineraryItemModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.tripId, _this.tripId) || other.tripId == _this.tripId)&&(identical(other.bookingId, _this.bookingId) || other.bookingId == _this.bookingId)&&(identical(other.startsAt, _this.startsAt) || other.startsAt == _this.startsAt)&&(identical(other.endsAt, _this.endsAt) || other.endsAt == _this.endsAt)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.location, _this.location) || other.location == _this.location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ItineraryItemModel;
  return Object.hash(runtimeType,_this.id,_this.tripId,_this.bookingId,_this.startsAt,_this.endsAt,_this.timezone,_this.title,_this.description,_this.location);
}

@override
String toString() {
  final _this = this as ItineraryItemModel;
  return 'ItineraryItemModel(id: ${_this.id}, tripId: ${_this.tripId}, bookingId: ${_this.bookingId}, startsAt: ${_this.startsAt}, endsAt: ${_this.endsAt}, timezone: ${_this.timezone}, title: ${_this.title}, description: ${_this.description}, location: ${_this.location})';
}


}

/// @nodoc
abstract mixin class $ItineraryItemModelCopyWith<$Res>  {
  factory $ItineraryItemModelCopyWith(ItineraryItemModel value, $Res Function(ItineraryItemModel) _then) = _$ItineraryItemModelCopyWithImpl;
@useResult
$Res call({
 String id, String tripId, String? bookingId,@InstantConverter() DateTime startsAt,@NullableInstantConverter() DateTime? endsAt, String timezone, String title, String? description, String? location
});




}
/// @nodoc
class _$ItineraryItemModelCopyWithImpl<$Res>
    implements $ItineraryItemModelCopyWith<$Res> {
  _$ItineraryItemModelCopyWithImpl(this._self, this._then);

  final ItineraryItemModel _self;
  final $Res Function(ItineraryItemModel) _then;

/// Create a copy of ItineraryItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tripId = null,Object? bookingId = freezed,Object? startsAt = null,Object? endsAt = freezed,Object? timezone = null,Object? title = null,Object? description = freezed,Object? location = freezed,}) {
  return _then(ItineraryItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as String,bookingId: freezed == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String?,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ItineraryItemModel].
extension ItineraryItemModelPatterns on ItineraryItemModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItineraryItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItineraryItemModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItineraryItemModel value)  $default,){
final _that = this;
switch (_that) {
case _ItineraryItemModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItineraryItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _ItineraryItemModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tripId,  String? bookingId, @InstantConverter()  DateTime startsAt, @NullableInstantConverter()  DateTime? endsAt,  String timezone,  String title,  String? description,  String? location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItineraryItemModel() when $default != null:
return $default(_that.id,_that.tripId,_that.bookingId,_that.startsAt,_that.endsAt,_that.timezone,_that.title,_that.description,_that.location);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tripId,  String? bookingId, @InstantConverter()  DateTime startsAt, @NullableInstantConverter()  DateTime? endsAt,  String timezone,  String title,  String? description,  String? location)  $default,) {final _that = this;
switch (_that) {
case _ItineraryItemModel():
return $default(_that.id,_that.tripId,_that.bookingId,_that.startsAt,_that.endsAt,_that.timezone,_that.title,_that.description,_that.location);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tripId,  String? bookingId, @InstantConverter()  DateTime startsAt, @NullableInstantConverter()  DateTime? endsAt,  String timezone,  String title,  String? description,  String? location)?  $default,) {final _that = this;
switch (_that) {
case _ItineraryItemModel() when $default != null:
return $default(_that.id,_that.tripId,_that.bookingId,_that.startsAt,_that.endsAt,_that.timezone,_that.title,_that.description,_that.location);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ItineraryItemModel extends ItineraryItemModel {
  const _ItineraryItemModel({required this.id, required this.tripId, this.bookingId, @InstantConverter() required this.startsAt, @NullableInstantConverter() this.endsAt, required this.timezone, required this.title, this.description, this.location}): super._();
  factory _ItineraryItemModel.fromJson(Map<String, dynamic> json) => _$ItineraryItemModelFromJson(json);

@override final  String id;
@override final  String tripId;
@override final  String? bookingId;
@override@InstantConverter() final  DateTime startsAt;
@override@NullableInstantConverter() final  DateTime? endsAt;
@override final  String timezone;
@override final  String title;
@override final  String? description;
@override final  String? location;

/// Create a copy of ItineraryItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItineraryItemModelCopyWith<_ItineraryItemModel> get copyWith => __$ItineraryItemModelCopyWithImpl<_ItineraryItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItineraryItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItineraryItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,tripId,bookingId,startsAt,endsAt,timezone,title,description,location);
}

@override
String toString() {
    return 'ItineraryItemModel(id: $id, tripId: $tripId, bookingId: $bookingId, startsAt: $startsAt, endsAt: $endsAt, timezone: $timezone, title: $title, description: $description, location: $location)';
}


}

/// @nodoc
abstract mixin class _$ItineraryItemModelCopyWith<$Res> implements $ItineraryItemModelCopyWith<$Res> {
  factory _$ItineraryItemModelCopyWith(_ItineraryItemModel value, $Res Function(_ItineraryItemModel) _then) = __$ItineraryItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String tripId, String? bookingId,@InstantConverter() DateTime startsAt,@NullableInstantConverter() DateTime? endsAt, String timezone, String title, String? description, String? location
});




}
/// @nodoc
class __$ItineraryItemModelCopyWithImpl<$Res>
    implements _$ItineraryItemModelCopyWith<$Res> {
  __$ItineraryItemModelCopyWithImpl(this._self, this._then);

  final _ItineraryItemModel _self;
  final $Res Function(_ItineraryItemModel) _then;

/// Create a copy of ItineraryItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tripId = null,Object? bookingId = freezed,Object? startsAt = null,Object? endsAt = freezed,Object? timezone = null,Object? title = null,Object? description = freezed,Object? location = freezed,}) {
  return _then(_ItineraryItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as String,bookingId: freezed == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String?,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
