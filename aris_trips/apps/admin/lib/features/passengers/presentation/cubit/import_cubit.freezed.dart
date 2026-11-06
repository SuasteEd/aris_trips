// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'import_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ImportState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ImportState()';
}


}

/// @nodoc
class $ImportStateCopyWith<$Res>  {
$ImportStateCopyWith(ImportState _, $Res Function(ImportState) __);
}


/// Adds pattern-matching-related methods to [ImportState].
extension ImportStatePatterns on ImportState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ImportIdle value)?  idle,TResult Function( ImportReading value)?  reading,TResult Function( ImportPreviewing value)?  preview,TResult Function( ImportDone value)?  done,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ImportIdle() when idle != null:
return idle(_that);case ImportReading() when reading != null:
return reading(_that);case ImportPreviewing() when preview != null:
return preview(_that);case ImportDone() when done != null:
return done(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ImportIdle value)  idle,required TResult Function( ImportReading value)  reading,required TResult Function( ImportPreviewing value)  preview,required TResult Function( ImportDone value)  done,}){
final _that = this;
switch (_that) {
case ImportIdle():
return idle(_that);case ImportReading():
return reading(_that);case ImportPreviewing():
return preview(_that);case ImportDone():
return done(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ImportIdle value)?  idle,TResult? Function( ImportReading value)?  reading,TResult? Function( ImportPreviewing value)?  preview,TResult? Function( ImportDone value)?  done,}){
final _that = this;
switch (_that) {
case ImportIdle() when idle != null:
return idle(_that);case ImportReading() when reading != null:
return reading(_that);case ImportPreviewing() when preview != null:
return preview(_that);case ImportDone() when done != null:
return done(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ImportFileError? fileError)?  idle,TResult Function()?  reading,TResult Function( ImportPreview preview,  bool importing,  Failure? failure)?  preview,TResult Function( ImportResult result)?  done,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ImportIdle() when idle != null:
return idle(_that.fileError);case ImportReading() when reading != null:
return reading();case ImportPreviewing() when preview != null:
return preview(_that.preview,_that.importing,_that.failure);case ImportDone() when done != null:
return done(_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ImportFileError? fileError)  idle,required TResult Function()  reading,required TResult Function( ImportPreview preview,  bool importing,  Failure? failure)  preview,required TResult Function( ImportResult result)  done,}) {final _that = this;
switch (_that) {
case ImportIdle():
return idle(_that.fileError);case ImportReading():
return reading();case ImportPreviewing():
return preview(_that.preview,_that.importing,_that.failure);case ImportDone():
return done(_that.result);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ImportFileError? fileError)?  idle,TResult? Function()?  reading,TResult? Function( ImportPreview preview,  bool importing,  Failure? failure)?  preview,TResult? Function( ImportResult result)?  done,}) {final _that = this;
switch (_that) {
case ImportIdle() when idle != null:
return idle(_that.fileError);case ImportReading() when reading != null:
return reading();case ImportPreviewing() when preview != null:
return preview(_that.preview,_that.importing,_that.failure);case ImportDone() when done != null:
return done(_that.result);case _:
  return null;

}
}

}

/// @nodoc


class ImportIdle implements ImportState {
  const ImportIdle({this.fileError});
  

 final  ImportFileError? fileError;

/// Create a copy of ImportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportIdleCopyWith<ImportIdle> get copyWith => _$ImportIdleCopyWithImpl<ImportIdle>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportIdle&&(identical(other.fileError, fileError) || other.fileError == fileError));
}


@override
int get hashCode {
    return Object.hash(runtimeType,fileError);
}

@override
String toString() {
    return 'ImportState.idle(fileError: $fileError)';
}


}

/// @nodoc
abstract mixin class $ImportIdleCopyWith<$Res> implements $ImportStateCopyWith<$Res> {
  factory $ImportIdleCopyWith(ImportIdle value, $Res Function(ImportIdle) _then) = _$ImportIdleCopyWithImpl;
@useResult
$Res call({
 ImportFileError? fileError
});




}
/// @nodoc
class _$ImportIdleCopyWithImpl<$Res>
    implements $ImportIdleCopyWith<$Res> {
  _$ImportIdleCopyWithImpl(this._self, this._then);

  final ImportIdle _self;
  final $Res Function(ImportIdle) _then;

/// Create a copy of ImportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fileError = freezed,}) {
  return _then(ImportIdle(
fileError: freezed == fileError ? _self.fileError : fileError // ignore: cast_nullable_to_non_nullable
as ImportFileError?,
  ));
}


}

/// @nodoc


class ImportReading implements ImportState {
  const ImportReading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportReading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ImportState.reading()';
}


}




/// @nodoc


class ImportPreviewing implements ImportState {
  const ImportPreviewing(this.preview, {this.importing = false, this.failure});
  

 final  ImportPreview preview;
@JsonKey() final  bool importing;
 final  Failure? failure;

/// Create a copy of ImportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportPreviewingCopyWith<ImportPreviewing> get copyWith => _$ImportPreviewingCopyWithImpl<ImportPreviewing>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportPreviewing&&(identical(other.preview, preview) || other.preview == preview)&&(identical(other.importing, importing) || other.importing == importing)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,preview,importing,failure);
}

@override
String toString() {
    return 'ImportState.preview(preview: $preview, importing: $importing, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ImportPreviewingCopyWith<$Res> implements $ImportStateCopyWith<$Res> {
  factory $ImportPreviewingCopyWith(ImportPreviewing value, $Res Function(ImportPreviewing) _then) = _$ImportPreviewingCopyWithImpl;
@useResult
$Res call({
 ImportPreview preview, bool importing, Failure? failure
});


$ImportPreviewCopyWith<$Res> get preview;$FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class _$ImportPreviewingCopyWithImpl<$Res>
    implements $ImportPreviewingCopyWith<$Res> {
  _$ImportPreviewingCopyWithImpl(this._self, this._then);

  final ImportPreviewing _self;
  final $Res Function(ImportPreviewing) _then;

/// Create a copy of ImportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? preview = null,Object? importing = null,Object? failure = freezed,}) {
  return _then(ImportPreviewing(
null == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as ImportPreview,importing: null == importing ? _self.importing : importing // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of ImportState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportPreviewCopyWith<$Res> get preview {
  
  return $ImportPreviewCopyWith<$Res>(_self.preview, (value) {
    return _then(_self.copyWith(preview: value));
  });
}/// Create a copy of ImportState
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


class ImportDone implements ImportState {
  const ImportDone(this.result);
  

 final  ImportResult result;

/// Create a copy of ImportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportDoneCopyWith<ImportDone> get copyWith => _$ImportDoneCopyWithImpl<ImportDone>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportDone&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode {
    return Object.hash(runtimeType,result);
}

@override
String toString() {
    return 'ImportState.done(result: $result)';
}


}

/// @nodoc
abstract mixin class $ImportDoneCopyWith<$Res> implements $ImportStateCopyWith<$Res> {
  factory $ImportDoneCopyWith(ImportDone value, $Res Function(ImportDone) _then) = _$ImportDoneCopyWithImpl;
@useResult
$Res call({
 ImportResult result
});


$ImportResultCopyWith<$Res> get result;

}
/// @nodoc
class _$ImportDoneCopyWithImpl<$Res>
    implements $ImportDoneCopyWith<$Res> {
  _$ImportDoneCopyWithImpl(this._self, this._then);

  final ImportDone _self;
  final $Res Function(ImportDone) _then;

/// Create a copy of ImportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? result = null,}) {
  return _then(ImportDone(
null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as ImportResult,
  ));
}

/// Create a copy of ImportState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImportResultCopyWith<$Res> get result {
  
  return $ImportResultCopyWith<$Res>(_self.result, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

// dart format on
