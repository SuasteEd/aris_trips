// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lodging.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Lodging {

 String get id; String get tripId; String get name; String? get address; double? get latitude; double? get longitude; DateTime get checkInAt; DateTime get checkOutAt; String get timezone;
/// Create a copy of Lodging
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LodgingCopyWith<Lodging> get copyWith => _$LodgingCopyWithImpl<Lodging>(this as Lodging, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Lodging;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Lodging&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.tripId, _this.tripId) || other.tripId == _this.tripId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.checkInAt, _this.checkInAt) || other.checkInAt == _this.checkInAt)&&(identical(other.checkOutAt, _this.checkOutAt) || other.checkOutAt == _this.checkOutAt)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone));
}


@override
int get hashCode {
  final _this = this as Lodging;
  return Object.hash(runtimeType,_this.id,_this.tripId,_this.name,_this.address,_this.latitude,_this.longitude,_this.checkInAt,_this.checkOutAt,_this.timezone);
}

@override
String toString() {
  final _this = this as Lodging;
  return 'Lodging(id: ${_this.id}, tripId: ${_this.tripId}, name: ${_this.name}, address: ${_this.address}, latitude: ${_this.latitude}, longitude: ${_this.longitude}, checkInAt: ${_this.checkInAt}, checkOutAt: ${_this.checkOutAt}, timezone: ${_this.timezone})';
}


}

/// @nodoc
abstract mixin class $LodgingCopyWith<$Res>  {
  factory $LodgingCopyWith(Lodging value, $Res Function(Lodging) _then) = _$LodgingCopyWithImpl;
@useResult
$Res call({
 String id, String tripId, String name, String? address, double? latitude, double? longitude, DateTime checkInAt, DateTime checkOutAt, String timezone
});




}
/// @nodoc
class _$LodgingCopyWithImpl<$Res>
    implements $LodgingCopyWith<$Res> {
  _$LodgingCopyWithImpl(this._self, this._then);

  final Lodging _self;
  final $Res Function(Lodging) _then;

/// Create a copy of Lodging
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tripId = null,Object? name = null,Object? address = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? checkInAt = null,Object? checkOutAt = null,Object? timezone = null,}) {
  return _then(Lodging(
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


/// Adds pattern-matching-related methods to [Lodging].
extension LodgingPatterns on Lodging {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Lodging value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Lodging() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Lodging value)  $default,){
final _that = this;
switch (_that) {
case _Lodging():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Lodging value)?  $default,){
final _that = this;
switch (_that) {
case _Lodging() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tripId,  String name,  String? address,  double? latitude,  double? longitude,  DateTime checkInAt,  DateTime checkOutAt,  String timezone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Lodging() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tripId,  String name,  String? address,  double? latitude,  double? longitude,  DateTime checkInAt,  DateTime checkOutAt,  String timezone)  $default,) {final _that = this;
switch (_that) {
case _Lodging():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tripId,  String name,  String? address,  double? latitude,  double? longitude,  DateTime checkInAt,  DateTime checkOutAt,  String timezone)?  $default,) {final _that = this;
switch (_that) {
case _Lodging() when $default != null:
return $default(_that.id,_that.tripId,_that.name,_that.address,_that.latitude,_that.longitude,_that.checkInAt,_that.checkOutAt,_that.timezone);case _:
  return null;

}
}

}

/// @nodoc


class _Lodging extends Lodging {
  const _Lodging({required this.id, required this.tripId, required this.name, this.address, this.latitude, this.longitude, required this.checkInAt, required this.checkOutAt, required this.timezone}): super._();
  

@override final  String id;
@override final  String tripId;
@override final  String name;
@override final  String? address;
@override final  double? latitude;
@override final  double? longitude;
@override final  DateTime checkInAt;
@override final  DateTime checkOutAt;
@override final  String timezone;

/// Create a copy of Lodging
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LodgingCopyWith<_Lodging> get copyWith => __$LodgingCopyWithImpl<_Lodging>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Lodging&&(identical(other.id, id) || other.id == id)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.checkInAt, checkInAt) || other.checkInAt == checkInAt)&&(identical(other.checkOutAt, checkOutAt) || other.checkOutAt == checkOutAt)&&(identical(other.timezone, timezone) || other.timezone == timezone));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,tripId,name,address,latitude,longitude,checkInAt,checkOutAt,timezone);
}

@override
String toString() {
    return 'Lodging(id: $id, tripId: $tripId, name: $name, address: $address, latitude: $latitude, longitude: $longitude, checkInAt: $checkInAt, checkOutAt: $checkOutAt, timezone: $timezone)';
}


}

/// @nodoc
abstract mixin class _$LodgingCopyWith<$Res> implements $LodgingCopyWith<$Res> {
  factory _$LodgingCopyWith(_Lodging value, $Res Function(_Lodging) _then) = __$LodgingCopyWithImpl;
@override @useResult
$Res call({
 String id, String tripId, String name, String? address, double? latitude, double? longitude, DateTime checkInAt, DateTime checkOutAt, String timezone
});




}
/// @nodoc
class __$LodgingCopyWithImpl<$Res>
    implements _$LodgingCopyWith<$Res> {
  __$LodgingCopyWithImpl(this._self, this._then);

  final _Lodging _self;
  final $Res Function(_Lodging) _then;

/// Create a copy of Lodging
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tripId = null,Object? name = null,Object? address = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? checkInAt = null,Object? checkOutAt = null,Object? timezone = null,}) {
  return _then(_Lodging(
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

// dart format on
