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

 String get weekStart; String get weekEnd; List<Weekday> get plannedDays; List<Weekday> get completedDays; int get plannedDaysTotal; int get plannedDaysCompleted; int get totalActivities; int get totalMinutes; double get completionRate; List<WeeklyDayDetail> get days;
/// Create a copy of WeeklyProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeeklyProgressCopyWith<WeeklyProgress> get copyWith => _$WeeklyProgressCopyWithImpl<WeeklyProgress>(this as WeeklyProgress, _$identity);

  /// Serializes this WeeklyProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeeklyProgress&&(identical(other.weekStart, weekStart) || other.weekStart == weekStart)&&(identical(other.weekEnd, weekEnd) || other.weekEnd == weekEnd)&&const DeepCollectionEquality().equals(other.plannedDays, plannedDays)&&const DeepCollectionEquality().equals(other.completedDays, completedDays)&&(identical(other.plannedDaysTotal, plannedDaysTotal) || other.plannedDaysTotal == plannedDaysTotal)&&(identical(other.plannedDaysCompleted, plannedDaysCompleted) || other.plannedDaysCompleted == plannedDaysCompleted)&&(identical(other.totalActivities, totalActivities) || other.totalActivities == totalActivities)&&(identical(other.totalMinutes, totalMinutes) || other.totalMinutes == totalMinutes)&&(identical(other.completionRate, completionRate) || other.completionRate == completionRate)&&const DeepCollectionEquality().equals(other.days, days));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weekStart,weekEnd,const DeepCollectionEquality().hash(plannedDays),const DeepCollectionEquality().hash(completedDays),plannedDaysTotal,plannedDaysCompleted,totalActivities,totalMinutes,completionRate,const DeepCollectionEquality().hash(days));

@override
String toString() {
  return 'WeeklyProgress(weekStart: $weekStart, weekEnd: $weekEnd, plannedDays: $plannedDays, completedDays: $completedDays, plannedDaysTotal: $plannedDaysTotal, plannedDaysCompleted: $plannedDaysCompleted, totalActivities: $totalActivities, totalMinutes: $totalMinutes, completionRate: $completionRate, days: $days)';
}


}

/// @nodoc
abstract mixin class $WeeklyProgressCopyWith<$Res>  {
  factory $WeeklyProgressCopyWith(WeeklyProgress value, $Res Function(WeeklyProgress) _then) = _$WeeklyProgressCopyWithImpl;
@useResult
$Res call({
 String weekStart, String weekEnd, List<Weekday> plannedDays, List<Weekday> completedDays, int plannedDaysTotal, int plannedDaysCompleted, int totalActivities, int totalMinutes, double completionRate, List<WeeklyDayDetail> days
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
@pragma('vm:prefer-inline') @override $Res call({Object? weekStart = null,Object? weekEnd = null,Object? plannedDays = null,Object? completedDays = null,Object? plannedDaysTotal = null,Object? plannedDaysCompleted = null,Object? totalActivities = null,Object? totalMinutes = null,Object? completionRate = null,Object? days = null,}) {
  return _then(_self.copyWith(
weekStart: null == weekStart ? _self.weekStart : weekStart // ignore: cast_nullable_to_non_nullable
as String,weekEnd: null == weekEnd ? _self.weekEnd : weekEnd // ignore: cast_nullable_to_non_nullable
as String,plannedDays: null == plannedDays ? _self.plannedDays : plannedDays // ignore: cast_nullable_to_non_nullable
as List<Weekday>,completedDays: null == completedDays ? _self.completedDays : completedDays // ignore: cast_nullable_to_non_nullable
as List<Weekday>,plannedDaysTotal: null == plannedDaysTotal ? _self.plannedDaysTotal : plannedDaysTotal // ignore: cast_nullable_to_non_nullable
as int,plannedDaysCompleted: null == plannedDaysCompleted ? _self.plannedDaysCompleted : plannedDaysCompleted // ignore: cast_nullable_to_non_nullable
as int,totalActivities: null == totalActivities ? _self.totalActivities : totalActivities // ignore: cast_nullable_to_non_nullable
as int,totalMinutes: null == totalMinutes ? _self.totalMinutes : totalMinutes // ignore: cast_nullable_to_non_nullable
as int,completionRate: null == completionRate ? _self.completionRate : completionRate // ignore: cast_nullable_to_non_nullable
as double,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as List<WeeklyDayDetail>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String weekStart,  String weekEnd,  List<Weekday> plannedDays,  List<Weekday> completedDays,  int plannedDaysTotal,  int plannedDaysCompleted,  int totalActivities,  int totalMinutes,  double completionRate,  List<WeeklyDayDetail> days)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeeklyProgress() when $default != null:
return $default(_that.weekStart,_that.weekEnd,_that.plannedDays,_that.completedDays,_that.plannedDaysTotal,_that.plannedDaysCompleted,_that.totalActivities,_that.totalMinutes,_that.completionRate,_that.days);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String weekStart,  String weekEnd,  List<Weekday> plannedDays,  List<Weekday> completedDays,  int plannedDaysTotal,  int plannedDaysCompleted,  int totalActivities,  int totalMinutes,  double completionRate,  List<WeeklyDayDetail> days)  $default,) {final _that = this;
switch (_that) {
case _WeeklyProgress():
return $default(_that.weekStart,_that.weekEnd,_that.plannedDays,_that.completedDays,_that.plannedDaysTotal,_that.plannedDaysCompleted,_that.totalActivities,_that.totalMinutes,_that.completionRate,_that.days);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String weekStart,  String weekEnd,  List<Weekday> plannedDays,  List<Weekday> completedDays,  int plannedDaysTotal,  int plannedDaysCompleted,  int totalActivities,  int totalMinutes,  double completionRate,  List<WeeklyDayDetail> days)?  $default,) {final _that = this;
switch (_that) {
case _WeeklyProgress() when $default != null:
return $default(_that.weekStart,_that.weekEnd,_that.plannedDays,_that.completedDays,_that.plannedDaysTotal,_that.plannedDaysCompleted,_that.totalActivities,_that.totalMinutes,_that.completionRate,_that.days);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeeklyProgress implements WeeklyProgress {
  const _WeeklyProgress({required this.weekStart, required this.weekEnd, required final  List<Weekday> plannedDays, required final  List<Weekday> completedDays, required this.plannedDaysTotal, required this.plannedDaysCompleted, required this.totalActivities, required this.totalMinutes, required this.completionRate, required final  List<WeeklyDayDetail> days}): _plannedDays = plannedDays,_completedDays = completedDays,_days = days;
  factory _WeeklyProgress.fromJson(Map<String, dynamic> json) => _$WeeklyProgressFromJson(json);

@override final  String weekStart;
@override final  String weekEnd;
 final  List<Weekday> _plannedDays;
@override List<Weekday> get plannedDays {
  if (_plannedDays is EqualUnmodifiableListView) return _plannedDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_plannedDays);
}

 final  List<Weekday> _completedDays;
@override List<Weekday> get completedDays {
  if (_completedDays is EqualUnmodifiableListView) return _completedDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_completedDays);
}

@override final  int plannedDaysTotal;
@override final  int plannedDaysCompleted;
@override final  int totalActivities;
@override final  int totalMinutes;
@override final  double completionRate;
 final  List<WeeklyDayDetail> _days;
@override List<WeeklyDayDetail> get days {
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_days);
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeeklyProgress&&(identical(other.weekStart, weekStart) || other.weekStart == weekStart)&&(identical(other.weekEnd, weekEnd) || other.weekEnd == weekEnd)&&const DeepCollectionEquality().equals(other._plannedDays, _plannedDays)&&const DeepCollectionEquality().equals(other._completedDays, _completedDays)&&(identical(other.plannedDaysTotal, plannedDaysTotal) || other.plannedDaysTotal == plannedDaysTotal)&&(identical(other.plannedDaysCompleted, plannedDaysCompleted) || other.plannedDaysCompleted == plannedDaysCompleted)&&(identical(other.totalActivities, totalActivities) || other.totalActivities == totalActivities)&&(identical(other.totalMinutes, totalMinutes) || other.totalMinutes == totalMinutes)&&(identical(other.completionRate, completionRate) || other.completionRate == completionRate)&&const DeepCollectionEquality().equals(other._days, _days));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weekStart,weekEnd,const DeepCollectionEquality().hash(_plannedDays),const DeepCollectionEquality().hash(_completedDays),plannedDaysTotal,plannedDaysCompleted,totalActivities,totalMinutes,completionRate,const DeepCollectionEquality().hash(_days));

@override
String toString() {
  return 'WeeklyProgress(weekStart: $weekStart, weekEnd: $weekEnd, plannedDays: $plannedDays, completedDays: $completedDays, plannedDaysTotal: $plannedDaysTotal, plannedDaysCompleted: $plannedDaysCompleted, totalActivities: $totalActivities, totalMinutes: $totalMinutes, completionRate: $completionRate, days: $days)';
}


}

/// @nodoc
abstract mixin class _$WeeklyProgressCopyWith<$Res> implements $WeeklyProgressCopyWith<$Res> {
  factory _$WeeklyProgressCopyWith(_WeeklyProgress value, $Res Function(_WeeklyProgress) _then) = __$WeeklyProgressCopyWithImpl;
@override @useResult
$Res call({
 String weekStart, String weekEnd, List<Weekday> plannedDays, List<Weekday> completedDays, int plannedDaysTotal, int plannedDaysCompleted, int totalActivities, int totalMinutes, double completionRate, List<WeeklyDayDetail> days
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
@override @pragma('vm:prefer-inline') $Res call({Object? weekStart = null,Object? weekEnd = null,Object? plannedDays = null,Object? completedDays = null,Object? plannedDaysTotal = null,Object? plannedDaysCompleted = null,Object? totalActivities = null,Object? totalMinutes = null,Object? completionRate = null,Object? days = null,}) {
  return _then(_WeeklyProgress(
weekStart: null == weekStart ? _self.weekStart : weekStart // ignore: cast_nullable_to_non_nullable
as String,weekEnd: null == weekEnd ? _self.weekEnd : weekEnd // ignore: cast_nullable_to_non_nullable
as String,plannedDays: null == plannedDays ? _self._plannedDays : plannedDays // ignore: cast_nullable_to_non_nullable
as List<Weekday>,completedDays: null == completedDays ? _self._completedDays : completedDays // ignore: cast_nullable_to_non_nullable
as List<Weekday>,plannedDaysTotal: null == plannedDaysTotal ? _self.plannedDaysTotal : plannedDaysTotal // ignore: cast_nullable_to_non_nullable
as int,plannedDaysCompleted: null == plannedDaysCompleted ? _self.plannedDaysCompleted : plannedDaysCompleted // ignore: cast_nullable_to_non_nullable
as int,totalActivities: null == totalActivities ? _self.totalActivities : totalActivities // ignore: cast_nullable_to_non_nullable
as int,totalMinutes: null == totalMinutes ? _self.totalMinutes : totalMinutes // ignore: cast_nullable_to_non_nullable
as int,completionRate: null == completionRate ? _self.completionRate : completionRate // ignore: cast_nullable_to_non_nullable
as double,days: null == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<WeeklyDayDetail>,
  ));
}


}

// dart format on
