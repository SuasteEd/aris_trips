// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'itinerary_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ItineraryDraft {

 String get title; DateTime? get startsLocal; DateTime? get endsLocal; String get timezone; String get location; String get description; String? get bookingId;
/// Create a copy of ItineraryDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItineraryDraftCopyWith<ItineraryDraft> get copyWith => _$ItineraryDraftCopyWithImpl<ItineraryDraft>(this as ItineraryDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ItineraryDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItineraryDraft&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.startsLocal, _this.startsLocal) || other.startsLocal == _this.startsLocal)&&(identical(other.endsLocal, _this.endsLocal) || other.endsLocal == _this.endsLocal)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone)&&(identical(other.location, _this.location) || other.location == _this.location)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.bookingId, _this.bookingId) || other.bookingId == _this.bookingId));
}


@override
int get hashCode {
  final _this = this as ItineraryDraft;
  return Object.hash(runtimeType,_this.title,_this.startsLocal,_this.endsLocal,_this.timezone,_this.location,_this.description,_this.bookingId);
}

@override
String toString() {
  final _this = this as ItineraryDraft;
  return 'ItineraryDraft(title: ${_this.title}, startsLocal: ${_this.startsLocal}, endsLocal: ${_this.endsLocal}, timezone: ${_this.timezone}, location: ${_this.location}, description: ${_this.description}, bookingId: ${_this.bookingId})';
}


}

/// @nodoc
abstract mixin class $ItineraryDraftCopyWith<$Res>  {
  factory $ItineraryDraftCopyWith(ItineraryDraft value, $Res Function(ItineraryDraft) _then) = _$ItineraryDraftCopyWithImpl;
@useResult
$Res call({
 String title, DateTime? startsLocal, DateTime? endsLocal, String timezone, String location, String description, String? bookingId
});




}
/// @nodoc
class _$ItineraryDraftCopyWithImpl<$Res>
    implements $ItineraryDraftCopyWith<$Res> {
  _$ItineraryDraftCopyWithImpl(this._self, this._then);

  final ItineraryDraft _self;
  final $Res Function(ItineraryDraft) _then;

/// Create a copy of ItineraryDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? startsLocal = freezed,Object? endsLocal = freezed,Object? timezone = null,Object? location = null,Object? description = null,Object? bookingId = freezed,}) {
  return _then(ItineraryDraft(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startsLocal: freezed == startsLocal ? _self.startsLocal : startsLocal // ignore: cast_nullable_to_non_nullable
as DateTime?,endsLocal: freezed == endsLocal ? _self.endsLocal : endsLocal // ignore: cast_nullable_to_non_nullable
as DateTime?,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,bookingId: freezed == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ItineraryDraft].
extension ItineraryDraftPatterns on ItineraryDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItineraryDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItineraryDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItineraryDraft value)  $default,){
final _that = this;
switch (_that) {
case _ItineraryDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItineraryDraft value)?  $default,){
final _that = this;
switch (_that) {
case _ItineraryDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  DateTime? startsLocal,  DateTime? endsLocal,  String timezone,  String location,  String description,  String? bookingId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItineraryDraft() when $default != null:
return $default(_that.title,_that.startsLocal,_that.endsLocal,_that.timezone,_that.location,_that.description,_that.bookingId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  DateTime? startsLocal,  DateTime? endsLocal,  String timezone,  String location,  String description,  String? bookingId)  $default,) {final _that = this;
switch (_that) {
case _ItineraryDraft():
return $default(_that.title,_that.startsLocal,_that.endsLocal,_that.timezone,_that.location,_that.description,_that.bookingId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  DateTime? startsLocal,  DateTime? endsLocal,  String timezone,  String location,  String description,  String? bookingId)?  $default,) {final _that = this;
switch (_that) {
case _ItineraryDraft() when $default != null:
return $default(_that.title,_that.startsLocal,_that.endsLocal,_that.timezone,_that.location,_that.description,_that.bookingId);case _:
  return null;

}
}

}

/// @nodoc


class _ItineraryDraft extends ItineraryDraft {
  const _ItineraryDraft({this.title = '', this.startsLocal, this.endsLocal, this.timezone = TimeZones.defaultZone, this.location = '', this.description = '', this.bookingId}): super._();
  

@override@JsonKey() final  String title;
@override final  DateTime? startsLocal;
@override final  DateTime? endsLocal;
@override@JsonKey() final  String timezone;
@override@JsonKey() final  String location;
@override@JsonKey() final  String description;
@override final  String? bookingId;

/// Create a copy of ItineraryDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItineraryDraftCopyWith<_ItineraryDraft> get copyWith => __$ItineraryDraftCopyWithImpl<_ItineraryDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItineraryDraft&&(identical(other.title, title) || other.title == title)&&(identical(other.startsLocal, startsLocal) || other.startsLocal == startsLocal)&&(identical(other.endsLocal, endsLocal) || other.endsLocal == endsLocal)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.location, location) || other.location == location)&&(identical(other.description, description) || other.description == description)&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,title,startsLocal,endsLocal,timezone,location,description,bookingId);
}

@override
String toString() {
    return 'ItineraryDraft(title: $title, startsLocal: $startsLocal, endsLocal: $endsLocal, timezone: $timezone, location: $location, description: $description, bookingId: $bookingId)';
}


}

/// @nodoc
abstract mixin class _$ItineraryDraftCopyWith<$Res> implements $ItineraryDraftCopyWith<$Res> {
  factory _$ItineraryDraftCopyWith(_ItineraryDraft value, $Res Function(_ItineraryDraft) _then) = __$ItineraryDraftCopyWithImpl;
@override @useResult
$Res call({
 String title, DateTime? startsLocal, DateTime? endsLocal, String timezone, String location, String description, String? bookingId
});




}
/// @nodoc
class __$ItineraryDraftCopyWithImpl<$Res>
    implements _$ItineraryDraftCopyWith<$Res> {
  __$ItineraryDraftCopyWithImpl(this._self, this._then);

  final _ItineraryDraft _self;
  final $Res Function(_ItineraryDraft) _then;

/// Create a copy of ItineraryDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? startsLocal = freezed,Object? endsLocal = freezed,Object? timezone = null,Object? location = null,Object? description = null,Object? bookingId = freezed,}) {
  return _then(_ItineraryDraft(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startsLocal: freezed == startsLocal ? _self.startsLocal : startsLocal // ignore: cast_nullable_to_non_nullable
as DateTime?,endsLocal: freezed == endsLocal ? _self.endsLocal : endsLocal // ignore: cast_nullable_to_non_nullable
as DateTime?,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,bookingId: freezed == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
