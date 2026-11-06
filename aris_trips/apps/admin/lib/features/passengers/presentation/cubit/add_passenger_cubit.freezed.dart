// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_passenger_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddPassengerState {

 String get query; bool get searching; List<Passenger> get results; Failure? get searchFailure; bool get submitting; Set<PassengerDraftIssue> get issues; Failure? get failure;/// Set when the passenger was added. Null [result] means an existing
/// passenger was picked from the search.
 bool get added; ImportResult? get result;
/// Create a copy of AddPassengerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddPassengerStateCopyWith<AddPassengerState> get copyWith => _$AddPassengerStateCopyWithImpl<AddPassengerState>(this as AddPassengerState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AddPassengerState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddPassengerState&&(identical(other.query, _this.query) || other.query == _this.query)&&(identical(other.searching, _this.searching) || other.searching == _this.searching)&&const DeepCollectionEquality().equals(other.results, _this.results)&&(identical(other.searchFailure, _this.searchFailure) || other.searchFailure == _this.searchFailure)&&(identical(other.submitting, _this.submitting) || other.submitting == _this.submitting)&&const DeepCollectionEquality().equals(other.issues, _this.issues)&&(identical(other.failure, _this.failure) || other.failure == _this.failure)&&(identical(other.added, _this.added) || other.added == _this.added)&&(identical(other.result, _this.result) || other.result == _this.result));
}


@override
int get hashCode {
  final _this = this as AddPassengerState;
  return Object.hash(runtimeType,_this.query,_this.searching,const DeepCollectionEquality().hash(_this.results),_this.searchFailure,_this.submitting,const DeepCollectionEquality().hash(_this.issues),_this.failure,_this.added,_this.result);
}

@override
String toString() {
  final _this = this as AddPassengerState;
  return 'AddPassengerState(query: ${_this.query}, searching: ${_this.searching}, results: ${_this.results}, searchFailure: ${_this.searchFailure}, submitting: ${_this.submitting}, issues: ${_this.issues}, failure: ${_this.failure}, added: ${_this.added}, result: ${_this.result})';
}


}

/// @nodoc
abstract mixin class $AddPassengerStateCopyWith<$Res>  {
  factory $AddPassengerStateCopyWith(AddPassengerState value, $Res Function(AddPassengerState) _then) = _$AddPassengerStateCopyWithImpl;
@useResult
$Res call({
 String query, bool searching, List<Passenger> results, Failure? searchFailure, bool submitting, Set<PassengerDraftIssue> issues, Failure? failure, bool added, ImportResult? result
});


$FailureCopyWith<$Res>? get searchFailure;$FailureCopyWith<$Res>? get failure;$ImportResultCopyWith<$Res>? get result;

}
/// @nodoc
class _$AddPassengerStateCopyWithImpl<$Res>
    implements $AddPassengerStateCopyWith<$Res> {
  _$AddPassengerStateCopyWithImpl(this._self, this._then);

  final AddPassengerState _self;
  final $Res Function(AddPassengerState) _then;

/// Create a copy of AddPassengerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? searching = null,Object? results = null,Object? searchFailure = freezed,Object? submitting = null,Object? issues = null,Object? failure = freezed,Object? added = null,Object? result = freezed,}) {
  return _then(AddPassengerState(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,searching: null == searching ? _self.searching : searching // ignore: cast_nullable_to_non_nullable
as bool,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<Passenger>,searchFailure: freezed == searchFailure ? _self.searchFailure : searchFailure // ignore: cast_nullable_to_non_nullable
as Failure?,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,issues: null == issues ? _self.issues : issues // ignore: cast_nullable_to_non_nullable
as Set<PassengerDraftIssue>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,added: null == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as bool,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as ImportResult?,
  ));
}
/// Create a copy of AddPassengerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get searchFailure {
    if (_self.searchFailure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.searchFailure!, (value) {
    return _then(_self.copyWith(searchFailure: value));
  });
}/// Create a copy of AddPassengerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}/// Create a copy of AddPassengerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $ImportResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}


/// Adds pattern-matching-related methods to [AddPassengerState].
extension AddPassengerStatePatterns on AddPassengerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddPassengerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddPassengerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddPassengerState value)  $default,){
final _that = this;
switch (_that) {
case _AddPassengerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddPassengerState value)?  $default,){
final _that = this;
switch (_that) {
case _AddPassengerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String query,  bool searching,  List<Passenger> results,  Failure? searchFailure,  bool submitting,  Set<PassengerDraftIssue> issues,  Failure? failure,  bool added,  ImportResult? result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddPassengerState() when $default != null:
return $default(_that.query,_that.searching,_that.results,_that.searchFailure,_that.submitting,_that.issues,_that.failure,_that.added,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String query,  bool searching,  List<Passenger> results,  Failure? searchFailure,  bool submitting,  Set<PassengerDraftIssue> issues,  Failure? failure,  bool added,  ImportResult? result)  $default,) {final _that = this;
switch (_that) {
case _AddPassengerState():
return $default(_that.query,_that.searching,_that.results,_that.searchFailure,_that.submitting,_that.issues,_that.failure,_that.added,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String query,  bool searching,  List<Passenger> results,  Failure? searchFailure,  bool submitting,  Set<PassengerDraftIssue> issues,  Failure? failure,  bool added,  ImportResult? result)?  $default,) {final _that = this;
switch (_that) {
case _AddPassengerState() when $default != null:
return $default(_that.query,_that.searching,_that.results,_that.searchFailure,_that.submitting,_that.issues,_that.failure,_that.added,_that.result);case _:
  return null;

}
}

}

/// @nodoc


class _AddPassengerState implements AddPassengerState {
  const _AddPassengerState({this.query = '', this.searching = false,  List<Passenger> results = const [], this.searchFailure, this.submitting = false,  Set<PassengerDraftIssue> issues = const {}, this.failure, this.added = false, this.result}): _results = results,_issues = issues;
  

@override@JsonKey() final  String query;
@override@JsonKey() final  bool searching;
 final  List<Passenger> _results;
@override@JsonKey() List<Passenger> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

@override final  Failure? searchFailure;
@override@JsonKey() final  bool submitting;
 final  Set<PassengerDraftIssue> _issues;
@override@JsonKey() Set<PassengerDraftIssue> get issues {
  if (_issues is EqualUnmodifiableSetView) return _issues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_issues);
}

@override final  Failure? failure;
/// Set when the passenger was added. Null [result] means an existing
/// passenger was picked from the search.
@override@JsonKey() final  bool added;
@override final  ImportResult? result;

/// Create a copy of AddPassengerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddPassengerStateCopyWith<_AddPassengerState> get copyWith => __$AddPassengerStateCopyWithImpl<_AddPassengerState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddPassengerState&&(identical(other.query, query) || other.query == query)&&(identical(other.searching, searching) || other.searching == searching)&&const DeepCollectionEquality().equals(other.results, _results)&&(identical(other.searchFailure, searchFailure) || other.searchFailure == searchFailure)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&const DeepCollectionEquality().equals(other.issues, _issues)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.added, added) || other.added == added)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode {
    return Object.hash(runtimeType,query,searching,const DeepCollectionEquality().hash(_results),searchFailure,submitting,const DeepCollectionEquality().hash(_issues),failure,added,result);
}

@override
String toString() {
    return 'AddPassengerState(query: $query, searching: $searching, results: $results, searchFailure: $searchFailure, submitting: $submitting, issues: $issues, failure: $failure, added: $added, result: $result)';
}


}

/// @nodoc
abstract mixin class _$AddPassengerStateCopyWith<$Res> implements $AddPassengerStateCopyWith<$Res> {
  factory _$AddPassengerStateCopyWith(_AddPassengerState value, $Res Function(_AddPassengerState) _then) = __$AddPassengerStateCopyWithImpl;
@override @useResult
$Res call({
 String query, bool searching, List<Passenger> results, Failure? searchFailure, bool submitting, Set<PassengerDraftIssue> issues, Failure? failure, bool added, ImportResult? result
});


@override $FailureCopyWith<$Res>? get searchFailure;@override $FailureCopyWith<$Res>? get failure;@override $ImportResultCopyWith<$Res>? get result;

}
/// @nodoc
class __$AddPassengerStateCopyWithImpl<$Res>
    implements _$AddPassengerStateCopyWith<$Res> {
  __$AddPassengerStateCopyWithImpl(this._self, this._then);

  final _AddPassengerState _self;
  final $Res Function(_AddPassengerState) _then;

/// Create a copy of AddPassengerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? searching = null,Object? results = null,Object? searchFailure = freezed,Object? submitting = null,Object? issues = null,Object? failure = freezed,Object? added = null,Object? result = freezed,}) {
  return _then(_AddPassengerState(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,searching: null == searching ? _self.searching : searching // ignore: cast_nullable_to_non_nullable
as bool,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<Passenger>,searchFailure: freezed == searchFailure ? _self.searchFailure : searchFailure // ignore: cast_nullable_to_non_nullable
as Failure?,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,issues: null == issues ? _self._issues : issues // ignore: cast_nullable_to_non_nullable
as Set<PassengerDraftIssue>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,added: null == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as bool,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as ImportResult?,
  ));
}

/// Create a copy of AddPassengerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get searchFailure {
    if (_self.searchFailure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.searchFailure!, (value) {
    return _then(_self.copyWith(searchFailure: value));
  });
}/// Create a copy of AddPassengerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}/// Create a copy of AddPassengerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $ImportResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

// dart format on
