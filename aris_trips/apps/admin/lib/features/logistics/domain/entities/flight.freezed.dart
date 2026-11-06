// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Flight {

 String get id; String get tripId; String get airline; String get flightNumber; String get origin; String get destination; DateTime get departsAt; String get departureTz; DateTime get arrivesAt; String get arrivalTz; String? get terminal;
/// Create a copy of Flight
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlightCopyWith<Flight> get copyWith => _$FlightCopyWithImpl<Flight>(this as Flight, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Flight;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Flight&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.tripId, _this.tripId) || other.tripId == _this.tripId)&&(identical(other.airline, _this.airline) || other.airline == _this.airline)&&(identical(other.flightNumber, _this.flightNumber) || other.flightNumber == _this.flightNumber)&&(identical(other.origin, _this.origin) || other.origin == _this.origin)&&(identical(other.destination, _this.destination) || other.destination == _this.destination)&&(identical(other.departsAt, _this.departsAt) || other.departsAt == _this.departsAt)&&(identical(other.departureTz, _this.departureTz) || other.departureTz == _this.departureTz)&&(identical(other.arrivesAt, _this.arrivesAt) || other.arrivesAt == _this.arrivesAt)&&(identical(other.arrivalTz, _this.arrivalTz) || other.arrivalTz == _this.arrivalTz)&&(identical(other.terminal, _this.terminal) || other.terminal == _this.terminal));
}


@override
int get hashCode {
  final _this = this as Flight;
  return Object.hash(runtimeType,_this.id,_this.tripId,_this.airline,_this.flightNumber,_this.origin,_this.destination,_this.departsAt,_this.departureTz,_this.arrivesAt,_this.arrivalTz,_this.terminal);
}

@override
String toString() {
  final _this = this as Flight;
  return 'Flight(id: ${_this.id}, tripId: ${_this.tripId}, airline: ${_this.airline}, flightNumber: ${_this.flightNumber}, origin: ${_this.origin}, destination: ${_this.destination}, departsAt: ${_this.departsAt}, departureTz: ${_this.departureTz}, arrivesAt: ${_this.arrivesAt}, arrivalTz: ${_this.arrivalTz}, terminal: ${_this.terminal})';
}


}

/// @nodoc
abstract mixin class $FlightCopyWith<$Res>  {
  factory $FlightCopyWith(Flight value, $Res Function(Flight) _then) = _$FlightCopyWithImpl;
@useResult
$Res call({
 String id, String tripId, String airline, String flightNumber, String origin, String destination, DateTime departsAt, String departureTz, DateTime arrivesAt, String arrivalTz, String? terminal
});




}
/// @nodoc
class _$FlightCopyWithImpl<$Res>
    implements $FlightCopyWith<$Res> {
  _$FlightCopyWithImpl(this._self, this._then);

  final Flight _self;
  final $Res Function(Flight) _then;

/// Create a copy of Flight
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tripId = null,Object? airline = null,Object? flightNumber = null,Object? origin = null,Object? destination = null,Object? departsAt = null,Object? departureTz = null,Object? arrivesAt = null,Object? arrivalTz = null,Object? terminal = freezed,}) {
  return _then(Flight(
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


/// Adds pattern-matching-related methods to [Flight].
extension FlightPatterns on Flight {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Flight value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Flight() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Flight value)  $default,){
final _that = this;
switch (_that) {
case _Flight():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Flight value)?  $default,){
final _that = this;
switch (_that) {
case _Flight() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tripId,  String airline,  String flightNumber,  String origin,  String destination,  DateTime departsAt,  String departureTz,  DateTime arrivesAt,  String arrivalTz,  String? terminal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Flight() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tripId,  String airline,  String flightNumber,  String origin,  String destination,  DateTime departsAt,  String departureTz,  DateTime arrivesAt,  String arrivalTz,  String? terminal)  $default,) {final _that = this;
switch (_that) {
case _Flight():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tripId,  String airline,  String flightNumber,  String origin,  String destination,  DateTime departsAt,  String departureTz,  DateTime arrivesAt,  String arrivalTz,  String? terminal)?  $default,) {final _that = this;
switch (_that) {
case _Flight() when $default != null:
return $default(_that.id,_that.tripId,_that.airline,_that.flightNumber,_that.origin,_that.destination,_that.departsAt,_that.departureTz,_that.arrivesAt,_that.arrivalTz,_that.terminal);case _:
  return null;

}
}

}

/// @nodoc


class _Flight extends Flight {
  const _Flight({required this.id, required this.tripId, required this.airline, required this.flightNumber, required this.origin, required this.destination, required this.departsAt, required this.departureTz, required this.arrivesAt, required this.arrivalTz, this.terminal}): super._();
  

@override final  String id;
@override final  String tripId;
@override final  String airline;
@override final  String flightNumber;
@override final  String origin;
@override final  String destination;
@override final  DateTime departsAt;
@override final  String departureTz;
@override final  DateTime arrivesAt;
@override final  String arrivalTz;
@override final  String? terminal;

/// Create a copy of Flight
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlightCopyWith<_Flight> get copyWith => __$FlightCopyWithImpl<_Flight>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Flight&&(identical(other.id, id) || other.id == id)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.airline, airline) || other.airline == airline)&&(identical(other.flightNumber, flightNumber) || other.flightNumber == flightNumber)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.departsAt, departsAt) || other.departsAt == departsAt)&&(identical(other.departureTz, departureTz) || other.departureTz == departureTz)&&(identical(other.arrivesAt, arrivesAt) || other.arrivesAt == arrivesAt)&&(identical(other.arrivalTz, arrivalTz) || other.arrivalTz == arrivalTz)&&(identical(other.terminal, terminal) || other.terminal == terminal));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,tripId,airline,flightNumber,origin,destination,departsAt,departureTz,arrivesAt,arrivalTz,terminal);
}

@override
String toString() {
    return 'Flight(id: $id, tripId: $tripId, airline: $airline, flightNumber: $flightNumber, origin: $origin, destination: $destination, departsAt: $departsAt, departureTz: $departureTz, arrivesAt: $arrivesAt, arrivalTz: $arrivalTz, terminal: $terminal)';
}


}

/// @nodoc
abstract mixin class _$FlightCopyWith<$Res> implements $FlightCopyWith<$Res> {
  factory _$FlightCopyWith(_Flight value, $Res Function(_Flight) _then) = __$FlightCopyWithImpl;
@override @useResult
$Res call({
 String id, String tripId, String airline, String flightNumber, String origin, String destination, DateTime departsAt, String departureTz, DateTime arrivesAt, String arrivalTz, String? terminal
});




}
/// @nodoc
class __$FlightCopyWithImpl<$Res>
    implements _$FlightCopyWith<$Res> {
  __$FlightCopyWithImpl(this._self, this._then);

  final _Flight _self;
  final $Res Function(_Flight) _then;

/// Create a copy of Flight
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tripId = null,Object? airline = null,Object? flightNumber = null,Object? origin = null,Object? destination = null,Object? departsAt = null,Object? departureTz = null,Object? arrivesAt = null,Object? arrivalTz = null,Object? terminal = freezed,}) {
  return _then(_Flight(
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

// dart format on
