// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SplashState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState()';
}


}

/// @nodoc
class $SplashStateCopyWith<$Res>  {
$SplashStateCopyWith(SplashState _, $Res Function(SplashState) __);
}


/// Adds pattern-matching-related methods to [SplashState].
extension SplashStatePatterns on SplashState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Loading value)?  loading,TResult Function( _Onbording value)?  onbording,TResult Function( _Language value)?  language,TResult Function( _Auth value)?  auth,TResult Function( _Main value)?  main,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Onbording() when onbording != null:
return onbording(_that);case _Language() when language != null:
return language(_that);case _Auth() when auth != null:
return auth(_that);case _Main() when main != null:
return main(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Loading value)  loading,required TResult Function( _Onbording value)  onbording,required TResult Function( _Language value)  language,required TResult Function( _Auth value)  auth,required TResult Function( _Main value)  main,}){
final _that = this;
switch (_that) {
case _Loading():
return loading(_that);case _Onbording():
return onbording(_that);case _Language():
return language(_that);case _Auth():
return auth(_that);case _Main():
return main(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Loading value)?  loading,TResult? Function( _Onbording value)?  onbording,TResult? Function( _Language value)?  language,TResult? Function( _Auth value)?  auth,TResult? Function( _Main value)?  main,}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Onbording() when onbording != null:
return onbording(_that);case _Language() when language != null:
return language(_that);case _Auth() when auth != null:
return auth(_that);case _Main() when main != null:
return main(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function()?  onbording,TResult Function()?  language,TResult Function()?  auth,TResult Function()?  main,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Onbording() when onbording != null:
return onbording();case _Language() when language != null:
return language();case _Auth() when auth != null:
return auth();case _Main() when main != null:
return main();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function()  onbording,required TResult Function()  language,required TResult Function()  auth,required TResult Function()  main,}) {final _that = this;
switch (_that) {
case _Loading():
return loading();case _Onbording():
return onbording();case _Language():
return language();case _Auth():
return auth();case _Main():
return main();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function()?  onbording,TResult? Function()?  language,TResult? Function()?  auth,TResult? Function()?  main,}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Onbording() when onbording != null:
return onbording();case _Language() when language != null:
return language();case _Auth() when auth != null:
return auth();case _Main() when main != null:
return main();case _:
  return null;

}
}

}

/// @nodoc


class _Loading implements SplashState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.loading()';
}


}




/// @nodoc


class _Onbording implements SplashState {
  const _Onbording();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Onbording);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.onbording()';
}


}




/// @nodoc


class _Language implements SplashState {
  const _Language();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Language);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.language()';
}


}




/// @nodoc


class _Auth implements SplashState {
  const _Auth();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Auth);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.auth()';
}


}




/// @nodoc


class _Main implements SplashState {
  const _Main();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Main);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.main()';
}


}




// dart format on
