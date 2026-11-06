// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SessionState()';
}


}

/// @nodoc
class $SessionStateCopyWith<$Res>  {
$SessionStateCopyWith(SessionState _, $Res Function(SessionState) __);
}


/// Adds pattern-matching-related methods to [SessionState].
extension SessionStatePatterns on SessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SessionUnknown value)?  unknown,TResult Function( SessionAuthenticated value)?  authenticated,TResult Function( SessionUnauthenticated value)?  unauthenticated,TResult Function( SessionFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SessionUnknown() when unknown != null:
return unknown(_that);case SessionAuthenticated() when authenticated != null:
return authenticated(_that);case SessionUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case SessionFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SessionUnknown value)  unknown,required TResult Function( SessionAuthenticated value)  authenticated,required TResult Function( SessionUnauthenticated value)  unauthenticated,required TResult Function( SessionFailure value)  failure,}){
final _that = this;
switch (_that) {
case SessionUnknown():
return unknown(_that);case SessionAuthenticated():
return authenticated(_that);case SessionUnauthenticated():
return unauthenticated(_that);case SessionFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SessionUnknown value)?  unknown,TResult? Function( SessionAuthenticated value)?  authenticated,TResult? Function( SessionUnauthenticated value)?  unauthenticated,TResult? Function( SessionFailure value)?  failure,}){
final _that = this;
switch (_that) {
case SessionUnknown() when unknown != null:
return unknown(_that);case SessionAuthenticated() when authenticated != null:
return authenticated(_that);case SessionUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case SessionFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  unknown,TResult Function( AdminUser admin)?  authenticated,TResult Function()?  unauthenticated,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SessionUnknown() when unknown != null:
return unknown();case SessionAuthenticated() when authenticated != null:
return authenticated(_that.admin);case SessionUnauthenticated() when unauthenticated != null:
return unauthenticated();case SessionFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  unknown,required TResult Function( AdminUser admin)  authenticated,required TResult Function()  unauthenticated,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case SessionUnknown():
return unknown();case SessionAuthenticated():
return authenticated(_that.admin);case SessionUnauthenticated():
return unauthenticated();case SessionFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  unknown,TResult? Function( AdminUser admin)?  authenticated,TResult? Function()?  unauthenticated,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case SessionUnknown() when unknown != null:
return unknown();case SessionAuthenticated() when authenticated != null:
return authenticated(_that.admin);case SessionUnauthenticated() when unauthenticated != null:
return unauthenticated();case SessionFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class SessionUnknown implements SessionState {
  const SessionUnknown();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionUnknown);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SessionState.unknown()';
}


}




/// @nodoc


class SessionAuthenticated implements SessionState {
  const SessionAuthenticated(this.admin);
  

 final  AdminUser admin;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionAuthenticatedCopyWith<SessionAuthenticated> get copyWith => _$SessionAuthenticatedCopyWithImpl<SessionAuthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionAuthenticated&&(identical(other.admin, admin) || other.admin == admin));
}


@override
int get hashCode {
    return Object.hash(runtimeType,admin);
}

@override
String toString() {
    return 'SessionState.authenticated(admin: $admin)';
}


}

/// @nodoc
abstract mixin class $SessionAuthenticatedCopyWith<$Res> implements $SessionStateCopyWith<$Res> {
  factory $SessionAuthenticatedCopyWith(SessionAuthenticated value, $Res Function(SessionAuthenticated) _then) = _$SessionAuthenticatedCopyWithImpl;
@useResult
$Res call({
 AdminUser admin
});


$AdminUserCopyWith<$Res> get admin;

}
/// @nodoc
class _$SessionAuthenticatedCopyWithImpl<$Res>
    implements $SessionAuthenticatedCopyWith<$Res> {
  _$SessionAuthenticatedCopyWithImpl(this._self, this._then);

  final SessionAuthenticated _self;
  final $Res Function(SessionAuthenticated) _then;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? admin = null,}) {
  return _then(SessionAuthenticated(
null == admin ? _self.admin : admin // ignore: cast_nullable_to_non_nullable
as AdminUser,
  ));
}

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AdminUserCopyWith<$Res> get admin {
  
  return $AdminUserCopyWith<$Res>(_self.admin, (value) {
    return _then(_self.copyWith(admin: value));
  });
}
}

/// @nodoc


class SessionUnauthenticated implements SessionState {
  const SessionUnauthenticated();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionUnauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SessionState.unauthenticated()';
}


}




/// @nodoc


class SessionFailure implements SessionState {
  const SessionFailure(this.failure);
  

 final  Failure failure;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionFailureCopyWith<SessionFailure> get copyWith => _$SessionFailureCopyWithImpl<SessionFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,failure);
}

@override
String toString() {
    return 'SessionState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $SessionFailureCopyWith<$Res> implements $SessionStateCopyWith<$Res> {
  factory $SessionFailureCopyWith(SessionFailure value, $Res Function(SessionFailure) _then) = _$SessionFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$SessionFailureCopyWithImpl<$Res>
    implements $SessionFailureCopyWith<$Res> {
  _$SessionFailureCopyWithImpl(this._self, this._then);

  final SessionFailure _self;
  final $Res Function(SessionFailure) _then;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(SessionFailure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of SessionState
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
