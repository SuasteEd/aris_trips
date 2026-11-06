// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bulk_assign_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BulkAssignState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BulkAssignState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'BulkAssignState()';
}


}

/// @nodoc
class $BulkAssignStateCopyWith<$Res>  {
$BulkAssignStateCopyWith(BulkAssignState _, $Res Function(BulkAssignState) __);
}


/// Adds pattern-matching-related methods to [BulkAssignState].
extension BulkAssignStatePatterns on BulkAssignState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BulkAssignLoading value)?  loading,TResult Function( BulkAssignReady value)?  ready,TResult Function( BulkAssignFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BulkAssignLoading() when loading != null:
return loading(_that);case BulkAssignReady() when ready != null:
return ready(_that);case BulkAssignFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BulkAssignLoading value)  loading,required TResult Function( BulkAssignReady value)  ready,required TResult Function( BulkAssignFailure value)  failure,}){
final _that = this;
switch (_that) {
case BulkAssignLoading():
return loading(_that);case BulkAssignReady():
return ready(_that);case BulkAssignFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BulkAssignLoading value)?  loading,TResult? Function( BulkAssignReady value)?  ready,TResult? Function( BulkAssignFailure value)?  failure,}){
final _that = this;
switch (_that) {
case BulkAssignLoading() when loading != null:
return loading(_that);case BulkAssignReady() when ready != null:
return ready(_that);case BulkAssignFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<Booking> bookings,  List<Flight> flights,  List<Lodging> lodgings,  BulkTarget target,  String? targetId,  Set<String> selected,  bool submitting,  Failure? failure,  int? added)?  ready,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BulkAssignLoading() when loading != null:
return loading();case BulkAssignReady() when ready != null:
return ready(_that.bookings,_that.flights,_that.lodgings,_that.target,_that.targetId,_that.selected,_that.submitting,_that.failure,_that.added);case BulkAssignFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<Booking> bookings,  List<Flight> flights,  List<Lodging> lodgings,  BulkTarget target,  String? targetId,  Set<String> selected,  bool submitting,  Failure? failure,  int? added)  ready,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case BulkAssignLoading():
return loading();case BulkAssignReady():
return ready(_that.bookings,_that.flights,_that.lodgings,_that.target,_that.targetId,_that.selected,_that.submitting,_that.failure,_that.added);case BulkAssignFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<Booking> bookings,  List<Flight> flights,  List<Lodging> lodgings,  BulkTarget target,  String? targetId,  Set<String> selected,  bool submitting,  Failure? failure,  int? added)?  ready,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case BulkAssignLoading() when loading != null:
return loading();case BulkAssignReady() when ready != null:
return ready(_that.bookings,_that.flights,_that.lodgings,_that.target,_that.targetId,_that.selected,_that.submitting,_that.failure,_that.added);case BulkAssignFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class BulkAssignLoading implements BulkAssignState {
  const BulkAssignLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BulkAssignLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'BulkAssignState.loading()';
}


}




/// @nodoc


class BulkAssignReady implements BulkAssignState {
  const BulkAssignReady({required  List<Booking> bookings, required  List<Flight> flights, required  List<Lodging> lodgings, this.target = BulkTarget.flight, this.targetId,  Set<String> selected = const {}, this.submitting = false, this.failure, this.added}): _bookings = bookings,_flights = flights,_lodgings = lodgings,_selected = selected;
  

 final  List<Booking> _bookings;
 List<Booking> get bookings {
  if (_bookings is EqualUnmodifiableListView) return _bookings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bookings);
}

 final  List<Flight> _flights;
 List<Flight> get flights {
  if (_flights is EqualUnmodifiableListView) return _flights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_flights);
}

 final  List<Lodging> _lodgings;
 List<Lodging> get lodgings {
  if (_lodgings is EqualUnmodifiableListView) return _lodgings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lodgings);
}

@JsonKey() final  BulkTarget target;
 final  String? targetId;
 final  Set<String> _selected;
@JsonKey() Set<String> get selected {
  if (_selected is EqualUnmodifiableSetView) return _selected;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selected);
}

@JsonKey() final  bool submitting;
 final  Failure? failure;
/// Bookings added by the last submit.
 final  int? added;

/// Create a copy of BulkAssignState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BulkAssignReadyCopyWith<BulkAssignReady> get copyWith => _$BulkAssignReadyCopyWithImpl<BulkAssignReady>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BulkAssignReady&&const DeepCollectionEquality().equals(other.bookings, _bookings)&&const DeepCollectionEquality().equals(other.flights, _flights)&&const DeepCollectionEquality().equals(other.lodgings, _lodgings)&&(identical(other.target, target) || other.target == target)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&const DeepCollectionEquality().equals(other.selected, _selected)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.added, added) || other.added == added));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_bookings),const DeepCollectionEquality().hash(_flights),const DeepCollectionEquality().hash(_lodgings),target,targetId,const DeepCollectionEquality().hash(_selected),submitting,failure,added);
}

@override
String toString() {
    return 'BulkAssignState.ready(bookings: $bookings, flights: $flights, lodgings: $lodgings, target: $target, targetId: $targetId, selected: $selected, submitting: $submitting, failure: $failure, added: $added)';
}


}

/// @nodoc
abstract mixin class $BulkAssignReadyCopyWith<$Res> implements $BulkAssignStateCopyWith<$Res> {
  factory $BulkAssignReadyCopyWith(BulkAssignReady value, $Res Function(BulkAssignReady) _then) = _$BulkAssignReadyCopyWithImpl;
@useResult
$Res call({
 List<Booking> bookings, List<Flight> flights, List<Lodging> lodgings, BulkTarget target, String? targetId, Set<String> selected, bool submitting, Failure? failure, int? added
});


$FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class _$BulkAssignReadyCopyWithImpl<$Res>
    implements $BulkAssignReadyCopyWith<$Res> {
  _$BulkAssignReadyCopyWithImpl(this._self, this._then);

  final BulkAssignReady _self;
  final $Res Function(BulkAssignReady) _then;

/// Create a copy of BulkAssignState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bookings = null,Object? flights = null,Object? lodgings = null,Object? target = null,Object? targetId = freezed,Object? selected = null,Object? submitting = null,Object? failure = freezed,Object? added = freezed,}) {
  return _then(BulkAssignReady(
bookings: null == bookings ? _self._bookings : bookings // ignore: cast_nullable_to_non_nullable
as List<Booking>,flights: null == flights ? _self._flights : flights // ignore: cast_nullable_to_non_nullable
as List<Flight>,lodgings: null == lodgings ? _self._lodgings : lodgings // ignore: cast_nullable_to_non_nullable
as List<Lodging>,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as BulkTarget,targetId: freezed == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String?,selected: null == selected ? _self._selected : selected // ignore: cast_nullable_to_non_nullable
as Set<String>,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,added: freezed == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of BulkAssignState
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


class BulkAssignFailure implements BulkAssignState {
  const BulkAssignFailure(this.failure);
  

 final  Failure failure;

/// Create a copy of BulkAssignState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BulkAssignFailureCopyWith<BulkAssignFailure> get copyWith => _$BulkAssignFailureCopyWithImpl<BulkAssignFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BulkAssignFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,failure);
}

@override
String toString() {
    return 'BulkAssignState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $BulkAssignFailureCopyWith<$Res> implements $BulkAssignStateCopyWith<$Res> {
  factory $BulkAssignFailureCopyWith(BulkAssignFailure value, $Res Function(BulkAssignFailure) _then) = _$BulkAssignFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$BulkAssignFailureCopyWithImpl<$Res>
    implements $BulkAssignFailureCopyWith<$Res> {
  _$BulkAssignFailureCopyWithImpl(this._self, this._then);

  final BulkAssignFailure _self;
  final $Res Function(BulkAssignFailure) _then;

/// Create a copy of BulkAssignState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(BulkAssignFailure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of BulkAssignState
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
