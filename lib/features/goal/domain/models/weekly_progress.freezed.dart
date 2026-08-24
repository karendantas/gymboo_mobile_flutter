// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeeklyProgress {

 Map<Weekday, bool> get completedByDay;
/// Create a copy of WeeklyProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeeklyProgressCopyWith<WeeklyProgress> get copyWith => _$WeeklyProgressCopyWithImpl<WeeklyProgress>(this as WeeklyProgress, _$identity);

  /// Serializes this WeeklyProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeeklyProgress&&const DeepCollectionEquality().equals(other.completedByDay, completedByDay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(completedByDay));

@override
String toString() {
  return 'WeeklyProgress(completedByDay: $completedByDay)';
}


}

/// @nodoc
abstract mixin class $WeeklyProgressCopyWith<$Res>  {
  factory $WeeklyProgressCopyWith(WeeklyProgress value, $Res Function(WeeklyProgress) _then) = _$WeeklyProgressCopyWithImpl;
@useResult
$Res call({
 Map<Weekday, bool> completedByDay
});




}
/// @nodoc
class _$WeeklyProgressCopyWithImpl<$Res>
    implements $WeeklyProgressCopyWith<$Res> {
  _$WeeklyProgressCopyWithImpl(this._self, this._then);

  final WeeklyProgress _self;
  final $Res Function(WeeklyProgress) _then;

/// Create a copy of WeeklyProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? completedByDay = null,}) {
  return _then(_self.copyWith(
completedByDay: null == completedByDay ? _self.completedByDay : completedByDay // ignore: cast_nullable_to_non_nullable
as Map<Weekday, bool>,
  ));
}

}


/// Adds pattern-matching-related methods to [WeeklyProgress].
extension WeeklyProgressPatterns on WeeklyProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeeklyProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeeklyProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeeklyProgress value)  $default,){
final _that = this;
switch (_that) {
case _WeeklyProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeeklyProgress value)?  $default,){
final _that = this;
switch (_that) {
case _WeeklyProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<Weekday, bool> completedByDay)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeeklyProgress() when $default != null:
return $default(_that.completedByDay);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<Weekday, bool> completedByDay)  $default,) {final _that = this;
switch (_that) {
case _WeeklyProgress():
return $default(_that.completedByDay);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<Weekday, bool> completedByDay)?  $default,) {final _that = this;
switch (_that) {
case _WeeklyProgress() when $default != null:
return $default(_that.completedByDay);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeeklyProgress extends WeeklyProgress {
  const _WeeklyProgress({required final  Map<Weekday, bool> completedByDay}): _completedByDay = completedByDay,super._();
  factory _WeeklyProgress.fromJson(Map<String, dynamic> json) => _$WeeklyProgressFromJson(json);

 final  Map<Weekday, bool> _completedByDay;
@override Map<Weekday, bool> get completedByDay {
  if (_completedByDay is EqualUnmodifiableMapView) return _completedByDay;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_completedByDay);
}


/// Create a copy of WeeklyProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeeklyProgressCopyWith<_WeeklyProgress> get copyWith => __$WeeklyProgressCopyWithImpl<_WeeklyProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeeklyProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeeklyProgress&&const DeepCollectionEquality().equals(other._completedByDay, _completedByDay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_completedByDay));

@override
String toString() {
  return 'WeeklyProgress(completedByDay: $completedByDay)';
}


}

/// @nodoc
abstract mixin class _$WeeklyProgressCopyWith<$Res> implements $WeeklyProgressCopyWith<$Res> {
  factory _$WeeklyProgressCopyWith(_WeeklyProgress value, $Res Function(_WeeklyProgress) _then) = __$WeeklyProgressCopyWithImpl;
@override @useResult
$Res call({
 Map<Weekday, bool> completedByDay
});




}
/// @nodoc
class __$WeeklyProgressCopyWithImpl<$Res>
    implements _$WeeklyProgressCopyWith<$Res> {
  __$WeeklyProgressCopyWithImpl(this._self, this._then);

  final _WeeklyProgress _self;
  final $Res Function(_WeeklyProgress) _then;

/// Create a copy of WeeklyProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? completedByDay = null,}) {
  return _then(_WeeklyProgress(
completedByDay: null == completedByDay ? _self._completedByDay : completedByDay // ignore: cast_nullable_to_non_nullable
as Map<Weekday, bool>,
  ));
}


}

// dart format on
