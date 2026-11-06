// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingDetails {

 Booking get booking; List<Flight> get flights; List<Lodging> get lodgings; List<ItineraryItem> get activities;
/// Create a copy of BookingDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingDetailsCopyWith<BookingDetails> get copyWith => _$BookingDetailsCopyWithImpl<BookingDetails>(this as BookingDetails, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BookingDetails;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingDetails&&(identical(other.booking, _this.booking) || other.booking == _this.booking)&&const DeepCollectionEquality().equals(other.flights, _this.flights)&&const DeepCollectionEquality().equals(other.lodgings, _this.lodgings)&&const DeepCollectionEquality().equals(other.activities, _this.activities));
}


@override
int get hashCode {
  final _this = this as BookingDetails;
  return Object.hash(runtimeType,_this.booking,const DeepCollectionEquality().hash(_this.flights),const DeepCollectionEquality().hash(_this.lodgings),const DeepCollectionEquality().hash(_this.activities));
}

@override
String toString() {
  final _this = this as BookingDetails;
  return 'BookingDetails(booking: ${_this.booking}, flights: ${_this.flights}, lodgings: ${_this.lodgings}, activities: ${_this.activities})';
}


}

/// @nodoc
abstract mixin class $BookingDetailsCopyWith<$Res>  {
  factory $BookingDetailsCopyWith(BookingDetails value, $Res Function(BookingDetails) _then) = _$BookingDetailsCopyWithImpl;
@useResult
$Res call({
 Booking booking, List<Flight> flights, List<Lodging> lodgings, List<ItineraryItem> activities
});


$BookingCopyWith<$Res> get booking;

}
/// @nodoc
class _$BookingDetailsCopyWithImpl<$Res>
    implements $BookingDetailsCopyWith<$Res> {
  _$BookingDetailsCopyWithImpl(this._self, this._then);

  final BookingDetails _self;
  final $Res Function(BookingDetails) _then;

/// Create a copy of BookingDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? booking = null,Object? flights = null,Object? lodgings = null,Object? activities = null,}) {
  return _then(BookingDetails(
booking: null == booking ? _self.booking : booking // ignore: cast_nullable_to_non_nullable
as Booking,flights: null == flights ? _self.flights : flights // ignore: cast_nullable_to_non_nullable
as List<Flight>,lodgings: null == lodgings ? _self.lodgings : lodgings // ignore: cast_nullable_to_non_nullable
as List<Lodging>,activities: null == activities ? _self.activities : activities // ignore: cast_nullable_to_non_nullable
as List<ItineraryItem>,
  ));
}
/// Create a copy of BookingDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingCopyWith<$Res> get booking {
  
  return $BookingCopyWith<$Res>(_self.booking, (value) {
    return _then(_self.copyWith(booking: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookingDetails].
extension BookingDetailsPatterns on BookingDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingDetails value)  $default,){
final _that = this;
switch (_that) {
case _BookingDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingDetails value)?  $default,){
final _that = this;
switch (_that) {
case _BookingDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Booking booking,  List<Flight> flights,  List<Lodging> lodgings,  List<ItineraryItem> activities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingDetails() when $default != null:
return $default(_that.booking,_that.flights,_that.lodgings,_that.activities);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Booking booking,  List<Flight> flights,  List<Lodging> lodgings,  List<ItineraryItem> activities)  $default,) {final _that = this;
switch (_that) {
case _BookingDetails():
return $default(_that.booking,_that.flights,_that.lodgings,_that.activities);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Booking booking,  List<Flight> flights,  List<Lodging> lodgings,  List<ItineraryItem> activities)?  $default,) {final _that = this;
switch (_that) {
case _BookingDetails() when $default != null:
return $default(_that.booking,_that.flights,_that.lodgings,_that.activities);case _:
  return null;

}
}

}

/// @nodoc


class _BookingDetails extends BookingDetails {
  const _BookingDetails({required this.booking, required  List<Flight> flights, required  List<Lodging> lodgings, required  List<ItineraryItem> activities}): _flights = flights,_lodgings = lodgings,_activities = activities,super._();
  

@override final  Booking booking;
 final  List<Flight> _flights;
@override List<Flight> get flights {
  if (_flights is EqualUnmodifiableListView) return _flights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_flights);
}

 final  List<Lodging> _lodgings;
@override List<Lodging> get lodgings {
  if (_lodgings is EqualUnmodifiableListView) return _lodgings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lodgings);
}

 final  List<ItineraryItem> _activities;
@override List<ItineraryItem> get activities {
  if (_activities is EqualUnmodifiableListView) return _activities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activities);
}


/// Create a copy of BookingDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingDetailsCopyWith<_BookingDetails> get copyWith => __$BookingDetailsCopyWithImpl<_BookingDetails>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingDetails&&(identical(other.booking, booking) || other.booking == booking)&&const DeepCollectionEquality().equals(other.flights, _flights)&&const DeepCollectionEquality().equals(other.lodgings, _lodgings)&&const DeepCollectionEquality().equals(other.activities, _activities));
}


@override
int get hashCode {
    return Object.hash(runtimeType,booking,const DeepCollectionEquality().hash(_flights),const DeepCollectionEquality().hash(_lodgings),const DeepCollectionEquality().hash(_activities));
}

@override
String toString() {
    return 'BookingDetails(booking: $booking, flights: $flights, lodgings: $lodgings, activities: $activities)';
}


}

/// @nodoc
abstract mixin class _$BookingDetailsCopyWith<$Res> implements $BookingDetailsCopyWith<$Res> {
  factory _$BookingDetailsCopyWith(_BookingDetails value, $Res Function(_BookingDetails) _then) = __$BookingDetailsCopyWithImpl;
@override @useResult
$Res call({
 Booking booking, List<Flight> flights, List<Lodging> lodgings, List<ItineraryItem> activities
});


@override $BookingCopyWith<$Res> get booking;

}
/// @nodoc
class __$BookingDetailsCopyWithImpl<$Res>
    implements _$BookingDetailsCopyWith<$Res> {
  __$BookingDetailsCopyWithImpl(this._self, this._then);

  final _BookingDetails _self;
  final $Res Function(_BookingDetails) _then;

/// Create a copy of BookingDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? booking = null,Object? flights = null,Object? lodgings = null,Object? activities = null,}) {
  return _then(_BookingDetails(
booking: null == booking ? _self.booking : booking // ignore: cast_nullable_to_non_nullable
as Booking,flights: null == flights ? _self._flights : flights // ignore: cast_nullable_to_non_nullable
as List<Flight>,lodgings: null == lodgings ? _self._lodgings : lodgings // ignore: cast_nullable_to_non_nullable
as List<Lodging>,activities: null == activities ? _self._activities : activities // ignore: cast_nullable_to_non_nullable
as List<ItineraryItem>,
  ));
}

/// Create a copy of BookingDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingCopyWith<$Res> get booking {
  
  return $BookingCopyWith<$Res>(_self.booking, (value) {
    return _then(_self.copyWith(booking: value));
  });
}
}

/// @nodoc
mixin _$BookingState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'BookingState()';
}


}

/// @nodoc
class $BookingStateCopyWith<$Res>  {
$BookingStateCopyWith(BookingState _, $Res Function(BookingState) __);
}


/// Adds pattern-matching-related methods to [BookingState].
extension BookingStatePatterns on BookingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BookingLoading value)?  loading,TResult Function( BookingLoaded value)?  loaded,TResult Function( BookingFailure value)?  failure,TResult Function( BookingRemoved value)?  removed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BookingLoading() when loading != null:
return loading(_that);case BookingLoaded() when loaded != null:
return loaded(_that);case BookingFailure() when failure != null:
return failure(_that);case BookingRemoved() when removed != null:
return removed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BookingLoading value)  loading,required TResult Function( BookingLoaded value)  loaded,required TResult Function( BookingFailure value)  failure,required TResult Function( BookingRemoved value)  removed,}){
final _that = this;
switch (_that) {
case BookingLoading():
return loading(_that);case BookingLoaded():
return loaded(_that);case BookingFailure():
return failure(_that);case BookingRemoved():
return removed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BookingLoading value)?  loading,TResult? Function( BookingLoaded value)?  loaded,TResult? Function( BookingFailure value)?  failure,TResult? Function( BookingRemoved value)?  removed,}){
final _that = this;
switch (_that) {
case BookingLoading() when loading != null:
return loading(_that);case BookingLoaded() when loaded != null:
return loaded(_that);case BookingFailure() when failure != null:
return failure(_that);case BookingRemoved() when removed != null:
return removed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( BookingDetails details,  bool busy,  Failure? actionFailure)?  loaded,TResult Function( Failure failure)?  failure,TResult Function()?  removed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BookingLoading() when loading != null:
return loading();case BookingLoaded() when loaded != null:
return loaded(_that.details,_that.busy,_that.actionFailure);case BookingFailure() when failure != null:
return failure(_that.failure);case BookingRemoved() when removed != null:
return removed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( BookingDetails details,  bool busy,  Failure? actionFailure)  loaded,required TResult Function( Failure failure)  failure,required TResult Function()  removed,}) {final _that = this;
switch (_that) {
case BookingLoading():
return loading();case BookingLoaded():
return loaded(_that.details,_that.busy,_that.actionFailure);case BookingFailure():
return failure(_that.failure);case BookingRemoved():
return removed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( BookingDetails details,  bool busy,  Failure? actionFailure)?  loaded,TResult? Function( Failure failure)?  failure,TResult? Function()?  removed,}) {final _that = this;
switch (_that) {
case BookingLoading() when loading != null:
return loading();case BookingLoaded() when loaded != null:
return loaded(_that.details,_that.busy,_that.actionFailure);case BookingFailure() when failure != null:
return failure(_that.failure);case BookingRemoved() when removed != null:
return removed();case _:
  return null;

}
}

}

/// @nodoc


class BookingLoading implements BookingState {
  const BookingLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'BookingState.loading()';
}


}




/// @nodoc


class BookingLoaded implements BookingState {
  const BookingLoaded(this.details, {this.busy = false, this.actionFailure});
  

 final  BookingDetails details;
@JsonKey() final  bool busy;
 final  Failure? actionFailure;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingLoadedCopyWith<BookingLoaded> get copyWith => _$BookingLoadedCopyWithImpl<BookingLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingLoaded&&(identical(other.details, details) || other.details == details)&&(identical(other.busy, busy) || other.busy == busy)&&(identical(other.actionFailure, actionFailure) || other.actionFailure == actionFailure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,details,busy,actionFailure);
}

@override
String toString() {
    return 'BookingState.loaded(details: $details, busy: $busy, actionFailure: $actionFailure)';
}


}

/// @nodoc
abstract mixin class $BookingLoadedCopyWith<$Res> implements $BookingStateCopyWith<$Res> {
  factory $BookingLoadedCopyWith(BookingLoaded value, $Res Function(BookingLoaded) _then) = _$BookingLoadedCopyWithImpl;
@useResult
$Res call({
 BookingDetails details, bool busy, Failure? actionFailure
});


$BookingDetailsCopyWith<$Res> get details;$FailureCopyWith<$Res>? get actionFailure;

}
/// @nodoc
class _$BookingLoadedCopyWithImpl<$Res>
    implements $BookingLoadedCopyWith<$Res> {
  _$BookingLoadedCopyWithImpl(this._self, this._then);

  final BookingLoaded _self;
  final $Res Function(BookingLoaded) _then;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? details = null,Object? busy = null,Object? actionFailure = freezed,}) {
  return _then(BookingLoaded(
null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as BookingDetails,busy: null == busy ? _self.busy : busy // ignore: cast_nullable_to_non_nullable
as bool,actionFailure: freezed == actionFailure ? _self.actionFailure : actionFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingDetailsCopyWith<$Res> get details {
  
  return $BookingDetailsCopyWith<$Res>(_self.details, (value) {
    return _then(_self.copyWith(details: value));
  });
}/// Create a copy of BookingState
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


class BookingFailure implements BookingState {
  const BookingFailure(this.failure);
  

 final  Failure failure;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingFailureCopyWith<BookingFailure> get copyWith => _$BookingFailureCopyWithImpl<BookingFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,failure);
}

@override
String toString() {
    return 'BookingState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $BookingFailureCopyWith<$Res> implements $BookingStateCopyWith<$Res> {
  factory $BookingFailureCopyWith(BookingFailure value, $Res Function(BookingFailure) _then) = _$BookingFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$BookingFailureCopyWithImpl<$Res>
    implements $BookingFailureCopyWith<$Res> {
  _$BookingFailureCopyWithImpl(this._self, this._then);

  final BookingFailure _self;
  final $Res Function(BookingFailure) _then;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(BookingFailure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res> get failure {
  
  return $FailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

/// @nodoc


class BookingRemoved implements BookingState {
  const BookingRemoved();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingRemoved);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'BookingState.removed()';
}


}




// dart format on
