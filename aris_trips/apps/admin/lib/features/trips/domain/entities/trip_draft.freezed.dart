// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TripDraft {

 String get name; String get destination; String? get description; DateTime? get startDate; DateTime? get endDate; TripStatus get status;
/// Create a copy of TripDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripDraftCopyWith<TripDraft> get copyWith => _$TripDraftCopyWithImpl<TripDraft>(this as TripDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TripDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripDraft&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.destination, _this.destination) || other.destination == _this.destination)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&(identical(other.endDate, _this.endDate) || other.endDate == _this.endDate)&&(identical(other.status, _this.status) || other.status == _this.status));
}


@override
int get hashCode {
  final _this = this as TripDraft;
  return Object.hash(runtimeType,_this.name,_this.destination,_this.description,_this.startDate,_this.endDate,_this.status);
}

@override
String toString() {
  final _this = this as TripDraft;
  return 'TripDraft(name: ${_this.name}, destination: ${_this.destination}, description: ${_this.description}, startDate: ${_this.startDate}, endDate: ${_this.endDate}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $TripDraftCopyWith<$Res>  {
  factory $TripDraftCopyWith(TripDraft value, $Res Function(TripDraft) _then) = _$TripDraftCopyWithImpl;
@useResult
$Res call({
 String name, String destination, String? description, DateTime? startDate, DateTime? endDate, TripStatus status
});




}
/// @nodoc
class _$TripDraftCopyWithImpl<$Res>
    implements $TripDraftCopyWith<$Res> {
  _$TripDraftCopyWithImpl(this._self, this._then);

  final TripDraft _self;
  final $Res Function(TripDraft) _then;

/// Create a copy of TripDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? destination = null,Object? description = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? status = null,}) {
  return _then(TripDraft(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TripStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [TripDraft].
extension TripDraftPatterns on TripDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripDraft value)  $default,){
final _that = this;
switch (_that) {
case _TripDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripDraft value)?  $default,){
final _that = this;
switch (_that) {
case _TripDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String destination,  String? description,  DateTime? startDate,  DateTime? endDate,  TripStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripDraft() when $default != null:
return $default(_that.name,_that.destination,_that.description,_that.startDate,_that.endDate,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String destination,  String? description,  DateTime? startDate,  DateTime? endDate,  TripStatus status)  $default,) {final _that = this;
switch (_that) {
case _TripDraft():
return $default(_that.name,_that.destination,_that.description,_that.startDate,_that.endDate,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String destination,  String? description,  DateTime? startDate,  DateTime? endDate,  TripStatus status)?  $default,) {final _that = this;
switch (_that) {
case _TripDraft() when $default != null:
return $default(_that.name,_that.destination,_that.description,_that.startDate,_that.endDate,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _TripDraft extends TripDraft {
  const _TripDraft({this.name = '', this.destination = '', this.description, this.startDate, this.endDate, this.status = TripStatus.draft}): super._();
  

@override@JsonKey() final  String name;
@override@JsonKey() final  String destination;
@override final  String? description;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override@JsonKey() final  TripStatus status;

/// Create a copy of TripDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripDraftCopyWith<_TripDraft> get copyWith => __$TripDraftCopyWithImpl<_TripDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripDraft&&(identical(other.name, name) || other.name == name)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.description, description) || other.description == description)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode {
    return Object.hash(runtimeType,name,destination,description,startDate,endDate,status);
}

@override
String toString() {
    return 'TripDraft(name: $name, destination: $destination, description: $description, startDate: $startDate, endDate: $endDate, status: $status)';
}


}

/// @nodoc
abstract mixin class _$TripDraftCopyWith<$Res> implements $TripDraftCopyWith<$Res> {
  factory _$TripDraftCopyWith(_TripDraft value, $Res Function(_TripDraft) _then) = __$TripDraftCopyWithImpl;
@override @useResult
$Res call({
 String name, String destination, String? description, DateTime? startDate, DateTime? endDate, TripStatus status
});




}
/// @nodoc
class __$TripDraftCopyWithImpl<$Res>
    implements _$TripDraftCopyWith<$Res> {
  __$TripDraftCopyWithImpl(this._self, this._then);

  final _TripDraft _self;
  final $Res Function(_TripDraft) _then;

/// Create a copy of TripDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? destination = null,Object? description = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? status = null,}) {
  return _then(_TripDraft(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TripStatus,
  ));
}


}

// dart format on
