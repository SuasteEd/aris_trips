// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'passenger.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Passenger {

 String get id; String get firstName; String get lastName; String? get email; String? get phone;
/// Create a copy of Passenger
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PassengerCopyWith<Passenger> get copyWith => _$PassengerCopyWithImpl<Passenger>(this as Passenger, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Passenger;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Passenger&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.phone, _this.phone) || other.phone == _this.phone));
}


@override
int get hashCode {
  final _this = this as Passenger;
  return Object.hash(runtimeType,_this.id,_this.firstName,_this.lastName,_this.email,_this.phone);
}

@override
String toString() {
  final _this = this as Passenger;
  return 'Passenger(id: ${_this.id}, firstName: ${_this.firstName}, lastName: ${_this.lastName}, email: ${_this.email}, phone: ${_this.phone})';
}


}

/// @nodoc
abstract mixin class $PassengerCopyWith<$Res>  {
  factory $PassengerCopyWith(Passenger value, $Res Function(Passenger) _then) = _$PassengerCopyWithImpl;
@useResult
$Res call({
 String id, String firstName, String lastName, String? email, String? phone
});




}
/// @nodoc
class _$PassengerCopyWithImpl<$Res>
    implements $PassengerCopyWith<$Res> {
  _$PassengerCopyWithImpl(this._self, this._then);

  final Passenger _self;
  final $Res Function(Passenger) _then;

/// Create a copy of Passenger
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? email = freezed,Object? phone = freezed,}) {
  return _then(Passenger(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Passenger].
extension PassengerPatterns on Passenger {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Passenger value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Passenger() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Passenger value)  $default,){
final _that = this;
switch (_that) {
case _Passenger():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Passenger value)?  $default,){
final _that = this;
switch (_that) {
case _Passenger() when $default != null:
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
case _Passenger() when $default != null:
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
case _Passenger():
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
case _Passenger() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.email,_that.phone);case _:
  return null;

}
}

}

/// @nodoc


class _Passenger extends Passenger {
  const _Passenger({required this.id, required this.firstName, required this.lastName, this.email, this.phone}): super._();
  

@override final  String id;
@override final  String firstName;
@override final  String lastName;
@override final  String? email;
@override final  String? phone;

/// Create a copy of Passenger
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PassengerCopyWith<_Passenger> get copyWith => __$PassengerCopyWithImpl<_Passenger>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Passenger&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,firstName,lastName,email,phone);
}

@override
String toString() {
    return 'Passenger(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$PassengerCopyWith<$Res> implements $PassengerCopyWith<$Res> {
  factory _$PassengerCopyWith(_Passenger value, $Res Function(_Passenger) _then) = __$PassengerCopyWithImpl;
@override @useResult
$Res call({
 String id, String firstName, String lastName, String? email, String? phone
});




}
/// @nodoc
class __$PassengerCopyWithImpl<$Res>
    implements _$PassengerCopyWith<$Res> {
  __$PassengerCopyWithImpl(this._self, this._then);

  final _Passenger _self;
  final $Res Function(_Passenger) _then;

/// Create a copy of Passenger
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? email = freezed,Object? phone = freezed,}) {
  return _then(_Passenger(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
