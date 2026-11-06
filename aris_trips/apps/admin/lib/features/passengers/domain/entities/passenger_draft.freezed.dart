// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'passenger_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PassengerDraft {

 String get firstName; String get lastName; String get email; String get phone;
/// Create a copy of PassengerDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PassengerDraftCopyWith<PassengerDraft> get copyWith => _$PassengerDraftCopyWithImpl<PassengerDraft>(this as PassengerDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PassengerDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PassengerDraft&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.phone, _this.phone) || other.phone == _this.phone));
}


@override
int get hashCode {
  final _this = this as PassengerDraft;
  return Object.hash(runtimeType,_this.firstName,_this.lastName,_this.email,_this.phone);
}

@override
String toString() {
  final _this = this as PassengerDraft;
  return 'PassengerDraft(firstName: ${_this.firstName}, lastName: ${_this.lastName}, email: ${_this.email}, phone: ${_this.phone})';
}


}

/// @nodoc
abstract mixin class $PassengerDraftCopyWith<$Res>  {
  factory $PassengerDraftCopyWith(PassengerDraft value, $Res Function(PassengerDraft) _then) = _$PassengerDraftCopyWithImpl;
@useResult
$Res call({
 String firstName, String lastName, String email, String phone
});




}
/// @nodoc
class _$PassengerDraftCopyWithImpl<$Res>
    implements $PassengerDraftCopyWith<$Res> {
  _$PassengerDraftCopyWithImpl(this._self, this._then);

  final PassengerDraft _self;
  final $Res Function(PassengerDraft) _then;

/// Create a copy of PassengerDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? email = null,Object? phone = null,}) {
  return _then(PassengerDraft(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PassengerDraft].
extension PassengerDraftPatterns on PassengerDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PassengerDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PassengerDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PassengerDraft value)  $default,){
final _that = this;
switch (_that) {
case _PassengerDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PassengerDraft value)?  $default,){
final _that = this;
switch (_that) {
case _PassengerDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String email,  String phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PassengerDraft() when $default != null:
return $default(_that.firstName,_that.lastName,_that.email,_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String email,  String phone)  $default,) {final _that = this;
switch (_that) {
case _PassengerDraft():
return $default(_that.firstName,_that.lastName,_that.email,_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String firstName,  String lastName,  String email,  String phone)?  $default,) {final _that = this;
switch (_that) {
case _PassengerDraft() when $default != null:
return $default(_that.firstName,_that.lastName,_that.email,_that.phone);case _:
  return null;

}
}

}

/// @nodoc


class _PassengerDraft extends PassengerDraft {
  const _PassengerDraft({this.firstName = '', this.lastName = '', this.email = '', this.phone = ''}): super._();
  

@override@JsonKey() final  String firstName;
@override@JsonKey() final  String lastName;
@override@JsonKey() final  String email;
@override@JsonKey() final  String phone;

/// Create a copy of PassengerDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PassengerDraftCopyWith<_PassengerDraft> get copyWith => __$PassengerDraftCopyWithImpl<_PassengerDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PassengerDraft&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone));
}


@override
int get hashCode {
    return Object.hash(runtimeType,firstName,lastName,email,phone);
}

@override
String toString() {
    return 'PassengerDraft(firstName: $firstName, lastName: $lastName, email: $email, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$PassengerDraftCopyWith<$Res> implements $PassengerDraftCopyWith<$Res> {
  factory _$PassengerDraftCopyWith(_PassengerDraft value, $Res Function(_PassengerDraft) _then) = __$PassengerDraftCopyWithImpl;
@override @useResult
$Res call({
 String firstName, String lastName, String email, String phone
});




}
/// @nodoc
class __$PassengerDraftCopyWithImpl<$Res>
    implements _$PassengerDraftCopyWith<$Res> {
  __$PassengerDraftCopyWithImpl(this._self, this._then);

  final _PassengerDraft _self;
  final $Res Function(_PassengerDraft) _then;

/// Create a copy of PassengerDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? email = null,Object? phone = null,}) {
  return _then(_PassengerDraft(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
