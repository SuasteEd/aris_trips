// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TripDetailState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TripDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TripDetailState()';
}


}

/// @nodoc
class $TripDetailStateCopyWith<$Res>  {
$TripDetailStateCopyWith(TripDetailState _, $Res Function(TripDetailState) __);
}


/// Adds pattern-matching-related methods to [TripDetailState].
extension TripDetailStatePatterns on TripDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TripDetailLoading value)?  loading,TResult Function( TripDetailLoaded value)?  loaded,TResult Function( TripDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TripDetailLoading() when loading != null:
return loading(_that);case TripDetailLoaded() when loaded != null:
return loaded(_that);case TripDetailFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TripDetailLoading value)  loading,required TResult Function( TripDetailLoaded value)  loaded,required TResult Function( TripDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case TripDetailLoading():
return loading(_that);case TripDetailLoaded():
return loaded(_that);case TripDetailFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TripDetailLoading value)?  loading,TResult? Function( TripDetailLoaded value)?  loaded,TResult? Function( TripDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case TripDetailLoading() when loading != null:
return loading(_that);case TripDetailLoaded() when loaded != null:
return loaded(_that);case TripDetailFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( Trip trip,  bool busy,  Failure? actionFailure)?  loaded,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TripDetailLoading() when loading != null:
return loading();case TripDetailLoaded() when loaded != null:
return loaded(_that.trip,_that.busy,_that.actionFailure);case TripDetailFailure() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( Trip trip,  bool busy,  Failure? actionFailure)  loaded,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case TripDetailLoading():
return loading();case TripDetailLoaded():
return loaded(_that.trip,_that.busy,_that.actionFailure);case TripDetailFailure():
return failure(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( Trip trip,  bool busy,  Failure? actionFailure)?  loaded,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case TripDetailLoading() when loading != null:
return loading();case TripDetailLoaded() when loaded != null:
return loaded(_that.trip,_that.busy,_that.actionFailure);case TripDetailFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class TripDetailLoading implements TripDetailState {
  const TripDetailLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TripDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TripDetailState.loading()';
}


}




/// @nodoc


class TripDetailLoaded implements TripDetailState {
  const TripDetailLoaded({required this.trip, this.busy = false, this.actionFailure});
  

 final  Trip trip;
@JsonKey() final  bool busy;
 final  Failure? actionFailure;

/// Create a copy of TripDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripDetailLoadedCopyWith<TripDetailLoaded> get copyWith => _$TripDetailLoadedCopyWithImpl<TripDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TripDetailLoaded&&(identical(other.trip, trip) || other.trip == trip)&&(identical(other.busy, busy) || other.busy == busy)&&(identical(other.actionFailure, actionFailure) || other.actionFailure == actionFailure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,trip,busy,actionFailure);
}

@override
String toString() {
    return 'TripDetailState.loaded(trip: $trip, busy: $busy, actionFailure: $actionFailure)';
}


}

/// @nodoc
abstract mixin class $TripDetailLoadedCopyWith<$Res> implements $TripDetailStateCopyWith<$Res> {
  factory $TripDetailLoadedCopyWith(TripDetailLoaded value, $Res Function(TripDetailLoaded) _then) = _$TripDetailLoadedCopyWithImpl;
@useResult
$Res call({
 Trip trip, bool busy, Failure? actionFailure
});


$TripCopyWith<$Res> get trip;$FailureCopyWith<$Res>? get actionFailure;

}
/// @nodoc
class _$TripDetailLoadedCopyWithImpl<$Res>
    implements $TripDetailLoadedCopyWith<$Res> {
  _$TripDetailLoadedCopyWithImpl(this._self, this._then);

  final TripDetailLoaded _self;
  final $Res Function(TripDetailLoaded) _then;

/// Create a copy of TripDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? trip = null,Object? busy = null,Object? actionFailure = freezed,}) {
  return _then(TripDetailLoaded(
trip: null == trip ? _self.trip : trip // ignore: cast_nullable_to_non_nullable
as Trip,busy: null == busy ? _self.busy : busy // ignore: cast_nullable_to_non_nullable
as bool,actionFailure: freezed == actionFailure ? _self.actionFailure : actionFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of TripDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripCopyWith<$Res> get trip {
  
  return $TripCopyWith<$Res>(_self.trip, (value) {
    return _then(_self.copyWith(trip: value));
  });
}/// Create a copy of TripDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get actionFailure {
    if (_self.actionFailure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.actionFailure!, (value) {
    return _then(_self.copyWith(actionFailure: value));
  });
}
}

/// @nodoc


class TripDetailFailure implements TripDetailState {
  const TripDetailFailure(this.failure);
  

 final  Failure failure;

/// Create a copy of TripDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripDetailFailureCopyWith<TripDetailFailure> get copyWith => _$TripDetailFailureCopyWithImpl<TripDetailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TripDetailFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,failure);
}

@override
String toString() {
    return 'TripDetailState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $TripDetailFailureCopyWith<$Res> implements $TripDetailStateCopyWith<$Res> {
  factory $TripDetailFailureCopyWith(TripDetailFailure value, $Res Function(TripDetailFailure) _then) = _$TripDetailFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$TripDetailFailureCopyWithImpl<$Res>
    implements $TripDetailFailureCopyWith<$Res> {
  _$TripDetailFailureCopyWithImpl(this._self, this._then);

  final TripDetailFailure _self;
  final $Res Function(TripDetailFailure) _then;

/// Create a copy of TripDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(TripDetailFailure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of TripDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res> get failure {
  
  return $FailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
