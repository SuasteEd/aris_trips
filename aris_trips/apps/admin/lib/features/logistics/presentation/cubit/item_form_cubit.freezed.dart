// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ItemFormState<T,I> {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemFormState<T, I>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ItemFormState<$T, $I>()';
}


}

/// @nodoc
class $ItemFormStateCopyWith<T,I,$Res>  {
$ItemFormStateCopyWith(ItemFormState<T, I> _, $Res Function(ItemFormState<T, I>) __);
}


/// Adds pattern-matching-related methods to [ItemFormState].
extension ItemFormStatePatterns<T,I> on ItemFormState<T, I> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ItemFormEditing<T, I> value)?  editing,TResult Function( ItemFormSaved<T, I> value)?  saved,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ItemFormEditing() when editing != null:
return editing(_that);case ItemFormSaved() when saved != null:
return saved(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ItemFormEditing<T, I> value)  editing,required TResult Function( ItemFormSaved<T, I> value)  saved,}){
final _that = this;
switch (_that) {
case ItemFormEditing():
return editing(_that);case ItemFormSaved():
return saved(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ItemFormEditing<T, I> value)?  editing,TResult? Function( ItemFormSaved<T, I> value)?  saved,}){
final _that = this;
switch (_that) {
case ItemFormEditing() when editing != null:
return editing(_that);case ItemFormSaved() when saved != null:
return saved(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool submitting,  Set<I> issues,  Failure? failure)?  editing,TResult Function( T item)?  saved,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ItemFormEditing() when editing != null:
return editing(_that.submitting,_that.issues,_that.failure);case ItemFormSaved() when saved != null:
return saved(_that.item);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool submitting,  Set<I> issues,  Failure? failure)  editing,required TResult Function( T item)  saved,}) {final _that = this;
switch (_that) {
case ItemFormEditing():
return editing(_that.submitting,_that.issues,_that.failure);case ItemFormSaved():
return saved(_that.item);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool submitting,  Set<I> issues,  Failure? failure)?  editing,TResult? Function( T item)?  saved,}) {final _that = this;
switch (_that) {
case ItemFormEditing() when editing != null:
return editing(_that.submitting,_that.issues,_that.failure);case ItemFormSaved() when saved != null:
return saved(_that.item);case _:
  return null;

}
}

}

/// @nodoc


class ItemFormEditing<T,I> implements ItemFormState<T, I> {
  const ItemFormEditing({this.submitting = false,  Set<I> issues = const {}, this.failure}): _issues = issues;
  

@JsonKey() final  bool submitting;
 final  Set<I> _issues;
@JsonKey() Set<I> get issues {
  if (_issues is EqualUnmodifiableSetView) return _issues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_issues);
}

 final  Failure? failure;

/// Create a copy of ItemFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemFormEditingCopyWith<T, I, ItemFormEditing<T, I>> get copyWith => _$ItemFormEditingCopyWithImpl<T, I, ItemFormEditing<T, I>>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemFormEditing<T, I>&&(identical(other.submitting, submitting) || other.submitting == submitting)&&const DeepCollectionEquality().equals(other.issues, _issues)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,submitting,const DeepCollectionEquality().hash(_issues),failure);
}

@override
String toString() {
    return 'ItemFormState<$T, $I>.editing(submitting: $submitting, issues: $issues, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ItemFormEditingCopyWith<T,I,$Res> implements $ItemFormStateCopyWith<T, I, $Res> {
  factory $ItemFormEditingCopyWith(ItemFormEditing<T, I> value, $Res Function(ItemFormEditing<T, I>) _then) = _$ItemFormEditingCopyWithImpl;
@useResult
$Res call({
 bool submitting, Set<I> issues, Failure? failure
});


$FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class _$ItemFormEditingCopyWithImpl<T,I,$Res>
    implements $ItemFormEditingCopyWith<T, I, $Res> {
  _$ItemFormEditingCopyWithImpl(this._self, this._then);

  final ItemFormEditing<T, I> _self;
  final $Res Function(ItemFormEditing<T, I>) _then;

/// Create a copy of ItemFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? submitting = null,Object? issues = null,Object? failure = freezed,}) {
  return _then(ItemFormEditing<T, I>(
submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,issues: null == issues ? _self._issues : issues // ignore: cast_nullable_to_non_nullable
as Set<I>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of ItemFormState
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


class ItemFormSaved<T,I> implements ItemFormState<T, I> {
  const ItemFormSaved(this.item);
  

 final  T item;

/// Create a copy of ItemFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemFormSavedCopyWith<T, I, ItemFormSaved<T, I>> get copyWith => _$ItemFormSavedCopyWithImpl<T, I, ItemFormSaved<T, I>>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemFormSaved<T, I>&&const DeepCollectionEquality().equals(other.item, item));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(item));
}

@override
String toString() {
    return 'ItemFormState<$T, $I>.saved(item: $item)';
}


}

/// @nodoc
abstract mixin class $ItemFormSavedCopyWith<T,I,$Res> implements $ItemFormStateCopyWith<T, I, $Res> {
  factory $ItemFormSavedCopyWith(ItemFormSaved<T, I> value, $Res Function(ItemFormSaved<T, I>) _then) = _$ItemFormSavedCopyWithImpl;
@useResult
$Res call({
 T item
});




}
/// @nodoc
class _$ItemFormSavedCopyWithImpl<T,I,$Res>
    implements $ItemFormSavedCopyWith<T, I, $Res> {
  _$ItemFormSavedCopyWithImpl(this._self, this._then);

  final ItemFormSaved<T, I> _self;
  final $Res Function(ItemFormSaved<T, I>) _then;

/// Create a copy of ItemFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = freezed,}) {
  return _then(ItemFormSaved<T, I>(
freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

// dart format on
