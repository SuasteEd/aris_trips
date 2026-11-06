// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'items_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ItemsState<T> {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemsState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ItemsState<$T>()';
}


}

/// @nodoc
class $ItemsStateCopyWith<T,$Res>  {
$ItemsStateCopyWith(ItemsState<T> _, $Res Function(ItemsState<T>) __);
}


/// Adds pattern-matching-related methods to [ItemsState].
extension ItemsStatePatterns<T> on ItemsState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ItemsLoading<T> value)?  loading,TResult Function( ItemsLoaded<T> value)?  loaded,TResult Function( ItemsFailure<T> value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ItemsLoading() when loading != null:
return loading(_that);case ItemsLoaded() when loaded != null:
return loaded(_that);case ItemsFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ItemsLoading<T> value)  loading,required TResult Function( ItemsLoaded<T> value)  loaded,required TResult Function( ItemsFailure<T> value)  failure,}){
final _that = this;
switch (_that) {
case ItemsLoading():
return loading(_that);case ItemsLoaded():
return loaded(_that);case ItemsFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ItemsLoading<T> value)?  loading,TResult? Function( ItemsLoaded<T> value)?  loaded,TResult? Function( ItemsFailure<T> value)?  failure,}){
final _that = this;
switch (_that) {
case ItemsLoading() when loading != null:
return loading(_that);case ItemsLoaded() when loaded != null:
return loaded(_that);case ItemsFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<T> items,  bool busy,  Failure? actionFailure)?  loaded,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ItemsLoading() when loading != null:
return loading();case ItemsLoaded() when loaded != null:
return loaded(_that.items,_that.busy,_that.actionFailure);case ItemsFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<T> items,  bool busy,  Failure? actionFailure)  loaded,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case ItemsLoading():
return loading();case ItemsLoaded():
return loaded(_that.items,_that.busy,_that.actionFailure);case ItemsFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<T> items,  bool busy,  Failure? actionFailure)?  loaded,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case ItemsLoading() when loading != null:
return loading();case ItemsLoaded() when loaded != null:
return loaded(_that.items,_that.busy,_that.actionFailure);case ItemsFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class ItemsLoading<T> implements ItemsState<T> {
  const ItemsLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemsLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ItemsState<$T>.loading()';
}


}




/// @nodoc


class ItemsLoaded<T> implements ItemsState<T> {
  const ItemsLoaded({required  List<T> items, this.busy = false, this.actionFailure}): _items = items;
  

 final  List<T> _items;
 List<T> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@JsonKey() final  bool busy;
 final  Failure? actionFailure;

/// Create a copy of ItemsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemsLoadedCopyWith<T, ItemsLoaded<T>> get copyWith => _$ItemsLoadedCopyWithImpl<T, ItemsLoaded<T>>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemsLoaded<T>&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.busy, busy) || other.busy == busy)&&(identical(other.actionFailure, actionFailure) || other.actionFailure == actionFailure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),busy,actionFailure);
}

@override
String toString() {
    return 'ItemsState<$T>.loaded(items: $items, busy: $busy, actionFailure: $actionFailure)';
}


}

/// @nodoc
abstract mixin class $ItemsLoadedCopyWith<T,$Res> implements $ItemsStateCopyWith<T, $Res> {
  factory $ItemsLoadedCopyWith(ItemsLoaded<T> value, $Res Function(ItemsLoaded<T>) _then) = _$ItemsLoadedCopyWithImpl;
@useResult
$Res call({
 List<T> items, bool busy, Failure? actionFailure
});


$FailureCopyWith<$Res>? get actionFailure;

}
/// @nodoc
class _$ItemsLoadedCopyWithImpl<T,$Res>
    implements $ItemsLoadedCopyWith<T, $Res> {
  _$ItemsLoadedCopyWithImpl(this._self, this._then);

  final ItemsLoaded<T> _self;
  final $Res Function(ItemsLoaded<T>) _then;

/// Create a copy of ItemsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,Object? busy = null,Object? actionFailure = freezed,}) {
  return _then(ItemsLoaded<T>(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<T>,busy: null == busy ? _self.busy : busy // ignore: cast_nullable_to_non_nullable
as bool,actionFailure: freezed == actionFailure ? _self.actionFailure : actionFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of ItemsState
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


class ItemsFailure<T> implements ItemsState<T> {
  const ItemsFailure(this.failure);
  

 final  Failure failure;

/// Create a copy of ItemsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemsFailureCopyWith<T, ItemsFailure<T>> get copyWith => _$ItemsFailureCopyWithImpl<T, ItemsFailure<T>>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemsFailure<T>&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,failure);
}

@override
String toString() {
    return 'ItemsState<$T>.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ItemsFailureCopyWith<T,$Res> implements $ItemsStateCopyWith<T, $Res> {
  factory $ItemsFailureCopyWith(ItemsFailure<T> value, $Res Function(ItemsFailure<T>) _then) = _$ItemsFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$ItemsFailureCopyWithImpl<T,$Res>
    implements $ItemsFailureCopyWith<T, $Res> {
  _$ItemsFailureCopyWithImpl(this._self, this._then);

  final ItemsFailure<T> _self;
  final $Res Function(ItemsFailure<T>) _then;

/// Create a copy of ItemsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ItemsFailure<T>(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of ItemsState
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
