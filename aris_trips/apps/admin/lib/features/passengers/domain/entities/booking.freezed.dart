// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FlightAssignment {

 String get id; String get bookingId; String get flightId; String? get seat; String? get recordLocator;
/// Create a copy of FlightAssignment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlightAssignmentCopyWith<FlightAssignment> get copyWith => _$FlightAssignmentCopyWithImpl<FlightAssignment>(this as FlightAssignment, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as FlightAssignment;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightAssignment&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.bookingId, _this.bookingId) || other.bookingId == _this.bookingId)&&(identical(other.flightId, _this.flightId) || other.flightId == _this.flightId)&&(identical(other.seat, _this.seat) || other.seat == _this.seat)&&(identical(other.recordLocator, _this.recordLocator) || other.recordLocator == _this.recordLocator));
}


@override
int get hashCode {
  final _this = this as FlightAssignment;
  return Object.hash(runtimeType,_this.id,_this.bookingId,_this.flightId,_this.seat,_this.recordLocator);
}

@override
String toString() {
  final _this = this as FlightAssignment;
  return 'FlightAssignment(id: ${_this.id}, bookingId: ${_this.bookingId}, flightId: ${_this.flightId}, seat: ${_this.seat}, recordLocator: ${_this.recordLocator})';
}


}

/// @nodoc
abstract mixin class $FlightAssignmentCopyWith<$Res>  {
  factory $FlightAssignmentCopyWith(FlightAssignment value, $Res Function(FlightAssignment) _then) = _$FlightAssignmentCopyWithImpl;
@useResult
$Res call({
 String id, String bookingId, String flightId, String? seat, String? recordLocator
});




}
/// @nodoc
class _$FlightAssignmentCopyWithImpl<$Res>
    implements $FlightAssignmentCopyWith<$Res> {
  _$FlightAssignmentCopyWithImpl(this._self, this._then);

  final FlightAssignment _self;
  final $Res Function(FlightAssignment) _then;

/// Create a copy of FlightAssignment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? bookingId = null,Object? flightId = null,Object? seat = freezed,Object? recordLocator = freezed,}) {
  return _then(FlightAssignment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bookingId: null == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String,flightId: null == flightId ? _self.flightId : flightId // ignore: cast_nullable_to_non_nullable
as String,seat: freezed == seat ? _self.seat : seat // ignore: cast_nullable_to_non_nullable
as String?,recordLocator: freezed == recordLocator ? _self.recordLocator : recordLocator // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FlightAssignment].
extension FlightAssignmentPatterns on FlightAssignment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlightAssignment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlightAssignment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlightAssignment value)  $default,){
final _that = this;
switch (_that) {
case _FlightAssignment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlightAssignment value)?  $default,){
final _that = this;
switch (_that) {
case _FlightAssignment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String bookingId,  String flightId,  String? seat,  String? recordLocator)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlightAssignment() when $default != null:
return $default(_that.id,_that.bookingId,_that.flightId,_that.seat,_that.recordLocator);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String bookingId,  String flightId,  String? seat,  String? recordLocator)  $default,) {final _that = this;
switch (_that) {
case _FlightAssignment():
return $default(_that.id,_that.bookingId,_that.flightId,_that.seat,_that.recordLocator);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String bookingId,  String flightId,  String? seat,  String? recordLocator)?  $default,) {final _that = this;
switch (_that) {
case _FlightAssignment() when $default != null:
return $default(_that.id,_that.bookingId,_that.flightId,_that.seat,_that.recordLocator);case _:
  return null;

}
}

}

/// @nodoc


class _FlightAssignment implements FlightAssignment {
  const _FlightAssignment({required this.id, required this.bookingId, required this.flightId, this.seat, this.recordLocator});
  

@override final  String id;
@override final  String bookingId;
@override final  String flightId;
@override final  String? seat;
@override final  String? recordLocator;

/// Create a copy of FlightAssignment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlightAssignmentCopyWith<_FlightAssignment> get copyWith => __$FlightAssignmentCopyWithImpl<_FlightAssignment>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlightAssignment&&(identical(other.id, id) || other.id == id)&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.flightId, flightId) || other.flightId == flightId)&&(identical(other.seat, seat) || other.seat == seat)&&(identical(other.recordLocator, recordLocator) || other.recordLocator == recordLocator));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,bookingId,flightId,seat,recordLocator);
}

@override
String toString() {
    return 'FlightAssignment(id: $id, bookingId: $bookingId, flightId: $flightId, seat: $seat, recordLocator: $recordLocator)';
}


}

/// @nodoc
abstract mixin class _$FlightAssignmentCopyWith<$Res> implements $FlightAssignmentCopyWith<$Res> {
  factory _$FlightAssignmentCopyWith(_FlightAssignment value, $Res Function(_FlightAssignment) _then) = __$FlightAssignmentCopyWithImpl;
@override @useResult
$Res call({
 String id, String bookingId, String flightId, String? seat, String? recordLocator
});




}
/// @nodoc
class __$FlightAssignmentCopyWithImpl<$Res>
    implements _$FlightAssignmentCopyWith<$Res> {
  __$FlightAssignmentCopyWithImpl(this._self, this._then);

  final _FlightAssignment _self;
  final $Res Function(_FlightAssignment) _then;

/// Create a copy of FlightAssignment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? bookingId = null,Object? flightId = null,Object? seat = freezed,Object? recordLocator = freezed,}) {
  return _then(_FlightAssignment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bookingId: null == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String,flightId: null == flightId ? _self.flightId : flightId // ignore: cast_nullable_to_non_nullable
as String,seat: freezed == seat ? _self.seat : seat // ignore: cast_nullable_to_non_nullable
as String?,recordLocator: freezed == recordLocator ? _self.recordLocator : recordLocator // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$LodgingAssignment {

 String get id; String get bookingId; String get lodgingId; String? get room; String? get confirmationNumber;
/// Create a copy of LodgingAssignment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LodgingAssignmentCopyWith<LodgingAssignment> get copyWith => _$LodgingAssignmentCopyWithImpl<LodgingAssignment>(this as LodgingAssignment, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as LodgingAssignment;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LodgingAssignment&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.bookingId, _this.bookingId) || other.bookingId == _this.bookingId)&&(identical(other.lodgingId, _this.lodgingId) || other.lodgingId == _this.lodgingId)&&(identical(other.room, _this.room) || other.room == _this.room)&&(identical(other.confirmationNumber, _this.confirmationNumber) || other.confirmationNumber == _this.confirmationNumber));
}


@override
int get hashCode {
  final _this = this as LodgingAssignment;
  return Object.hash(runtimeType,_this.id,_this.bookingId,_this.lodgingId,_this.room,_this.confirmationNumber);
}

@override
String toString() {
  final _this = this as LodgingAssignment;
  return 'LodgingAssignment(id: ${_this.id}, bookingId: ${_this.bookingId}, lodgingId: ${_this.lodgingId}, room: ${_this.room}, confirmationNumber: ${_this.confirmationNumber})';
}


}

/// @nodoc
abstract mixin class $LodgingAssignmentCopyWith<$Res>  {
  factory $LodgingAssignmentCopyWith(LodgingAssignment value, $Res Function(LodgingAssignment) _then) = _$LodgingAssignmentCopyWithImpl;
@useResult
$Res call({
 String id, String bookingId, String lodgingId, String? room, String? confirmationNumber
});




}
/// @nodoc
class _$LodgingAssignmentCopyWithImpl<$Res>
    implements $LodgingAssignmentCopyWith<$Res> {
  _$LodgingAssignmentCopyWithImpl(this._self, this._then);

  final LodgingAssignment _self;
  final $Res Function(LodgingAssignment) _then;

/// Create a copy of LodgingAssignment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? bookingId = null,Object? lodgingId = null,Object? room = freezed,Object? confirmationNumber = freezed,}) {
  return _then(LodgingAssignment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bookingId: null == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String,lodgingId: null == lodgingId ? _self.lodgingId : lodgingId // ignore: cast_nullable_to_non_nullable
as String,room: freezed == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as String?,confirmationNumber: freezed == confirmationNumber ? _self.confirmationNumber : confirmationNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LodgingAssignment].
extension LodgingAssignmentPatterns on LodgingAssignment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LodgingAssignment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LodgingAssignment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LodgingAssignment value)  $default,){
final _that = this;
switch (_that) {
case _LodgingAssignment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LodgingAssignment value)?  $default,){
final _that = this;
switch (_that) {
case _LodgingAssignment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String bookingId,  String lodgingId,  String? room,  String? confirmationNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LodgingAssignment() when $default != null:
return $default(_that.id,_that.bookingId,_that.lodgingId,_that.room,_that.confirmationNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String bookingId,  String lodgingId,  String? room,  String? confirmationNumber)  $default,) {final _that = this;
switch (_that) {
case _LodgingAssignment():
return $default(_that.id,_that.bookingId,_that.lodgingId,_that.room,_that.confirmationNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String bookingId,  String lodgingId,  String? room,  String? confirmationNumber)?  $default,) {final _that = this;
switch (_that) {
case _LodgingAssignment() when $default != null:
return $default(_that.id,_that.bookingId,_that.lodgingId,_that.room,_that.confirmationNumber);case _:
  return null;

}
}

}

/// @nodoc


class _LodgingAssignment implements LodgingAssignment {
  const _LodgingAssignment({required this.id, required this.bookingId, required this.lodgingId, this.room, this.confirmationNumber});
  

@override final  String id;
@override final  String bookingId;
@override final  String lodgingId;
@override final  String? room;
@override final  String? confirmationNumber;

/// Create a copy of LodgingAssignment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LodgingAssignmentCopyWith<_LodgingAssignment> get copyWith => __$LodgingAssignmentCopyWithImpl<_LodgingAssignment>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LodgingAssignment&&(identical(other.id, id) || other.id == id)&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.lodgingId, lodgingId) || other.lodgingId == lodgingId)&&(identical(other.room, room) || other.room == room)&&(identical(other.confirmationNumber, confirmationNumber) || other.confirmationNumber == confirmationNumber));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,bookingId,lodgingId,room,confirmationNumber);
}

@override
String toString() {
    return 'LodgingAssignment(id: $id, bookingId: $bookingId, lodgingId: $lodgingId, room: $room, confirmationNumber: $confirmationNumber)';
}


}

/// @nodoc
abstract mixin class _$LodgingAssignmentCopyWith<$Res> implements $LodgingAssignmentCopyWith<$Res> {
  factory _$LodgingAssignmentCopyWith(_LodgingAssignment value, $Res Function(_LodgingAssignment) _then) = __$LodgingAssignmentCopyWithImpl;
@override @useResult
$Res call({
 String id, String bookingId, String lodgingId, String? room, String? confirmationNumber
});




}
/// @nodoc
class __$LodgingAssignmentCopyWithImpl<$Res>
    implements _$LodgingAssignmentCopyWith<$Res> {
  __$LodgingAssignmentCopyWithImpl(this._self, this._then);

  final _LodgingAssignment _self;
  final $Res Function(_LodgingAssignment) _then;

/// Create a copy of LodgingAssignment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? bookingId = null,Object? lodgingId = null,Object? room = freezed,Object? confirmationNumber = freezed,}) {
  return _then(_LodgingAssignment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bookingId: null == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String,lodgingId: null == lodgingId ? _self.lodgingId : lodgingId // ignore: cast_nullable_to_non_nullable
as String,room: freezed == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as String?,confirmationNumber: freezed == confirmationNumber ? _self.confirmationNumber : confirmationNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$Booking {

 String get id; String get tripId; Passenger get passenger; BookingStatus get status; String? get notes; List<FlightAssignment> get flightAssignments; List<LodgingAssignment> get lodgingAssignments;
/// Create a copy of Booking
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingCopyWith<Booking> get copyWith => _$BookingCopyWithImpl<Booking>(this as Booking, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Booking;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Booking&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.tripId, _this.tripId) || other.tripId == _this.tripId)&&(identical(other.passenger, _this.passenger) || other.passenger == _this.passenger)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&const DeepCollectionEquality().equals(other.flightAssignments, _this.flightAssignments)&&const DeepCollectionEquality().equals(other.lodgingAssignments, _this.lodgingAssignments));
}


@override
int get hashCode {
  final _this = this as Booking;
  return Object.hash(runtimeType,_this.id,_this.tripId,_this.passenger,_this.status,_this.notes,const DeepCollectionEquality().hash(_this.flightAssignments),const DeepCollectionEquality().hash(_this.lodgingAssignments));
}

@override
String toString() {
  final _this = this as Booking;
  return 'Booking(id: ${_this.id}, tripId: ${_this.tripId}, passenger: ${_this.passenger}, status: ${_this.status}, notes: ${_this.notes}, flightAssignments: ${_this.flightAssignments}, lodgingAssignments: ${_this.lodgingAssignments})';
}


}

/// @nodoc
abstract mixin class $BookingCopyWith<$Res>  {
  factory $BookingCopyWith(Booking value, $Res Function(Booking) _then) = _$BookingCopyWithImpl;
@useResult
$Res call({
 String id, String tripId, Passenger passenger, BookingStatus status, String? notes, List<FlightAssignment> flightAssignments, List<LodgingAssignment> lodgingAssignments
});


$PassengerCopyWith<$Res> get passenger;

}
/// @nodoc
class _$BookingCopyWithImpl<$Res>
    implements $BookingCopyWith<$Res> {
  _$BookingCopyWithImpl(this._self, this._then);

  final Booking _self;
  final $Res Function(Booking) _then;

/// Create a copy of Booking
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tripId = null,Object? passenger = null,Object? status = null,Object? notes = freezed,Object? flightAssignments = null,Object? lodgingAssignments = null,}) {
  return _then(Booking(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as String,passenger: null == passenger ? _self.passenger : passenger // ignore: cast_nullable_to_non_nullable
as Passenger,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BookingStatus,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,flightAssignments: null == flightAssignments ? _self.flightAssignments : flightAssignments // ignore: cast_nullable_to_non_nullable
as List<FlightAssignment>,lodgingAssignments: null == lodgingAssignments ? _self.lodgingAssignments : lodgingAssignments // ignore: cast_nullable_to_non_nullable
as List<LodgingAssignment>,
  ));
}
/// Create a copy of Booking
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PassengerCopyWith<$Res> get passenger {
  
  return $PassengerCopyWith<$Res>(_self.passenger, (value) {
    return _then(_self.copyWith(passenger: value));
  });
}
}


/// Adds pattern-matching-related methods to [Booking].
extension BookingPatterns on Booking {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Booking value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Booking() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Booking value)  $default,){
final _that = this;
switch (_that) {
case _Booking():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Booking value)?  $default,){
final _that = this;
switch (_that) {
case _Booking() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tripId,  Passenger passenger,  BookingStatus status,  String? notes,  List<FlightAssignment> flightAssignments,  List<LodgingAssignment> lodgingAssignments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Booking() when $default != null:
return $default(_that.id,_that.tripId,_that.passenger,_that.status,_that.notes,_that.flightAssignments,_that.lodgingAssignments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tripId,  Passenger passenger,  BookingStatus status,  String? notes,  List<FlightAssignment> flightAssignments,  List<LodgingAssignment> lodgingAssignments)  $default,) {final _that = this;
switch (_that) {
case _Booking():
return $default(_that.id,_that.tripId,_that.passenger,_that.status,_that.notes,_that.flightAssignments,_that.lodgingAssignments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tripId,  Passenger passenger,  BookingStatus status,  String? notes,  List<FlightAssignment> flightAssignments,  List<LodgingAssignment> lodgingAssignments)?  $default,) {final _that = this;
switch (_that) {
case _Booking() when $default != null:
return $default(_that.id,_that.tripId,_that.passenger,_that.status,_that.notes,_that.flightAssignments,_that.lodgingAssignments);case _:
  return null;

}
}

}

/// @nodoc


class _Booking extends Booking {
  const _Booking({required this.id, required this.tripId, required this.passenger, required this.status, this.notes,  List<FlightAssignment> flightAssignments = const [],  List<LodgingAssignment> lodgingAssignments = const []}): _flightAssignments = flightAssignments,_lodgingAssignments = lodgingAssignments,super._();
  

@override final  String id;
@override final  String tripId;
@override final  Passenger passenger;
@override final  BookingStatus status;
@override final  String? notes;
 final  List<FlightAssignment> _flightAssignments;
@override@JsonKey() List<FlightAssignment> get flightAssignments {
  if (_flightAssignments is EqualUnmodifiableListView) return _flightAssignments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_flightAssignments);
}

 final  List<LodgingAssignment> _lodgingAssignments;
@override@JsonKey() List<LodgingAssignment> get lodgingAssignments {
  if (_lodgingAssignments is EqualUnmodifiableListView) return _lodgingAssignments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lodgingAssignments);
}


/// Create a copy of Booking
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingCopyWith<_Booking> get copyWith => __$BookingCopyWithImpl<_Booking>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Booking&&(identical(other.id, id) || other.id == id)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.passenger, passenger) || other.passenger == passenger)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.flightAssignments, _flightAssignments)&&const DeepCollectionEquality().equals(other.lodgingAssignments, _lodgingAssignments));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,tripId,passenger,status,notes,const DeepCollectionEquality().hash(_flightAssignments),const DeepCollectionEquality().hash(_lodgingAssignments));
}

@override
String toString() {
    return 'Booking(id: $id, tripId: $tripId, passenger: $passenger, status: $status, notes: $notes, flightAssignments: $flightAssignments, lodgingAssignments: $lodgingAssignments)';
}


}

/// @nodoc
abstract mixin class _$BookingCopyWith<$Res> implements $BookingCopyWith<$Res> {
  factory _$BookingCopyWith(_Booking value, $Res Function(_Booking) _then) = __$BookingCopyWithImpl;
@override @useResult
$Res call({
 String id, String tripId, Passenger passenger, BookingStatus status, String? notes, List<FlightAssignment> flightAssignments, List<LodgingAssignment> lodgingAssignments
});


@override $PassengerCopyWith<$Res> get passenger;

}
/// @nodoc
class __$BookingCopyWithImpl<$Res>
    implements _$BookingCopyWith<$Res> {
  __$BookingCopyWithImpl(this._self, this._then);

  final _Booking _self;
  final $Res Function(_Booking) _then;

/// Create a copy of Booking
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tripId = null,Object? passenger = null,Object? status = null,Object? notes = freezed,Object? flightAssignments = null,Object? lodgingAssignments = null,}) {
  return _then(_Booking(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as String,passenger: null == passenger ? _self.passenger : passenger // ignore: cast_nullable_to_non_nullable
as Passenger,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BookingStatus,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,flightAssignments: null == flightAssignments ? _self._flightAssignments : flightAssignments // ignore: cast_nullable_to_non_nullable
as List<FlightAssignment>,lodgingAssignments: null == lodgingAssignments ? _self._lodgingAssignments : lodgingAssignments // ignore: cast_nullable_to_non_nullable
as List<LodgingAssignment>,
  ));
}

/// Create a copy of Booking
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PassengerCopyWith<$Res> get passenger {
  
  return $PassengerCopyWith<$Res>(_self.passenger, (value) {
    return _then(_self.copyWith(passenger: value));
  });
}
}

// dart format on
