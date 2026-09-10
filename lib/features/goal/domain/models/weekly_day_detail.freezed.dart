// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_day_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeeklyDayDetail {

 String get date; Weekday get dayOfWeek; bool get planned; bool get completed; int get activityCount; int get minutes;
/// Create a copy of WeeklyDayDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeeklyDayDetailCopyWith<WeeklyDayDetail> get copyWith => _$WeeklyDayDetailCopyWithImpl<WeeklyDayDetail>(this as WeeklyDayDetail, _$identity);

  /// Serializes this WeeklyDayDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeeklyDayDetail&&(identical(other.date, date) || other.date == date)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.planned, planned) || other.planned == planned)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.activityCount, activityCount) || other.activityCount == activityCount)&&(identical(other.minutes, minutes) || other.minutes == minutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,dayOfWeek,planned,completed,activityCount,minutes);

@override
String toString() {
  return 'WeeklyDayDetail(date: $date, dayOfWeek: $dayOfWeek, planned: $planned, completed: $completed, activityCount: $activityCount, minutes: $minutes)';
}


}

/// @nodoc
abstract mixin class $WeeklyDayDetailCopyWith<$Res>  {
  factory $WeeklyDayDetailCopyWith(WeeklyDayDetail value, $Res Function(WeeklyDayDetail) _then) = _$WeeklyDayDetailCopyWithImpl;
@useResult
$Res call({
 String date, Weekday dayOfWeek, bool planned, bool completed, int activityCount, int minutes
});




}
/// @nodoc
class _$WeeklyDayDetailCopyWithImpl<$Res>
    implements $WeeklyDayDetailCopyWith<$Res> {
  _$WeeklyDayDetailCopyWithImpl(this._self, this._then);

  final WeeklyDayDetail _self;
  final $Res Function(WeeklyDayDetail) _then;

/// Create a copy of WeeklyDayDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? dayOfWeek = null,Object? planned = null,Object? completed = null,Object? activityCount = null,Object? minutes = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as Weekday,planned: null == planned ? _self.planned : planned // ignore: cast_nullable_to_non_nullable
as bool,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,activityCount: null == activityCount ? _self.activityCount : activityCount // ignore: cast_nullable_to_non_nullable
as int,minutes: null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WeeklyDayDetail].
extension WeeklyDayDetailPatterns on WeeklyDayDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeeklyDayDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeeklyDayDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeeklyDayDetail value)  $default,){
final _that = this;
switch (_that) {
case _WeeklyDayDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeeklyDayDetail value)?  $default,){
final _that = this;
switch (_that) {
case _WeeklyDayDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  Weekday dayOfWeek,  bool planned,  bool completed,  int activityCount,  int minutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeeklyDayDetail() when $default != null:
return $default(_that.date,_that.dayOfWeek,_that.planned,_that.completed,_that.activityCount,_that.minutes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  Weekday dayOfWeek,  bool planned,  bool completed,  int activityCount,  int minutes)  $default,) {final _that = this;
switch (_that) {
case _WeeklyDayDetail():
return $default(_that.date,_that.dayOfWeek,_that.planned,_that.completed,_that.activityCount,_that.minutes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  Weekday dayOfWeek,  bool planned,  bool completed,  int activityCount,  int minutes)?  $default,) {final _that = this;
switch (_that) {
case _WeeklyDayDetail() when $default != null:
return $default(_that.date,_that.dayOfWeek,_that.planned,_that.completed,_that.activityCount,_that.minutes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeeklyDayDetail implements WeeklyDayDetail {
  const _WeeklyDayDetail({required this.date, required this.dayOfWeek, required this.planned, required this.completed, required this.activityCount, required this.minutes});
  factory _WeeklyDayDetail.fromJson(Map<String, dynamic> json) => _$WeeklyDayDetailFromJson(json);

@override final  String date;
@override final  Weekday dayOfWeek;
@override final  bool planned;
@override final  bool completed;
@override final  int activityCount;
@override final  int minutes;

/// Create a copy of WeeklyDayDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeeklyDayDetailCopyWith<_WeeklyDayDetail> get copyWith => __$WeeklyDayDetailCopyWithImpl<_WeeklyDayDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeeklyDayDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeeklyDayDetail&&(identical(other.date, date) || other.date == date)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.planned, planned) || other.planned == planned)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.activityCount, activityCount) || other.activityCount == activityCount)&&(identical(other.minutes, minutes) || other.minutes == minutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,dayOfWeek,planned,completed,activityCount,minutes);

@override
String toString() {
  return 'WeeklyDayDetail(date: $date, dayOfWeek: $dayOfWeek, planned: $planned, completed: $completed, activityCount: $activityCount, minutes: $minutes)';
}


}

/// @nodoc
abstract mixin class _$WeeklyDayDetailCopyWith<$Res> implements $WeeklyDayDetailCopyWith<$Res> {
  factory _$WeeklyDayDetailCopyWith(_WeeklyDayDetail value, $Res Function(_WeeklyDayDetail) _then) = __$WeeklyDayDetailCopyWithImpl;
@override @useResult
$Res call({
 String date, Weekday dayOfWeek, bool planned, bool completed, int activityCount, int minutes
});




}
/// @nodoc
class __$WeeklyDayDetailCopyWithImpl<$Res>
    implements _$WeeklyDayDetailCopyWith<$Res> {
  __$WeeklyDayDetailCopyWithImpl(this._self, this._then);

  final _WeeklyDayDetail _self;
  final $Res Function(_WeeklyDayDetail) _then;

/// Create a copy of WeeklyDayDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? dayOfWeek = null,Object? planned = null,Object? completed = null,Object? activityCount = null,Object? minutes = null,}) {
  return _then(_WeeklyDayDetail(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as Weekday,planned: null == planned ? _self.planned : planned // ignore: cast_nullable_to_non_nullable
as bool,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,activityCount: null == activityCount ? _self.activityCount : activityCount // ignore: cast_nullable_to_non_nullable
as int,minutes: null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
