// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'passenger_import.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ImportRow {

/// Line in the file (header is line 1).
 int get line; PassengerDraft get draft; Set<ImportIssue> get issues;
/// Create a copy of ImportRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportRowCopyWith<ImportRow> get copyWith => _$ImportRowCopyWithImpl<ImportRow>(this as ImportRow, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ImportRow;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportRow&&(identical(other.line, _this.line) || other.line == _this.line)&&(identical(other.draft, _this.draft) || other.draft == _this.draft)&&const DeepCollectionEquality().equals(other.issues, _this.issues));
}


@override
int get hashCode {
  final _this = this as ImportRow;
  return Object.hash(runtimeType,_this.line,_this.draft,const DeepCollectionEquality().hash(_this.issues));
}

@override
String toString() {
  final _this = this as ImportRow;
  return 'ImportRow(line: ${_this.line}, draft: ${_this.draft}, issues: ${_this.issues})';
}


}

/// @nodoc
abstract mixin class $ImportRowCopyWith<$Res>  {
  factory $ImportRowCopyWith(ImportRow value, $Res Function(ImportRow) _then) = _$ImportRowCopyWithImpl;
@useResult
$Res call({
 int line, PassengerDraft draft, Set<ImportIssue> issues
});


$PassengerDraftCopyWith<$Res> get draft;

}
/// @nodoc
class _$ImportRowCopyWithImpl<$Res>
    implements $ImportRowCopyWith<$Res> {
  _$ImportRowCopyWithImpl(this._self, this._then);

  final ImportRow _self;
  final $Res Function(ImportRow) _then;

/// Create a copy of ImportRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? line = null,Object? draft = null,Object? issues = null,}) {
  return _then(ImportRow(
line: null == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as int,draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as PassengerDraft,issues: null == issues ? _self.issues : issues // ignore: cast_nullable_to_non_nullable
as Set<ImportIssue>,
  ));
}
/// Create a copy of ImportRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PassengerDraftCopyWith<$Res> get draft {
  
  return $PassengerDraftCopyWith<$Res>(_self.draft, (value) {
    return _then(_self.copyWith(draft: value));
  });
}
}


/// Adds pattern-matching-related methods to [ImportRow].
extension ImportRowPatterns on ImportRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImportRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImportRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImportRow value)  $default,){
final _that = this;
switch (_that) {
case _ImportRow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImportRow value)?  $default,){
final _that = this;
switch (_that) {
case _ImportRow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int line,  PassengerDraft draft,  Set<ImportIssue> issues)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImportRow() when $default != null:
return $default(_that.line,_that.draft,_that.issues);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int line,  PassengerDraft draft,  Set<ImportIssue> issues)  $default,) {final _that = this;
switch (_that) {
case _ImportRow():
return $default(_that.line,_that.draft,_that.issues);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int line,  PassengerDraft draft,  Set<ImportIssue> issues)?  $default,) {final _that = this;
switch (_that) {
case _ImportRow() when $default != null:
return $default(_that.line,_that.draft,_that.issues);case _:
  return null;

}
}

}

/// @nodoc


class _ImportRow extends ImportRow {
  const _ImportRow({required this.line, required this.draft,  Set<ImportIssue> issues = const {}}): _issues = issues,super._();
  

/// Line in the file (header is line 1).
@override final  int line;
@override final  PassengerDraft draft;
 final  Set<ImportIssue> _issues;
@override@JsonKey() Set<ImportIssue> get issues {
  if (_issues is EqualUnmodifiableSetView) return _issues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_issues);
}


/// Create a copy of ImportRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImportRowCopyWith<_ImportRow> get copyWith => __$ImportRowCopyWithImpl<_ImportRow>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportRow&&(identical(other.line, line) || other.line == line)&&(identical(other.draft, draft) || other.draft == draft)&&const DeepCollectionEquality().equals(other.issues, _issues));
}


@override
int get hashCode {
    return Object.hash(runtimeType,line,draft,const DeepCollectionEquality().hash(_issues));
}

@override
String toString() {
    return 'ImportRow(line: $line, draft: $draft, issues: $issues)';
}


}

/// @nodoc
abstract mixin class _$ImportRowCopyWith<$Res> implements $ImportRowCopyWith<$Res> {
  factory _$ImportRowCopyWith(_ImportRow value, $Res Function(_ImportRow) _then) = __$ImportRowCopyWithImpl;
@override @useResult
$Res call({
 int line, PassengerDraft draft, Set<ImportIssue> issues
});


@override $PassengerDraftCopyWith<$Res> get draft;

}
/// @nodoc
class __$ImportRowCopyWithImpl<$Res>
    implements _$ImportRowCopyWith<$Res> {
  __$ImportRowCopyWithImpl(this._self, this._then);

  final _ImportRow _self;
  final $Res Function(_ImportRow) _then;

/// Create a copy of ImportRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? line = null,Object? draft = null,Object? issues = null,}) {
  return _then(_ImportRow(
line: null == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as int,draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as PassengerDraft,issues: null == issues ? _self._issues : issues // ignore: cast_nullable_to_non_nullable
as Set<ImportIssue>,
  ));
}

/// Create a copy of ImportRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PassengerDraftCopyWith<$Res> get draft {
  
  return $PassengerDraftCopyWith<$Res>(_self.draft, (value) {
    return _then(_self.copyWith(draft: value));
  });
}
}

/// @nodoc
mixin _$ImportPreview {

 List<ImportRow> get rows;/// Required columns not found in the header.
 Set<ImportColumn> get missingColumns;
/// Create a copy of ImportPreview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportPreviewCopyWith<ImportPreview> get copyWith => _$ImportPreviewCopyWithImpl<ImportPreview>(this as ImportPreview, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ImportPreview;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportPreview&&const DeepCollectionEquality().equals(other.rows, _this.rows)&&const DeepCollectionEquality().equals(other.missingColumns, _this.missingColumns));
}


@override
int get hashCode {
  final _this = this as ImportPreview;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.rows),const DeepCollectionEquality().hash(_this.missingColumns));
}

@override
String toString() {
  final _this = this as ImportPreview;
  return 'ImportPreview(rows: ${_this.rows}, missingColumns: ${_this.missingColumns})';
}


}

/// @nodoc
abstract mixin class $ImportPreviewCopyWith<$Res>  {
  factory $ImportPreviewCopyWith(ImportPreview value, $Res Function(ImportPreview) _then) = _$ImportPreviewCopyWithImpl;
@useResult
$Res call({
 List<ImportRow> rows, Set<ImportColumn> missingColumns
});




}
/// @nodoc
class _$ImportPreviewCopyWithImpl<$Res>
    implements $ImportPreviewCopyWith<$Res> {
  _$ImportPreviewCopyWithImpl(this._self, this._then);

  final ImportPreview _self;
  final $Res Function(ImportPreview) _then;

/// Create a copy of ImportPreview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rows = null,Object? missingColumns = null,}) {
  return _then(ImportPreview(
rows: null == rows ? _self.rows : rows // ignore: cast_nullable_to_non_nullable
as List<ImportRow>,missingColumns: null == missingColumns ? _self.missingColumns : missingColumns // ignore: cast_nullable_to_non_nullable
as Set<ImportColumn>,
  ));
}

}


/// Adds pattern-matching-related methods to [ImportPreview].
extension ImportPreviewPatterns on ImportPreview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImportPreview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImportPreview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImportPreview value)  $default,){
final _that = this;
switch (_that) {
case _ImportPreview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImportPreview value)?  $default,){
final _that = this;
switch (_that) {
case _ImportPreview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ImportRow> rows,  Set<ImportColumn> missingColumns)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImportPreview() when $default != null:
return $default(_that.rows,_that.missingColumns);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ImportRow> rows,  Set<ImportColumn> missingColumns)  $default,) {final _that = this;
switch (_that) {
case _ImportPreview():
return $default(_that.rows,_that.missingColumns);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ImportRow> rows,  Set<ImportColumn> missingColumns)?  $default,) {final _that = this;
switch (_that) {
case _ImportPreview() when $default != null:
return $default(_that.rows,_that.missingColumns);case _:
  return null;

}
}

}

/// @nodoc


class _ImportPreview extends ImportPreview {
  const _ImportPreview({ List<ImportRow> rows = const [],  Set<ImportColumn> missingColumns = const {}}): _rows = rows,_missingColumns = missingColumns,super._();
  

 final  List<ImportRow> _rows;
@override@JsonKey() List<ImportRow> get rows {
  if (_rows is EqualUnmodifiableListView) return _rows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rows);
}

/// Required columns not found in the header.
 final  Set<ImportColumn> _missingColumns;
/// Required columns not found in the header.
@override@JsonKey() Set<ImportColumn> get missingColumns {
  if (_missingColumns is EqualUnmodifiableSetView) return _missingColumns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_missingColumns);
}


/// Create a copy of ImportPreview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImportPreviewCopyWith<_ImportPreview> get copyWith => __$ImportPreviewCopyWithImpl<_ImportPreview>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportPreview&&const DeepCollectionEquality().equals(other.rows, _rows)&&const DeepCollectionEquality().equals(other.missingColumns, _missingColumns));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_rows),const DeepCollectionEquality().hash(_missingColumns));
}

@override
String toString() {
    return 'ImportPreview(rows: $rows, missingColumns: $missingColumns)';
}


}

/// @nodoc
abstract mixin class _$ImportPreviewCopyWith<$Res> implements $ImportPreviewCopyWith<$Res> {
  factory _$ImportPreviewCopyWith(_ImportPreview value, $Res Function(_ImportPreview) _then) = __$ImportPreviewCopyWithImpl;
@override @useResult
$Res call({
 List<ImportRow> rows, Set<ImportColumn> missingColumns
});




}
/// @nodoc
class __$ImportPreviewCopyWithImpl<$Res>
    implements _$ImportPreviewCopyWith<$Res> {
  __$ImportPreviewCopyWithImpl(this._self, this._then);

  final _ImportPreview _self;
  final $Res Function(_ImportPreview) _then;

/// Create a copy of ImportPreview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rows = null,Object? missingColumns = null,}) {
  return _then(_ImportPreview(
rows: null == rows ? _self._rows : rows // ignore: cast_nullable_to_non_nullable
as List<ImportRow>,missingColumns: null == missingColumns ? _self._missingColumns : missingColumns // ignore: cast_nullable_to_non_nullable
as Set<ImportColumn>,
  ));
}


}

/// @nodoc
mixin _$ImportResult {

 int get created; int get reused;
/// Create a copy of ImportResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportResultCopyWith<ImportResult> get copyWith => _$ImportResultCopyWithImpl<ImportResult>(this as ImportResult, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ImportResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportResult&&(identical(other.created, _this.created) || other.created == _this.created)&&(identical(other.reused, _this.reused) || other.reused == _this.reused));
}


@override
int get hashCode {
  final _this = this as ImportResult;
  return Object.hash(runtimeType,_this.created,_this.reused);
}

@override
String toString() {
  final _this = this as ImportResult;
  return 'ImportResult(created: ${_this.created}, reused: ${_this.reused})';
}


}

/// @nodoc
abstract mixin class $ImportResultCopyWith<$Res>  {
  factory $ImportResultCopyWith(ImportResult value, $Res Function(ImportResult) _then) = _$ImportResultCopyWithImpl;
@useResult
$Res call({
 int created, int reused
});




}
/// @nodoc
class _$ImportResultCopyWithImpl<$Res>
    implements $ImportResultCopyWith<$Res> {
  _$ImportResultCopyWithImpl(this._self, this._then);

  final ImportResult _self;
  final $Res Function(ImportResult) _then;

/// Create a copy of ImportResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? created = null,Object? reused = null,}) {
  return _then(ImportResult(
created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as int,reused: null == reused ? _self.reused : reused // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ImportResult].
extension ImportResultPatterns on ImportResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImportResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImportResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImportResult value)  $default,){
final _that = this;
switch (_that) {
case _ImportResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImportResult value)?  $default,){
final _that = this;
switch (_that) {
case _ImportResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int created,  int reused)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImportResult() when $default != null:
return $default(_that.created,_that.reused);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int created,  int reused)  $default,) {final _that = this;
switch (_that) {
case _ImportResult():
return $default(_that.created,_that.reused);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int created,  int reused)?  $default,) {final _that = this;
switch (_that) {
case _ImportResult() when $default != null:
return $default(_that.created,_that.reused);case _:
  return null;

}
}

}

/// @nodoc


class _ImportResult extends ImportResult {
  const _ImportResult({required this.created, required this.reused}): super._();
  

@override final  int created;
@override final  int reused;

/// Create a copy of ImportResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImportResultCopyWith<_ImportResult> get copyWith => __$ImportResultCopyWithImpl<_ImportResult>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportResult&&(identical(other.created, created) || other.created == created)&&(identical(other.reused, reused) || other.reused == reused));
}


@override
int get hashCode {
    return Object.hash(runtimeType,created,reused);
}

@override
String toString() {
    return 'ImportResult(created: $created, reused: $reused)';
}


}

/// @nodoc
abstract mixin class _$ImportResultCopyWith<$Res> implements $ImportResultCopyWith<$Res> {
  factory _$ImportResultCopyWith(_ImportResult value, $Res Function(_ImportResult) _then) = __$ImportResultCopyWithImpl;
@override @useResult
$Res call({
 int created, int reused
});




}
/// @nodoc
class __$ImportResultCopyWithImpl<$Res>
    implements _$ImportResultCopyWith<$Res> {
  __$ImportResultCopyWithImpl(this._self, this._then);

  final _ImportResult _self;
  final $Res Function(_ImportResult) _then;

/// Create a copy of ImportResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? created = null,Object? reused = null,}) {
  return _then(_ImportResult(
created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as int,reused: null == reused ? _self.reused : reused // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
