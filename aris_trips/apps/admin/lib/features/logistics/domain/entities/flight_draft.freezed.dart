// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FlightDraft {

 String get airline; String get flightNumber; String get origin; String get destination; DateTime? get departsLocal; String get departureTz; DateTime? get arrivesLocal; String get arrivalTz; String get terminal;
/// Create a copy of FlightDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlightDraftCopyWith<FlightDraft> get copyWith => _$FlightDraftCopyWithImpl<FlightDraft>(this as FlightDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as FlightDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightDraft&&(identical(other.airline, _this.airline) || other.airline == _this.airline)&&(identical(other.flightNumber, _this.flightNumber) || other.flightNumber == _this.flightNumber)&&(identical(other.origin, _this.origin) || other.origin == _this.origin)&&(identical(other.destination, _this.destination) || other.destination == _this.destination)&&(identical(other.departsLocal, _this.departsLocal) || other.departsLocal == _this.departsLocal)&&(identical(other.departureTz, _this.departureTz) || other.departureTz == _this.departureTz)&&(identical(other.arrivesLocal, _this.arrivesLocal) || other.arrivesLocal == _this.arrivesLocal)&&(identical(other.arrivalTz, _this.arrivalTz) || other.arrivalTz == _this.arrivalTz)&&(identical(other.terminal, _this.terminal) || other.terminal == _this.terminal));
}


@override
int get hashCode {
  final _this = this as FlightDraft;
  return Object.hash(runtimeType,_this.airline,_this.flightNumber,_this.origin,_this.destination,_this.departsLocal,_this.departureTz,_this.arrivesLocal,_this.arrivalTz,_this.terminal);
}

@override
String toString() {
  final _this = this as FlightDraft;
  return 'FlightDraft(airline: ${_this.airline}, flightNumber: ${_this.flightNumber}, origin: ${_this.origin}, destination: ${_this.destination}, departsLocal: ${_this.departsLocal}, departureTz: ${_this.departureTz}, arrivesLocal: ${_this.arrivesLocal}, arrivalTz: ${_this.arrivalTz}, terminal: ${_this.terminal})';
}


}

/// @nodoc
abstract mixin class $FlightDraftCopyWith<$Res>  {
  factory $FlightDraftCopyWith(FlightDraft value, $Res Function(FlightDraft) _then) = _$FlightDraftCopyWithImpl;
@useResult
$Res call({
 String airline, String flightNumber, String origin, String destination, DateTime? departsLocal, String departureTz, DateTime? arrivesLocal, String arrivalTz, String terminal
});




}
/// @nodoc
class _$FlightDraftCopyWithImpl<$Res>
    implements $FlightDraftCopyWith<$Res> {
  _$FlightDraftCopyWithImpl(this._self, this._then);

  final FlightDraft _self;
  final $Res Function(FlightDraft) _then;

/// Create a copy of FlightDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? airline = null,Object? flightNumber = null,Object? origin = null,Object? destination = null,Object? departsLocal = freezed,Object? departureTz = null,Object? arrivesLocal = freezed,Object? arrivalTz = null,Object? terminal = null,}) {
  return _then(FlightDraft(
airline: null == airline ? _self.airline : airline // ignore: cast_nullable_to_non_nullable
as String,flightNumber: null == flightNumber ? _self.flightNumber : flightNumber // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,departsLocal: freezed == departsLocal ? _self.departsLocal : departsLocal // ignore: cast_nullable_to_non_nullable
as DateTime?,departureTz: null == departureTz ? _self.departureTz : departureTz // ignore: cast_nullable_to_non_nullable
as String,arrivesLocal: freezed == arrivesLocal ? _self.arrivesLocal : arrivesLocal // ignore: cast_nullable_to_non_nullable
as DateTime?,arrivalTz: null == arrivalTz ? _self.arrivalTz : arrivalTz // ignore: cast_nullable_to_non_nullable
as String,terminal: null == terminal ? _self.terminal : terminal // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FlightDraft].
extension FlightDraftPatterns on FlightDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlightDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlightDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlightDraft value)  $default,){
final _that = this;
switch (_that) {
case _FlightDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlightDraft value)?  $default,){
final _that = this;
switch (_that) {
case _FlightDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String airline,  String flightNumber,  String origin,  String destination,  DateTime? departsLocal,  String departureTz,  DateTime? arrivesLocal,  String arrivalTz,  String terminal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlightDraft() when $default != null:
return $default(_that.airline,_that.flightNumber,_that.origin,_that.destination,_that.departsLocal,_that.departureTz,_that.arrivesLocal,_that.arrivalTz,_that.terminal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String airline,  String flightNumber,  String origin,  String destination,  DateTime? departsLocal,  String departureTz,  DateTime? arrivesLocal,  String arrivalTz,  String terminal)  $default,) {final _that = this;
switch (_that) {
case _FlightDraft():
return $default(_that.airline,_that.flightNumber,_that.origin,_that.destination,_that.departsLocal,_that.departureTz,_that.arrivesLocal,_that.arrivalTz,_that.terminal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String airline,  String flightNumber,  String origin,  String destination,  DateTime? departsLocal,  String departureTz,  DateTime? arrivesLocal,  String arrivalTz,  String terminal)?  $default,) {final _that = this;
switch (_that) {
case _FlightDraft() when $default != null:
return $default(_that.airline,_that.flightNumber,_that.origin,_that.destination,_that.departsLocal,_that.departureTz,_that.arrivesLocal,_that.arrivalTz,_that.terminal);case _:
  return null;

}
}

}

/// @nodoc


class _FlightDraft extends FlightDraft {
  const _FlightDraft({this.airline = '', this.flightNumber = '', this.origin = '', this.destination = '', this.departsLocal, this.departureTz = TimeZones.defaultZone, this.arrivesLocal, this.arrivalTz = TimeZones.defaultZone, this.terminal = ''}): super._();
  

@override@JsonKey() final  String airline;
@override@JsonKey() final  String flightNumber;
@override@JsonKey() final  String origin;
@override@JsonKey() final  String destination;
@override final  DateTime? departsLocal;
@override@JsonKey() final  String departureTz;
@override final  DateTime? arrivesLocal;
@override@JsonKey() final  String arrivalTz;
@override@JsonKey() final  String terminal;

/// Create a copy of FlightDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlightDraftCopyWith<_FlightDraft> get copyWith => __$FlightDraftCopyWithImpl<_FlightDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlightDraft&&(identical(other.airline, airline) || other.airline == airline)&&(identical(other.flightNumber, flightNumber) || other.flightNumber == flightNumber)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.departsLocal, departsLocal) || other.departsLocal == departsLocal)&&(identical(other.departureTz, departureTz) || other.departureTz == departureTz)&&(identical(other.arrivesLocal, arrivesLocal) || other.arrivesLocal == arrivesLocal)&&(identical(other.arrivalTz, arrivalTz) || other.arrivalTz == arrivalTz)&&(identical(other.terminal, terminal) || other.terminal == terminal));
}


@override
int get hashCode {
    return Object.hash(runtimeType,airline,flightNumber,origin,destination,departsLocal,departureTz,arrivesLocal,arrivalTz,terminal);
}

@override
String toString() {
    return 'FlightDraft(airline: $airline, flightNumber: $flightNumber, origin: $origin, destination: $destination, departsLocal: $departsLocal, departureTz: $departureTz, arrivesLocal: $arrivesLocal, arrivalTz: $arrivalTz, terminal: $terminal)';
}


}

/// @nodoc
abstract mixin class _$FlightDraftCopyWith<$Res> implements $FlightDraftCopyWith<$Res> {
  factory _$FlightDraftCopyWith(_FlightDraft value, $Res Function(_FlightDraft) _then) = __$FlightDraftCopyWithImpl;
@override @useResult
$Res call({
 String airline, String flightNumber, String origin, String destination, DateTime? departsLocal, String departureTz, DateTime? arrivesLocal, String arrivalTz, String terminal
});




}
/// @nodoc
class __$FlightDraftCopyWithImpl<$Res>
    implements _$FlightDraftCopyWith<$Res> {
  __$FlightDraftCopyWithImpl(this._self, this._then);

  final _FlightDraft _self;
  final $Res Function(_FlightDraft) _then;

/// Create a copy of FlightDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? airline = null,Object? flightNumber = null,Object? origin = null,Object? destination = null,Object? departsLocal = freezed,Object? departureTz = null,Object? arrivesLocal = freezed,Object? arrivalTz = null,Object? terminal = null,}) {
  return _then(_FlightDraft(
airline: null == airline ? _self.airline : airline // ignore: cast_nullable_to_non_nullable
as String,flightNumber: null == flightNumber ? _self.flightNumber : flightNumber // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,departsLocal: freezed == departsLocal ? _self.departsLocal : departsLocal // ignore: cast_nullable_to_non_nullable
as DateTime?,departureTz: null == departureTz ? _self.departureTz : departureTz // ignore: cast_nullable_to_non_nullable
as String,arrivesLocal: freezed == arrivesLocal ? _self.arrivesLocal : arrivesLocal // ignore: cast_nullable_to_non_nullable
as DateTime?,arrivalTz: null == arrivalTz ? _self.arrivalTz : arrivalTz // ignore: cast_nullable_to_non_nullable
as String,terminal: null == terminal ? _self.terminal : terminal // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
