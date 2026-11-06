// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'itinerary_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ItineraryItem {

 String get id; String get tripId;/// Null: the item applies to the whole group.
 String? get bookingId; DateTime get startsAt; DateTime? get endsAt; String get timezone; String get title; String? get description; String? get location;
/// Create a copy of ItineraryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItineraryItemCopyWith<ItineraryItem> get copyWith => _$ItineraryItemCopyWithImpl<ItineraryItem>(this as ItineraryItem, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ItineraryItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItineraryItem&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.tripId, _this.tripId) || other.tripId == _this.tripId)&&(identical(other.bookingId, _this.bookingId) || other.bookingId == _this.bookingId)&&(identical(other.startsAt, _this.startsAt) || other.startsAt == _this.startsAt)&&(identical(other.endsAt, _this.endsAt) || other.endsAt == _this.endsAt)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.location, _this.location) || other.location == _this.location));
}


@override
int get hashCode {
  final _this = this as ItineraryItem;
  return Object.hash(runtimeType,_this.id,_this.tripId,_this.bookingId,_this.startsAt,_this.endsAt,_this.timezone,_this.title,_this.description,_this.location);
}

@override
String toString() {
  final _this = this as ItineraryItem;
  return 'ItineraryItem(id: ${_this.id}, tripId: ${_this.tripId}, bookingId: ${_this.bookingId}, startsAt: ${_this.startsAt}, endsAt: ${_this.endsAt}, timezone: ${_this.timezone}, title: ${_this.title}, description: ${_this.description}, location: ${_this.location})';
}


}

/// @nodoc
abstract mixin class $ItineraryItemCopyWith<$Res>  {
  factory $ItineraryItemCopyWith(ItineraryItem value, $Res Function(ItineraryItem) _then) = _$ItineraryItemCopyWithImpl;
@useResult
$Res call({
 String id, String tripId, String? bookingId, DateTime startsAt, DateTime? endsAt, String timezone, String title, String? description, String? location
});




}
/// @nodoc
class _$ItineraryItemCopyWithImpl<$Res>
    implements $ItineraryItemCopyWith<$Res> {
  _$ItineraryItemCopyWithImpl(this._self, this._then);

  final ItineraryItem _self;
  final $Res Function(ItineraryItem) _then;

/// Create a copy of ItineraryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tripId = null,Object? bookingId = freezed,Object? startsAt = null,Object? endsAt = freezed,Object? timezone = null,Object? title = null,Object? description = freezed,Object? location = freezed,}) {
  return _then(ItineraryItem(
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


/// Adds pattern-matching-related methods to [ItineraryItem].
extension ItineraryItemPatterns on ItineraryItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItineraryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItineraryItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItineraryItem value)  $default,){
final _that = this;
switch (_that) {
case _ItineraryItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItineraryItem value)?  $default,){
final _that = this;
switch (_that) {
case _ItineraryItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tripId,  String? bookingId,  DateTime startsAt,  DateTime? endsAt,  String timezone,  String title,  String? description,  String? location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItineraryItem() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tripId,  String? bookingId,  DateTime startsAt,  DateTime? endsAt,  String timezone,  String title,  String? description,  String? location)  $default,) {final _that = this;
switch (_that) {
case _ItineraryItem():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tripId,  String? bookingId,  DateTime startsAt,  DateTime? endsAt,  String timezone,  String title,  String? description,  String? location)?  $default,) {final _that = this;
switch (_that) {
case _ItineraryItem() when $default != null:
return $default(_that.id,_that.tripId,_that.bookingId,_that.startsAt,_that.endsAt,_that.timezone,_that.title,_that.description,_that.location);case _:
  return null;

}
}

}

/// @nodoc


class _ItineraryItem extends ItineraryItem {
  const _ItineraryItem({required this.id, required this.tripId, this.bookingId, required this.startsAt, this.endsAt, required this.timezone, required this.title, this.description, this.location}): super._();
  

@override final  String id;
@override final  String tripId;
/// Null: the item applies to the whole group.
@override final  String? bookingId;
@override final  DateTime startsAt;
@override final  DateTime? endsAt;
@override final  String timezone;
@override final  String title;
@override final  String? description;
@override final  String? location;

/// Create a copy of ItineraryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItineraryItemCopyWith<_ItineraryItem> get copyWith => __$ItineraryItemCopyWithImpl<_ItineraryItem>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItineraryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.location, location) || other.location == location));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,tripId,bookingId,startsAt,endsAt,timezone,title,description,location);
}

@override
String toString() {
    return 'ItineraryItem(id: $id, tripId: $tripId, bookingId: $bookingId, startsAt: $startsAt, endsAt: $endsAt, timezone: $timezone, title: $title, description: $description, location: $location)';
}


}

/// @nodoc
abstract mixin class _$ItineraryItemCopyWith<$Res> implements $ItineraryItemCopyWith<$Res> {
  factory _$ItineraryItemCopyWith(_ItineraryItem value, $Res Function(_ItineraryItem) _then) = __$ItineraryItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String tripId, String? bookingId, DateTime startsAt, DateTime? endsAt, String timezone, String title, String? description, String? location
});




}
/// @nodoc
class __$ItineraryItemCopyWithImpl<$Res>
    implements _$ItineraryItemCopyWith<$Res> {
  __$ItineraryItemCopyWithImpl(this._self, this._then);

  final _ItineraryItem _self;
  final $Res Function(_ItineraryItem) _then;

/// Create a copy of ItineraryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tripId = null,Object? bookingId = freezed,Object? startsAt = null,Object? endsAt = freezed,Object? timezone = null,Object? title = null,Object? description = freezed,Object? location = freezed,}) {
  return _then(_ItineraryItem(
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
