// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TripFormState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TripFormState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TripFormState()';
}


}

/// @nodoc
class $TripFormStateCopyWith<$Res>  {
$TripFormStateCopyWith(TripFormState _, $Res Function(TripFormState) __);
}


/// Adds pattern-matching-related methods to [TripFormState].
extension TripFormStatePatterns on TripFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TripFormLoading value)?  loading,TResult Function( TripFormEditing value)?  editing,TResult Function( TripFormSaved value)?  saved,TResult Function( TripFormLoadFailure value)?  loadFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TripFormLoading() when loading != null:
return loading(_that);case TripFormEditing() when editing != null:
return editing(_that);case TripFormSaved() when saved != null:
return saved(_that);case TripFormLoadFailure() when loadFailure != null:
return loadFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TripFormLoading value)  loading,required TResult Function( TripFormEditing value)  editing,required TResult Function( TripFormSaved value)  saved,required TResult Function( TripFormLoadFailure value)  loadFailure,}){
final _that = this;
switch (_that) {
case TripFormLoading():
return loading(_that);case TripFormEditing():
return editing(_that);case TripFormSaved():
return saved(_that);case TripFormLoadFailure():
return loadFailure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TripFormLoading value)?  loading,TResult? Function( TripFormEditing value)?  editing,TResult? Function( TripFormSaved value)?  saved,TResult? Function( TripFormLoadFailure value)?  loadFailure,}){
final _that = this;
switch (_that) {
case TripFormLoading() when loading != null:
return loading(_that);case TripFormEditing() when editing != null:
return editing(_that);case TripFormSaved() when saved != null:
return saved(_that);case TripFormLoadFailure() when loadFailure != null:
return loadFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( Trip? original,  bool submitting,  Set<TripDraftIssue> issues,  Failure? failure)?  editing,TResult Function( Trip trip,  bool created)?  saved,TResult Function( Failure failure)?  loadFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TripFormLoading() when loading != null:
return loading();case TripFormEditing() when editing != null:
return editing(_that.original,_that.submitting,_that.issues,_that.failure);case TripFormSaved() when saved != null:
return saved(_that.trip,_that.created);case TripFormLoadFailure() when loadFailure != null:
return loadFailure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( Trip? original,  bool submitting,  Set<TripDraftIssue> issues,  Failure? failure)  editing,required TResult Function( Trip trip,  bool created)  saved,required TResult Function( Failure failure)  loadFailure,}) {final _that = this;
switch (_that) {
case TripFormLoading():
return loading();case TripFormEditing():
return editing(_that.original,_that.submitting,_that.issues,_that.failure);case TripFormSaved():
return saved(_that.trip,_that.created);case TripFormLoadFailure():
return loadFailure(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( Trip? original,  bool submitting,  Set<TripDraftIssue> issues,  Failure? failure)?  editing,TResult? Function( Trip trip,  bool created)?  saved,TResult? Function( Failure failure)?  loadFailure,}) {final _that = this;
switch (_that) {
case TripFormLoading() when loading != null:
return loading();case TripFormEditing() when editing != null:
return editing(_that.original,_that.submitting,_that.issues,_that.failure);case TripFormSaved() when saved != null:
return saved(_that.trip,_that.created);case TripFormLoadFailure() when loadFailure != null:
return loadFailure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class TripFormLoading implements TripFormState {
  const TripFormLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TripFormLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TripFormState.loading()';
}


}




/// @nodoc


class TripFormEditing implements TripFormState {
  const TripFormEditing({this.original, this.submitting = false,  Set<TripDraftIssue> issues = const <TripDraftIssue>{}, this.failure}): _issues = issues;
  

 final  Trip? original;
@JsonKey() final  bool submitting;
 final  Set<TripDraftIssue> _issues;
@JsonKey() Set<TripDraftIssue> get issues {
  if (_issues is EqualUnmodifiableSetView) return _issues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_issues);
}

 final  Failure? failure;

/// Create a copy of TripFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripFormEditingCopyWith<TripFormEditing> get copyWith => _$TripFormEditingCopyWithImpl<TripFormEditing>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TripFormEditing&&(identical(other.original, original) || other.original == original)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&const DeepCollectionEquality().equals(other.issues, _issues)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,original,submitting,const DeepCollectionEquality().hash(_issues),failure);
}

@override
String toString() {
    return 'TripFormState.editing(original: $original, submitting: $submitting, issues: $issues, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $TripFormEditingCopyWith<$Res> implements $TripFormStateCopyWith<$Res> {
  factory $TripFormEditingCopyWith(TripFormEditing value, $Res Function(TripFormEditing) _then) = _$TripFormEditingCopyWithImpl;
@useResult
$Res call({
 Trip? original, bool submitting, Set<TripDraftIssue> issues, Failure? failure
});


$TripCopyWith<$Res>? get original;$FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class _$TripFormEditingCopyWithImpl<$Res>
    implements $TripFormEditingCopyWith<$Res> {
  _$TripFormEditingCopyWithImpl(this._self, this._then);

  final TripFormEditing _self;
  final $Res Function(TripFormEditing) _then;

/// Create a copy of TripFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? original = freezed,Object? submitting = null,Object? issues = null,Object? failure = freezed,}) {
  return _then(TripFormEditing(
original: freezed == original ? _self.original : original // ignore: cast_nullable_to_non_nullable
as Trip?,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,issues: null == issues ? _self._issues : issues // ignore: cast_nullable_to_non_nullable
as Set<TripDraftIssue>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of TripFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripCopyWith<$Res>? get original {
    if (_self.original == null) {
    return null;
  }

  return $TripCopyWith<$Res>(_self.original!, (value) {
    return _then(_self.copyWith(original: value));
  });
}/// Create a copy of TripFormState
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
}
}

/// @nodoc


class TripFormSaved implements TripFormState {
  const TripFormSaved(this.trip, {required this.created});
  

 final  Trip trip;
 final  bool created;

/// Create a copy of TripFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripFormSavedCopyWith<TripFormSaved> get copyWith => _$TripFormSavedCopyWithImpl<TripFormSaved>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TripFormSaved&&(identical(other.trip, trip) || other.trip == trip)&&(identical(other.created, created) || other.created == created));
}


@override
int get hashCode {
    return Object.hash(runtimeType,trip,created);
}

@override
String toString() {
    return 'TripFormState.saved(trip: $trip, created: $created)';
}


}

/// @nodoc
abstract mixin class $TripFormSavedCopyWith<$Res> implements $TripFormStateCopyWith<$Res> {
  factory $TripFormSavedCopyWith(TripFormSaved value, $Res Function(TripFormSaved) _then) = _$TripFormSavedCopyWithImpl;
@useResult
$Res call({
 Trip trip, bool created
});


$TripCopyWith<$Res> get trip;

}
/// @nodoc
class _$TripFormSavedCopyWithImpl<$Res>
    implements $TripFormSavedCopyWith<$Res> {
  _$TripFormSavedCopyWithImpl(this._self, this._then);

  final TripFormSaved _self;
  final $Res Function(TripFormSaved) _then;

/// Create a copy of TripFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? trip = null,Object? created = null,}) {
  return _then(TripFormSaved(
null == trip ? _self.trip : trip // ignore: cast_nullable_to_non_nullable
as Trip,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of TripFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripCopyWith<$Res> get trip {
  
  return $TripCopyWith<$Res>(_self.trip, (value) {
    return _then(_self.copyWith(trip: value));
  });
}
}

/// @nodoc


class TripFormLoadFailure implements TripFormState {
  const TripFormLoadFailure(this.failure);
  

 final  Failure failure;

/// Create a copy of TripFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripFormLoadFailureCopyWith<TripFormLoadFailure> get copyWith => _$TripFormLoadFailureCopyWithImpl<TripFormLoadFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TripFormLoadFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,failure);
}

@override
String toString() {
    return 'TripFormState.loadFailure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $TripFormLoadFailureCopyWith<$Res> implements $TripFormStateCopyWith<$Res> {
  factory $TripFormLoadFailureCopyWith(TripFormLoadFailure value, $Res Function(TripFormLoadFailure) _then) = _$TripFormLoadFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$TripFormLoadFailureCopyWithImpl<$Res>
    implements $TripFormLoadFailureCopyWith<$Res> {
  _$TripFormLoadFailureCopyWithImpl(this._self, this._then);

  final TripFormLoadFailure _self;
  final $Res Function(TripFormLoadFailure) _then;

/// Create a copy of TripFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(TripFormLoadFailure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of TripFormState
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
