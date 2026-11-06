// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lodging_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LodgingDraft {

 String get name; String get address; String get latitude; String get longitude; DateTime? get checkInLocal; DateTime? get checkOutLocal; String get timezone;
/// Create a copy of LodgingDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LodgingDraftCopyWith<LodgingDraft> get copyWith => _$LodgingDraftCopyWithImpl<LodgingDraft>(this as LodgingDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as LodgingDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LodgingDraft&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.checkInLocal, _this.checkInLocal) || other.checkInLocal == _this.checkInLocal)&&(identical(other.checkOutLocal, _this.checkOutLocal) || other.checkOutLocal == _this.checkOutLocal)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone));
}


@override
int get hashCode {
  final _this = this as LodgingDraft;
  return Object.hash(runtimeType,_this.name,_this.address,_this.latitude,_this.longitude,_this.checkInLocal,_this.checkOutLocal,_this.timezone);
}

@override
String toString() {
  final _this = this as LodgingDraft;
  return 'LodgingDraft(name: ${_this.name}, address: ${_this.address}, latitude: ${_this.latitude}, longitude: ${_this.longitude}, checkInLocal: ${_this.checkInLocal}, checkOutLocal: ${_this.checkOutLocal}, timezone: ${_this.timezone})';
}


}

/// @nodoc
abstract mixin class $LodgingDraftCopyWith<$Res>  {
  factory $LodgingDraftCopyWith(LodgingDraft value, $Res Function(LodgingDraft) _then) = _$LodgingDraftCopyWithImpl;
@useResult
$Res call({
 String name, String address, String latitude, String longitude, DateTime? checkInLocal, DateTime? checkOutLocal, String timezone
});




}
/// @nodoc
class _$LodgingDraftCopyWithImpl<$Res>
    implements $LodgingDraftCopyWith<$Res> {
  _$LodgingDraftCopyWithImpl(this._self, this._then);

  final LodgingDraft _self;
  final $Res Function(LodgingDraft) _then;

/// Create a copy of LodgingDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? address = null,Object? latitude = null,Object? longitude = null,Object? checkInLocal = freezed,Object? checkOutLocal = freezed,Object? timezone = null,}) {
  return _then(LodgingDraft(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String,checkInLocal: freezed == checkInLocal ? _self.checkInLocal : checkInLocal // ignore: cast_nullable_to_non_nullable
as DateTime?,checkOutLocal: freezed == checkOutLocal ? _self.checkOutLocal : checkOutLocal // ignore: cast_nullable_to_non_nullable
as DateTime?,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LodgingDraft].
extension LodgingDraftPatterns on LodgingDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LodgingDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LodgingDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LodgingDraft value)  $default,){
final _that = this;
switch (_that) {
case _LodgingDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LodgingDraft value)?  $default,){
final _that = this;
switch (_that) {
case _LodgingDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String address,  String latitude,  String longitude,  DateTime? checkInLocal,  DateTime? checkOutLocal,  String timezone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LodgingDraft() when $default != null:
return $default(_that.name,_that.address,_that.latitude,_that.longitude,_that.checkInLocal,_that.checkOutLocal,_that.timezone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String address,  String latitude,  String longitude,  DateTime? checkInLocal,  DateTime? checkOutLocal,  String timezone)  $default,) {final _that = this;
switch (_that) {
case _LodgingDraft():
return $default(_that.name,_that.address,_that.latitude,_that.longitude,_that.checkInLocal,_that.checkOutLocal,_that.timezone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String address,  String latitude,  String longitude,  DateTime? checkInLocal,  DateTime? checkOutLocal,  String timezone)?  $default,) {final _that = this;
switch (_that) {
case _LodgingDraft() when $default != null:
return $default(_that.name,_that.address,_that.latitude,_that.longitude,_that.checkInLocal,_that.checkOutLocal,_that.timezone);case _:
  return null;

}
}

}

/// @nodoc


class _LodgingDraft extends LodgingDraft {
  const _LodgingDraft({this.name = '', this.address = '', this.latitude = '', this.longitude = '', this.checkInLocal, this.checkOutLocal, this.timezone = TimeZones.defaultZone}): super._();
  

@override@JsonKey() final  String name;
@override@JsonKey() final  String address;
@override@JsonKey() final  String latitude;
@override@JsonKey() final  String longitude;
@override final  DateTime? checkInLocal;
@override final  DateTime? checkOutLocal;
@override@JsonKey() final  String timezone;

/// Create a copy of LodgingDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LodgingDraftCopyWith<_LodgingDraft> get copyWith => __$LodgingDraftCopyWithImpl<_LodgingDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LodgingDraft&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.checkInLocal, checkInLocal) || other.checkInLocal == checkInLocal)&&(identical(other.checkOutLocal, checkOutLocal) || other.checkOutLocal == checkOutLocal)&&(identical(other.timezone, timezone) || other.timezone == timezone));
}


@override
int get hashCode {
    return Object.hash(runtimeType,name,address,latitude,longitude,checkInLocal,checkOutLocal,timezone);
}

@override
String toString() {
    return 'LodgingDraft(name: $name, address: $address, latitude: $latitude, longitude: $longitude, checkInLocal: $checkInLocal, checkOutLocal: $checkOutLocal, timezone: $timezone)';
}


}

/// @nodoc
abstract mixin class _$LodgingDraftCopyWith<$Res> implements $LodgingDraftCopyWith<$Res> {
  factory _$LodgingDraftCopyWith(_LodgingDraft value, $Res Function(_LodgingDraft) _then) = __$LodgingDraftCopyWithImpl;
@override @useResult
$Res call({
 String name, String address, String latitude, String longitude, DateTime? checkInLocal, DateTime? checkOutLocal, String timezone
});




}
/// @nodoc
class __$LodgingDraftCopyWithImpl<$Res>
    implements _$LodgingDraftCopyWith<$Res> {
  __$LodgingDraftCopyWithImpl(this._self, this._then);

  final _LodgingDraft _self;
  final $Res Function(_LodgingDraft) _then;

/// Create a copy of LodgingDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? address = null,Object? latitude = null,Object? longitude = null,Object? checkInLocal = freezed,Object? checkOutLocal = freezed,Object? timezone = null,}) {
  return _then(_LodgingDraft(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String,checkInLocal: freezed == checkInLocal ? _self.checkInLocal : checkInLocal // ignore: cast_nullable_to_non_nullable
as DateTime?,checkOutLocal: freezed == checkOutLocal ? _self.checkOutLocal : checkOutLocal // ignore: cast_nullable_to_non_nullable
as DateTime?,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
