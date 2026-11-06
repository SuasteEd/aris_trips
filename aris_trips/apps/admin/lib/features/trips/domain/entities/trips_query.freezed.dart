// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trips_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TripsQuery {

 TripStatus? get status; String get search;
/// Create a copy of TripsQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripsQueryCopyWith<TripsQuery> get copyWith => _$TripsQueryCopyWithImpl<TripsQuery>(this as TripsQuery, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TripsQuery;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripsQuery&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.search, _this.search) || other.search == _this.search));
}


@override
int get hashCode {
  final _this = this as TripsQuery;
  return Object.hash(runtimeType,_this.status,_this.search);
}

@override
String toString() {
  final _this = this as TripsQuery;
  return 'TripsQuery(status: ${_this.status}, search: ${_this.search})';
}


}

/// @nodoc
abstract mixin class $TripsQueryCopyWith<$Res>  {
  factory $TripsQueryCopyWith(TripsQuery value, $Res Function(TripsQuery) _then) = _$TripsQueryCopyWithImpl;
@useResult
$Res call({
 TripStatus? status, String search
});




}
/// @nodoc
class _$TripsQueryCopyWithImpl<$Res>
    implements $TripsQueryCopyWith<$Res> {
  _$TripsQueryCopyWithImpl(this._self, this._then);

  final TripsQuery _self;
  final $Res Function(TripsQuery) _then;

/// Create a copy of TripsQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? search = null,}) {
  return _then(TripsQuery(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TripStatus?,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TripsQuery].
extension TripsQueryPatterns on TripsQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripsQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripsQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripsQuery value)  $default,){
final _that = this;
switch (_that) {
case _TripsQuery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripsQuery value)?  $default,){
final _that = this;
switch (_that) {
case _TripsQuery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TripStatus? status,  String search)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripsQuery() when $default != null:
return $default(_that.status,_that.search);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TripStatus? status,  String search)  $default,) {final _that = this;
switch (_that) {
case _TripsQuery():
return $default(_that.status,_that.search);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TripStatus? status,  String search)?  $default,) {final _that = this;
switch (_that) {
case _TripsQuery() when $default != null:
return $default(_that.status,_that.search);case _:
  return null;

}
}

}

/// @nodoc


class _TripsQuery implements TripsQuery {
  const _TripsQuery({this.status, this.search = ''});
  

@override final  TripStatus? status;
@override@JsonKey() final  String search;

/// Create a copy of TripsQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripsQueryCopyWith<_TripsQuery> get copyWith => __$TripsQueryCopyWithImpl<_TripsQuery>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripsQuery&&(identical(other.status, status) || other.status == status)&&(identical(other.search, search) || other.search == search));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,search);
}

@override
String toString() {
    return 'TripsQuery(status: $status, search: $search)';
}


}

/// @nodoc
abstract mixin class _$TripsQueryCopyWith<$Res> implements $TripsQueryCopyWith<$Res> {
  factory _$TripsQueryCopyWith(_TripsQuery value, $Res Function(_TripsQuery) _then) = __$TripsQueryCopyWithImpl;
@override @useResult
$Res call({
 TripStatus? status, String search
});




}
/// @nodoc
class __$TripsQueryCopyWithImpl<$Res>
    implements _$TripsQueryCopyWith<$Res> {
  __$TripsQueryCopyWithImpl(this._self, this._then);

  final _TripsQuery _self;
  final $Res Function(_TripsQuery) _then;

/// Create a copy of TripsQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? search = null,}) {
  return _then(_TripsQuery(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TripStatus?,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
