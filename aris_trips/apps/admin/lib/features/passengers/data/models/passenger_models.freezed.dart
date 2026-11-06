// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'passenger_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PassengerModel {

 String get id; String get firstName; String get lastName; String? get email; String? get phone;
/// Create a copy of PassengerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PassengerModelCopyWith<PassengerModel> get copyWith => _$PassengerModelCopyWithImpl<PassengerModel>(this as PassengerModel, _$identity);

  /// Serializes this PassengerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PassengerModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PassengerModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.phone, _this.phone) || other.phone == _this.phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PassengerModel;
  return Object.hash(runtimeType,_this.id,_this.firstName,_this.lastName,_this.email,_this.phone);
}

@override
String toString() {
  final _this = this as PassengerModel;
  return 'PassengerModel(id: ${_this.id}, firstName: ${_this.firstName}, lastName: ${_this.lastName}, email: ${_this.email}, phone: ${_this.phone})';
}


}

/// @nodoc
abstract mixin class $PassengerModelCopyWith<$Res>  {
  factory $PassengerModelCopyWith(PassengerModel value, $Res Function(PassengerModel) _then) = _$PassengerModelCopyWithImpl;
@useResult
$Res call({
 String id, String firstName, String lastName, String? email, String? phone
});




}
/// @nodoc
class _$PassengerModelCopyWithImpl<$Res>
    implements $PassengerModelCopyWith<$Res> {
  _$PassengerModelCopyWithImpl(this._self, this._then);

  final PassengerModel _self;
  final $Res Function(PassengerModel) _then;

/// Create a copy of PassengerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? email = freezed,Object? phone = freezed,}) {
  return _then(PassengerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PassengerModel].
extension PassengerModelPatterns on PassengerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PassengerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PassengerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PassengerModel value)  $default,){
final _that = this;
switch (_that) {
case _PassengerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PassengerModel value)?  $default,){
final _that = this;
switch (_that) {
case _PassengerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String firstName,  String lastName,  String? email,  String? phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PassengerModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.email,_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String firstName,  String lastName,  String? email,  String? phone)  $default,) {final _that = this;
switch (_that) {
case _PassengerModel():
return $default(_that.id,_that.firstName,_that.lastName,_that.email,_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String firstName,  String lastName,  String? email,  String? phone)?  $default,) {final _that = this;
switch (_that) {
case _PassengerModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.email,_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PassengerModel extends PassengerModel {
  const _PassengerModel({required this.id, required this.firstName, required this.lastName, this.email, this.phone}): super._();
  factory _PassengerModel.fromJson(Map<String, dynamic> json) => _$PassengerModelFromJson(json);

@override final  String id;
@override final  String firstName;
@override final  String lastName;
@override final  String? email;
@override final  String? phone;

/// Create a copy of PassengerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PassengerModelCopyWith<_PassengerModel> get copyWith => __$PassengerModelCopyWithImpl<_PassengerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PassengerModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PassengerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,firstName,lastName,email,phone);
}

@override
String toString() {
    return 'PassengerModel(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$PassengerModelCopyWith<$Res> implements $PassengerModelCopyWith<$Res> {
  factory _$PassengerModelCopyWith(_PassengerModel value, $Res Function(_PassengerModel) _then) = __$PassengerModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String firstName, String lastName, String? email, String? phone
});




}
/// @nodoc
class __$PassengerModelCopyWithImpl<$Res>
    implements _$PassengerModelCopyWith<$Res> {
  __$PassengerModelCopyWithImpl(this._self, this._then);

  final _PassengerModel _self;
  final $Res Function(_PassengerModel) _then;

/// Create a copy of PassengerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? email = freezed,Object? phone = freezed,}) {
  return _then(_PassengerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$FlightAssignmentModel {

 String get id; String get bookingId; String get flightId; String? get seat; String? get recordLocator;
/// Create a copy of FlightAssignmentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlightAssignmentModelCopyWith<FlightAssignmentModel> get copyWith => _$FlightAssignmentModelCopyWithImpl<FlightAssignmentModel>(this as FlightAssignmentModel, _$identity);

  /// Serializes this FlightAssignmentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FlightAssignmentModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightAssignmentModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.bookingId, _this.bookingId) || other.bookingId == _this.bookingId)&&(identical(other.flightId, _this.flightId) || other.flightId == _this.flightId)&&(identical(other.seat, _this.seat) || other.seat == _this.seat)&&(identical(other.recordLocator, _this.recordLocator) || other.recordLocator == _this.recordLocator));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FlightAssignmentModel;
  return Object.hash(runtimeType,_this.id,_this.bookingId,_this.flightId,_this.seat,_this.recordLocator);
}

@override
String toString() {
  final _this = this as FlightAssignmentModel;
  return 'FlightAssignmentModel(id: ${_this.id}, bookingId: ${_this.bookingId}, flightId: ${_this.flightId}, seat: ${_this.seat}, recordLocator: ${_this.recordLocator})';
}


}

/// @nodoc
abstract mixin class $FlightAssignmentModelCopyWith<$Res>  {
  factory $FlightAssignmentModelCopyWith(FlightAssignmentModel value, $Res Function(FlightAssignmentModel) _then) = _$FlightAssignmentModelCopyWithImpl;
@useResult
$Res call({
 String id, String bookingId, String flightId, String? seat, String? recordLocator
});




}
/// @nodoc
class _$FlightAssignmentModelCopyWithImpl<$Res>
    implements $FlightAssignmentModelCopyWith<$Res> {
  _$FlightAssignmentModelCopyWithImpl(this._self, this._then);

  final FlightAssignmentModel _self;
  final $Res Function(FlightAssignmentModel) _then;

/// Create a copy of FlightAssignmentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? bookingId = null,Object? flightId = null,Object? seat = freezed,Object? recordLocator = freezed,}) {
  return _then(FlightAssignmentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bookingId: null == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String,flightId: null == flightId ? _self.flightId : flightId // ignore: cast_nullable_to_non_nullable
as String,seat: freezed == seat ? _self.seat : seat // ignore: cast_nullable_to_non_nullable
as String?,recordLocator: freezed == recordLocator ? _self.recordLocator : recordLocator // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FlightAssignmentModel].
extension FlightAssignmentModelPatterns on FlightAssignmentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlightAssignmentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlightAssignmentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlightAssignmentModel value)  $default,){
final _that = this;
switch (_that) {
case _FlightAssignmentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlightAssignmentModel value)?  $default,){
final _that = this;
switch (_that) {
case _FlightAssignmentModel() when $default != null:
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
case _FlightAssignmentModel() when $default != null:
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
case _FlightAssignmentModel():
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
case _FlightAssignmentModel() when $default != null:
return $default(_that.id,_that.bookingId,_that.flightId,_that.seat,_that.recordLocator);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlightAssignmentModel extends FlightAssignmentModel {
  const _FlightAssignmentModel({required this.id, required this.bookingId, required this.flightId, this.seat, this.recordLocator}): super._();
  factory _FlightAssignmentModel.fromJson(Map<String, dynamic> json) => _$FlightAssignmentModelFromJson(json);

@override final  String id;
@override final  String bookingId;
@override final  String flightId;
@override final  String? seat;
@override final  String? recordLocator;

/// Create a copy of FlightAssignmentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlightAssignmentModelCopyWith<_FlightAssignmentModel> get copyWith => __$FlightAssignmentModelCopyWithImpl<_FlightAssignmentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlightAssignmentModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlightAssignmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.flightId, flightId) || other.flightId == flightId)&&(identical(other.seat, seat) || other.seat == seat)&&(identical(other.recordLocator, recordLocator) || other.recordLocator == recordLocator));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,bookingId,flightId,seat,recordLocator);
}

@override
String toString() {
    return 'FlightAssignmentModel(id: $id, bookingId: $bookingId, flightId: $flightId, seat: $seat, recordLocator: $recordLocator)';
}


}

/// @nodoc
abstract mixin class _$FlightAssignmentModelCopyWith<$Res> implements $FlightAssignmentModelCopyWith<$Res> {
  factory _$FlightAssignmentModelCopyWith(_FlightAssignmentModel value, $Res Function(_FlightAssignmentModel) _then) = __$FlightAssignmentModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String bookingId, String flightId, String? seat, String? recordLocator
});




}
/// @nodoc
class __$FlightAssignmentModelCopyWithImpl<$Res>
    implements _$FlightAssignmentModelCopyWith<$Res> {
  __$FlightAssignmentModelCopyWithImpl(this._self, this._then);

  final _FlightAssignmentModel _self;
  final $Res Function(_FlightAssignmentModel) _then;

/// Create a copy of FlightAssignmentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? bookingId = null,Object? flightId = null,Object? seat = freezed,Object? recordLocator = freezed,}) {
  return _then(_FlightAssignmentModel(
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
mixin _$LodgingAssignmentModel {

 String get id; String get bookingId; String get lodgingId; String? get room; String? get confirmationNumber;
/// Create a copy of LodgingAssignmentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LodgingAssignmentModelCopyWith<LodgingAssignmentModel> get copyWith => _$LodgingAssignmentModelCopyWithImpl<LodgingAssignmentModel>(this as LodgingAssignmentModel, _$identity);

  /// Serializes this LodgingAssignmentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LodgingAssignmentModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LodgingAssignmentModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.bookingId, _this.bookingId) || other.bookingId == _this.bookingId)&&(identical(other.lodgingId, _this.lodgingId) || other.lodgingId == _this.lodgingId)&&(identical(other.room, _this.room) || other.room == _this.room)&&(identical(other.confirmationNumber, _this.confirmationNumber) || other.confirmationNumber == _this.confirmationNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LodgingAssignmentModel;
  return Object.hash(runtimeType,_this.id,_this.bookingId,_this.lodgingId,_this.room,_this.confirmationNumber);
}

@override
String toString() {
  final _this = this as LodgingAssignmentModel;
  return 'LodgingAssignmentModel(id: ${_this.id}, bookingId: ${_this.bookingId}, lodgingId: ${_this.lodgingId}, room: ${_this.room}, confirmationNumber: ${_this.confirmationNumber})';
}


}

/// @nodoc
abstract mixin class $LodgingAssignmentModelCopyWith<$Res>  {
  factory $LodgingAssignmentModelCopyWith(LodgingAssignmentModel value, $Res Function(LodgingAssignmentModel) _then) = _$LodgingAssignmentModelCopyWithImpl;
@useResult
$Res call({
 String id, String bookingId, String lodgingId, String? room, String? confirmationNumber
});




}
/// @nodoc
class _$LodgingAssignmentModelCopyWithImpl<$Res>
    implements $LodgingAssignmentModelCopyWith<$Res> {
  _$LodgingAssignmentModelCopyWithImpl(this._self, this._then);

  final LodgingAssignmentModel _self;
  final $Res Function(LodgingAssignmentModel) _then;

/// Create a copy of LodgingAssignmentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? bookingId = null,Object? lodgingId = null,Object? room = freezed,Object? confirmationNumber = freezed,}) {
  return _then(LodgingAssignmentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bookingId: null == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String,lodgingId: null == lodgingId ? _self.lodgingId : lodgingId // ignore: cast_nullable_to_non_nullable
as String,room: freezed == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as String?,confirmationNumber: freezed == confirmationNumber ? _self.confirmationNumber : confirmationNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LodgingAssignmentModel].
extension LodgingAssignmentModelPatterns on LodgingAssignmentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LodgingAssignmentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LodgingAssignmentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LodgingAssignmentModel value)  $default,){
final _that = this;
switch (_that) {
case _LodgingAssignmentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LodgingAssignmentModel value)?  $default,){
final _that = this;
switch (_that) {
case _LodgingAssignmentModel() when $default != null:
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
case _LodgingAssignmentModel() when $default != null:
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
case _LodgingAssignmentModel():
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
case _LodgingAssignmentModel() when $default != null:
return $default(_that.id,_that.bookingId,_that.lodgingId,_that.room,_that.confirmationNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LodgingAssignmentModel extends LodgingAssignmentModel {
  const _LodgingAssignmentModel({required this.id, required this.bookingId, required this.lodgingId, this.room, this.confirmationNumber}): super._();
  factory _LodgingAssignmentModel.fromJson(Map<String, dynamic> json) => _$LodgingAssignmentModelFromJson(json);

@override final  String id;
@override final  String bookingId;
@override final  String lodgingId;
@override final  String? room;
@override final  String? confirmationNumber;

/// Create a copy of LodgingAssignmentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LodgingAssignmentModelCopyWith<_LodgingAssignmentModel> get copyWith => __$LodgingAssignmentModelCopyWithImpl<_LodgingAssignmentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LodgingAssignmentModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LodgingAssignmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.lodgingId, lodgingId) || other.lodgingId == lodgingId)&&(identical(other.room, room) || other.room == room)&&(identical(other.confirmationNumber, confirmationNumber) || other.confirmationNumber == confirmationNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,bookingId,lodgingId,room,confirmationNumber);
}

@override
String toString() {
    return 'LodgingAssignmentModel(id: $id, bookingId: $bookingId, lodgingId: $lodgingId, room: $room, confirmationNumber: $confirmationNumber)';
}


}

/// @nodoc
abstract mixin class _$LodgingAssignmentModelCopyWith<$Res> implements $LodgingAssignmentModelCopyWith<$Res> {
  factory _$LodgingAssignmentModelCopyWith(_LodgingAssignmentModel value, $Res Function(_LodgingAssignmentModel) _then) = __$LodgingAssignmentModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String bookingId, String lodgingId, String? room, String? confirmationNumber
});




}
/// @nodoc
class __$LodgingAssignmentModelCopyWithImpl<$Res>
    implements _$LodgingAssignmentModelCopyWith<$Res> {
  __$LodgingAssignmentModelCopyWithImpl(this._self, this._then);

  final _LodgingAssignmentModel _self;
  final $Res Function(_LodgingAssignmentModel) _then;

/// Create a copy of LodgingAssignmentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? bookingId = null,Object? lodgingId = null,Object? room = freezed,Object? confirmationNumber = freezed,}) {
  return _then(_LodgingAssignmentModel(
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
mixin _$BookingModel {

 String get id; String get tripId; String get status; String? get notes; PassengerModel get passenger; List<FlightAssignmentModel> get flightAssignments; List<LodgingAssignmentModel> get lodgingAssignments;
/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingModelCopyWith<BookingModel> get copyWith => _$BookingModelCopyWithImpl<BookingModel>(this as BookingModel, _$identity);

  /// Serializes this BookingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BookingModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.tripId, _this.tripId) || other.tripId == _this.tripId)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.passenger, _this.passenger) || other.passenger == _this.passenger)&&const DeepCollectionEquality().equals(other.flightAssignments, _this.flightAssignments)&&const DeepCollectionEquality().equals(other.lodgingAssignments, _this.lodgingAssignments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BookingModel;
  return Object.hash(runtimeType,_this.id,_this.tripId,_this.status,_this.notes,_this.passenger,const DeepCollectionEquality().hash(_this.flightAssignments),const DeepCollectionEquality().hash(_this.lodgingAssignments));
}

@override
String toString() {
  final _this = this as BookingModel;
  return 'BookingModel(id: ${_this.id}, tripId: ${_this.tripId}, status: ${_this.status}, notes: ${_this.notes}, passenger: ${_this.passenger}, flightAssignments: ${_this.flightAssignments}, lodgingAssignments: ${_this.lodgingAssignments})';
}


}

/// @nodoc
abstract mixin class $BookingModelCopyWith<$Res>  {
  factory $BookingModelCopyWith(BookingModel value, $Res Function(BookingModel) _then) = _$BookingModelCopyWithImpl;
@useResult
$Res call({
 String id, String tripId, String status, String? notes, PassengerModel passenger, List<FlightAssignmentModel> flightAssignments, List<LodgingAssignmentModel> lodgingAssignments
});


$PassengerModelCopyWith<$Res> get passenger;

}
/// @nodoc
class _$BookingModelCopyWithImpl<$Res>
    implements $BookingModelCopyWith<$Res> {
  _$BookingModelCopyWithImpl(this._self, this._then);

  final BookingModel _self;
  final $Res Function(BookingModel) _then;

/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tripId = null,Object? status = null,Object? notes = freezed,Object? passenger = null,Object? flightAssignments = null,Object? lodgingAssignments = null,}) {
  return _then(BookingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,passenger: null == passenger ? _self.passenger : passenger // ignore: cast_nullable_to_non_nullable
as PassengerModel,flightAssignments: null == flightAssignments ? _self.flightAssignments : flightAssignments // ignore: cast_nullable_to_non_nullable
as List<FlightAssignmentModel>,lodgingAssignments: null == lodgingAssignments ? _self.lodgingAssignments : lodgingAssignments // ignore: cast_nullable_to_non_nullable
as List<LodgingAssignmentModel>,
  ));
}
/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PassengerModelCopyWith<$Res> get passenger {
  
  return $PassengerModelCopyWith<$Res>(_self.passenger, (value) {
    return _then(_self.copyWith(passenger: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookingModel].
extension BookingModelPatterns on BookingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingModel value)  $default,){
final _that = this;
switch (_that) {
case _BookingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tripId,  String status,  String? notes,  PassengerModel passenger,  List<FlightAssignmentModel> flightAssignments,  List<LodgingAssignmentModel> lodgingAssignments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingModel() when $default != null:
return $default(_that.id,_that.tripId,_that.status,_that.notes,_that.passenger,_that.flightAssignments,_that.lodgingAssignments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tripId,  String status,  String? notes,  PassengerModel passenger,  List<FlightAssignmentModel> flightAssignments,  List<LodgingAssignmentModel> lodgingAssignments)  $default,) {final _that = this;
switch (_that) {
case _BookingModel():
return $default(_that.id,_that.tripId,_that.status,_that.notes,_that.passenger,_that.flightAssignments,_that.lodgingAssignments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tripId,  String status,  String? notes,  PassengerModel passenger,  List<FlightAssignmentModel> flightAssignments,  List<LodgingAssignmentModel> lodgingAssignments)?  $default,) {final _that = this;
switch (_that) {
case _BookingModel() when $default != null:
return $default(_that.id,_that.tripId,_that.status,_that.notes,_that.passenger,_that.flightAssignments,_that.lodgingAssignments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingModel extends BookingModel {
  const _BookingModel({required this.id, required this.tripId, required this.status, this.notes, required this.passenger,  List<FlightAssignmentModel> flightAssignments = const [],  List<LodgingAssignmentModel> lodgingAssignments = const []}): _flightAssignments = flightAssignments,_lodgingAssignments = lodgingAssignments,super._();
  factory _BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);

@override final  String id;
@override final  String tripId;
@override final  String status;
@override final  String? notes;
@override final  PassengerModel passenger;
 final  List<FlightAssignmentModel> _flightAssignments;
@override@JsonKey() List<FlightAssignmentModel> get flightAssignments {
  if (_flightAssignments is EqualUnmodifiableListView) return _flightAssignments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_flightAssignments);
}

 final  List<LodgingAssignmentModel> _lodgingAssignments;
@override@JsonKey() List<LodgingAssignmentModel> get lodgingAssignments {
  if (_lodgingAssignments is EqualUnmodifiableListView) return _lodgingAssignments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lodgingAssignments);
}


/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingModelCopyWith<_BookingModel> get copyWith => __$BookingModelCopyWithImpl<_BookingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.passenger, passenger) || other.passenger == passenger)&&const DeepCollectionEquality().equals(other.flightAssignments, _flightAssignments)&&const DeepCollectionEquality().equals(other.lodgingAssignments, _lodgingAssignments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,tripId,status,notes,passenger,const DeepCollectionEquality().hash(_flightAssignments),const DeepCollectionEquality().hash(_lodgingAssignments));
}

@override
String toString() {
    return 'BookingModel(id: $id, tripId: $tripId, status: $status, notes: $notes, passenger: $passenger, flightAssignments: $flightAssignments, lodgingAssignments: $lodgingAssignments)';
}


}

/// @nodoc
abstract mixin class _$BookingModelCopyWith<$Res> implements $BookingModelCopyWith<$Res> {
  factory _$BookingModelCopyWith(_BookingModel value, $Res Function(_BookingModel) _then) = __$BookingModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String tripId, String status, String? notes, PassengerModel passenger, List<FlightAssignmentModel> flightAssignments, List<LodgingAssignmentModel> lodgingAssignments
});


@override $PassengerModelCopyWith<$Res> get passenger;

}
/// @nodoc
class __$BookingModelCopyWithImpl<$Res>
    implements _$BookingModelCopyWith<$Res> {
  __$BookingModelCopyWithImpl(this._self, this._then);

  final _BookingModel _self;
  final $Res Function(_BookingModel) _then;

/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tripId = null,Object? status = null,Object? notes = freezed,Object? passenger = null,Object? flightAssignments = null,Object? lodgingAssignments = null,}) {
  return _then(_BookingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,passenger: null == passenger ? _self.passenger : passenger // ignore: cast_nullable_to_non_nullable
as PassengerModel,flightAssignments: null == flightAssignments ? _self._flightAssignments : flightAssignments // ignore: cast_nullable_to_non_nullable
as List<FlightAssignmentModel>,lodgingAssignments: null == lodgingAssignments ? _self._lodgingAssignments : lodgingAssignments // ignore: cast_nullable_to_non_nullable
as List<LodgingAssignmentModel>,
  ));
}

/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PassengerModelCopyWith<$Res> get passenger {
  
  return $PassengerModelCopyWith<$Res>(_self.passenger, (value) {
    return _then(_self.copyWith(passenger: value));
  });
}
}

// dart format on
