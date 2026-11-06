// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trips_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TripsListState {

 TripsQuery get query;
/// Create a copy of TripsListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripsListStateCopyWith<TripsListState> get copyWith => _$TripsListStateCopyWithImpl<TripsListState>(this as TripsListState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TripsListState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripsListState&&(identical(other.query, _this.query) || other.query == _this.query));
}


@override
int get hashCode {
  final _this = this as TripsListState;
  return Object.hash(runtimeType,_this.query);
}

@override
String toString() {
  final _this = this as TripsListState;
  return 'TripsListState(query: ${_this.query})';
}


}

/// @nodoc
abstract mixin class $TripsListStateCopyWith<$Res>  {
  factory $TripsListStateCopyWith(TripsListState value, $Res Function(TripsListState) _then) = _$TripsListStateCopyWithImpl;
@useResult
$Res call({
 TripsQuery query
});


$TripsQueryCopyWith<$Res> get query;

}
/// @nodoc
class _$TripsListStateCopyWithImpl<$Res>
    implements $TripsListStateCopyWith<$Res> {
  _$TripsListStateCopyWithImpl(this._self, this._then);

  final TripsListState _self;
  final $Res Function(TripsListState) _then;

/// Create a copy of TripsListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as TripsQuery,
  ));
}
/// Create a copy of TripsListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripsQueryCopyWith<$Res> get query {
  
  return $TripsQueryCopyWith<$Res>(_self.query, (value) {
    return _then(_self.copyWith(query: value));
  });
}
}


/// Adds pattern-matching-related methods to [TripsListState].
extension TripsListStatePatterns on TripsListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TripsListLoading value)?  loading,TResult Function( TripsListLoaded value)?  loaded,TResult Function( TripsListEmpty value)?  empty,TResult Function( TripsListFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TripsListLoading() when loading != null:
return loading(_that);case TripsListLoaded() when loaded != null:
return loaded(_that);case TripsListEmpty() when empty != null:
return empty(_that);case TripsListFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TripsListLoading value)  loading,required TResult Function( TripsListLoaded value)  loaded,required TResult Function( TripsListEmpty value)  empty,required TResult Function( TripsListFailure value)  failure,}){
final _that = this;
switch (_that) {
case TripsListLoading():
return loading(_that);case TripsListLoaded():
return loaded(_that);case TripsListEmpty():
return empty(_that);case TripsListFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TripsListLoading value)?  loading,TResult? Function( TripsListLoaded value)?  loaded,TResult? Function( TripsListEmpty value)?  empty,TResult? Function( TripsListFailure value)?  failure,}){
final _that = this;
switch (_that) {
case TripsListLoading() when loading != null:
return loading(_that);case TripsListLoaded() when loaded != null:
return loaded(_that);case TripsListEmpty() when empty != null:
return empty(_that);case TripsListFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( TripsQuery query)?  loading,TResult Function( TripsQuery query,  List<Trip> trips)?  loaded,TResult Function( TripsQuery query)?  empty,TResult Function( TripsQuery query,  Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TripsListLoading() when loading != null:
return loading(_that.query);case TripsListLoaded() when loaded != null:
return loaded(_that.query,_that.trips);case TripsListEmpty() when empty != null:
return empty(_that.query);case TripsListFailure() when failure != null:
return failure(_that.query,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( TripsQuery query)  loading,required TResult Function( TripsQuery query,  List<Trip> trips)  loaded,required TResult Function( TripsQuery query)  empty,required TResult Function( TripsQuery query,  Failure failure)  failure,}) {final _that = this;
switch (_that) {
case TripsListLoading():
return loading(_that.query);case TripsListLoaded():
return loaded(_that.query,_that.trips);case TripsListEmpty():
return empty(_that.query);case TripsListFailure():
return failure(_that.query,_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( TripsQuery query)?  loading,TResult? Function( TripsQuery query,  List<Trip> trips)?  loaded,TResult? Function( TripsQuery query)?  empty,TResult? Function( TripsQuery query,  Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case TripsListLoading() when loading != null:
return loading(_that.query);case TripsListLoaded() when loaded != null:
return loaded(_that.query,_that.trips);case TripsListEmpty() when empty != null:
return empty(_that.query);case TripsListFailure() when failure != null:
return failure(_that.query,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class TripsListLoading implements TripsListState {
  const TripsListLoading({required this.query});
  

@override final  TripsQuery query;

/// Create a copy of TripsListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripsListLoadingCopyWith<TripsListLoading> get copyWith => _$TripsListLoadingCopyWithImpl<TripsListLoading>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TripsListLoading&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode {
    return Object.hash(runtimeType,query);
}

@override
String toString() {
    return 'TripsListState.loading(query: $query)';
}


}

/// @nodoc
abstract mixin class $TripsListLoadingCopyWith<$Res> implements $TripsListStateCopyWith<$Res> {
  factory $TripsListLoadingCopyWith(TripsListLoading value, $Res Function(TripsListLoading) _then) = _$TripsListLoadingCopyWithImpl;
@override @useResult
$Res call({
 TripsQuery query
});


@override $TripsQueryCopyWith<$Res> get query;

}
/// @nodoc
class _$TripsListLoadingCopyWithImpl<$Res>
    implements $TripsListLoadingCopyWith<$Res> {
  _$TripsListLoadingCopyWithImpl(this._self, this._then);

  final TripsListLoading _self;
  final $Res Function(TripsListLoading) _then;

/// Create a copy of TripsListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(TripsListLoading(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as TripsQuery,
  ));
}

/// Create a copy of TripsListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripsQueryCopyWith<$Res> get query {
  
  return $TripsQueryCopyWith<$Res>(_self.query, (value) {
    return _then(_self.copyWith(query: value));
  });
}
}

/// @nodoc


class TripsListLoaded implements TripsListState {
  const TripsListLoaded({required this.query, required  List<Trip> trips}): _trips = trips;
  

@override final  TripsQuery query;
 final  List<Trip> _trips;
 List<Trip> get trips {
  if (_trips is EqualUnmodifiableListView) return _trips;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trips);
}


/// Create a copy of TripsListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripsListLoadedCopyWith<TripsListLoaded> get copyWith => _$TripsListLoadedCopyWithImpl<TripsListLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TripsListLoaded&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other.trips, _trips));
}


@override
int get hashCode {
    return Object.hash(runtimeType,query,const DeepCollectionEquality().hash(_trips));
}

@override
String toString() {
    return 'TripsListState.loaded(query: $query, trips: $trips)';
}


}

/// @nodoc
abstract mixin class $TripsListLoadedCopyWith<$Res> implements $TripsListStateCopyWith<$Res> {
  factory $TripsListLoadedCopyWith(TripsListLoaded value, $Res Function(TripsListLoaded) _then) = _$TripsListLoadedCopyWithImpl;
@override @useResult
$Res call({
 TripsQuery query, List<Trip> trips
});


@override $TripsQueryCopyWith<$Res> get query;

}
/// @nodoc
class _$TripsListLoadedCopyWithImpl<$Res>
    implements $TripsListLoadedCopyWith<$Res> {
  _$TripsListLoadedCopyWithImpl(this._self, this._then);

  final TripsListLoaded _self;
  final $Res Function(TripsListLoaded) _then;

/// Create a copy of TripsListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? trips = null,}) {
  return _then(TripsListLoaded(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as TripsQuery,trips: null == trips ? _self._trips : trips // ignore: cast_nullable_to_non_nullable
as List<Trip>,
  ));
}

/// Create a copy of TripsListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripsQueryCopyWith<$Res> get query {
  
  return $TripsQueryCopyWith<$Res>(_self.query, (value) {
    return _then(_self.copyWith(query: value));
  });
}
}

/// @nodoc


class TripsListEmpty implements TripsListState {
  const TripsListEmpty({required this.query});
  

@override final  TripsQuery query;

/// Create a copy of TripsListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripsListEmptyCopyWith<TripsListEmpty> get copyWith => _$TripsListEmptyCopyWithImpl<TripsListEmpty>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TripsListEmpty&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode {
    return Object.hash(runtimeType,query);
}

@override
String toString() {
    return 'TripsListState.empty(query: $query)';
}


}

/// @nodoc
abstract mixin class $TripsListEmptyCopyWith<$Res> implements $TripsListStateCopyWith<$Res> {
  factory $TripsListEmptyCopyWith(TripsListEmpty value, $Res Function(TripsListEmpty) _then) = _$TripsListEmptyCopyWithImpl;
@override @useResult
$Res call({
 TripsQuery query
});


@override $TripsQueryCopyWith<$Res> get query;

}
/// @nodoc
class _$TripsListEmptyCopyWithImpl<$Res>
    implements $TripsListEmptyCopyWith<$Res> {
  _$TripsListEmptyCopyWithImpl(this._self, this._then);

  final TripsListEmpty _self;
  final $Res Function(TripsListEmpty) _then;

/// Create a copy of TripsListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(TripsListEmpty(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as TripsQuery,
  ));
}

/// Create a copy of TripsListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripsQueryCopyWith<$Res> get query {
  
  return $TripsQueryCopyWith<$Res>(_self.query, (value) {
    return _then(_self.copyWith(query: value));
  });
}
}

/// @nodoc


class TripsListFailure implements TripsListState {
  const TripsListFailure({required this.query, required this.failure});
  

@override final  TripsQuery query;
 final  Failure failure;

/// Create a copy of TripsListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripsListFailureCopyWith<TripsListFailure> get copyWith => _$TripsListFailureCopyWithImpl<TripsListFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TripsListFailure&&(identical(other.query, query) || other.query == query)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,query,failure);
}

@override
String toString() {
    return 'TripsListState.failure(query: $query, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $TripsListFailureCopyWith<$Res> implements $TripsListStateCopyWith<$Res> {
  factory $TripsListFailureCopyWith(TripsListFailure value, $Res Function(TripsListFailure) _then) = _$TripsListFailureCopyWithImpl;
@override @useResult
$Res call({
 TripsQuery query, Failure failure
});


@override $TripsQueryCopyWith<$Res> get query;$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$TripsListFailureCopyWithImpl<$Res>
    implements $TripsListFailureCopyWith<$Res> {
  _$TripsListFailureCopyWithImpl(this._self, this._then);

  final TripsListFailure _self;
  final $Res Function(TripsListFailure) _then;

/// Create a copy of TripsListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? failure = null,}) {
  return _then(TripsListFailure(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as TripsQuery,failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of TripsListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripsQueryCopyWith<$Res> get query {
  
  return $TripsQueryCopyWith<$Res>(_self.query, (value) {
    return _then(_self.copyWith(query: value));
  });
}/// Create a copy of TripsListState
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
