// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ranking_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RankingEntry {

 int get position; String get displayName; String get petName; String get petType; int get level; int get totalXp; bool get currentUser;
/// Create a copy of RankingEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RankingEntryCopyWith<RankingEntry> get copyWith => _$RankingEntryCopyWithImpl<RankingEntry>(this as RankingEntry, _$identity);

  /// Serializes this RankingEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RankingEntry&&(identical(other.position, position) || other.position == position)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.petName, petName) || other.petName == petName)&&(identical(other.petType, petType) || other.petType == petType)&&(identical(other.level, level) || other.level == level)&&(identical(other.totalXp, totalXp) || other.totalXp == totalXp)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,position,displayName,petName,petType,level,totalXp,currentUser);

@override
String toString() {
  return 'RankingEntry(position: $position, displayName: $displayName, petName: $petName, petType: $petType, level: $level, totalXp: $totalXp, currentUser: $currentUser)';
}


}

/// @nodoc
abstract mixin class $RankingEntryCopyWith<$Res>  {
  factory $RankingEntryCopyWith(RankingEntry value, $Res Function(RankingEntry) _then) = _$RankingEntryCopyWithImpl;
@useResult
$Res call({
 int position, String displayName, String petName, String petType, int level, int totalXp, bool currentUser
});




}
/// @nodoc
class _$RankingEntryCopyWithImpl<$Res>
    implements $RankingEntryCopyWith<$Res> {
  _$RankingEntryCopyWithImpl(this._self, this._then);

  final RankingEntry _self;
  final $Res Function(RankingEntry) _then;

/// Create a copy of RankingEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? position = null,Object? displayName = null,Object? petName = null,Object? petType = null,Object? level = null,Object? totalXp = null,Object? currentUser = null,}) {
  return _then(_self.copyWith(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,petName: null == petName ? _self.petName : petName // ignore: cast_nullable_to_non_nullable
as String,petType: null == petType ? _self.petType : petType // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,totalXp: null == totalXp ? _self.totalXp : totalXp // ignore: cast_nullable_to_non_nullable
as int,currentUser: null == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RankingEntry].
extension RankingEntryPatterns on RankingEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RankingEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RankingEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RankingEntry value)  $default,){
final _that = this;
switch (_that) {
case _RankingEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RankingEntry value)?  $default,){
final _that = this;
switch (_that) {
case _RankingEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int position,  String displayName,  String petName,  String petType,  int level,  int totalXp,  bool currentUser)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RankingEntry() when $default != null:
return $default(_that.position,_that.displayName,_that.petName,_that.petType,_that.level,_that.totalXp,_that.currentUser);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int position,  String displayName,  String petName,  String petType,  int level,  int totalXp,  bool currentUser)  $default,) {final _that = this;
switch (_that) {
case _RankingEntry():
return $default(_that.position,_that.displayName,_that.petName,_that.petType,_that.level,_that.totalXp,_that.currentUser);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int position,  String displayName,  String petName,  String petType,  int level,  int totalXp,  bool currentUser)?  $default,) {final _that = this;
switch (_that) {
case _RankingEntry() when $default != null:
return $default(_that.position,_that.displayName,_that.petName,_that.petType,_that.level,_that.totalXp,_that.currentUser);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RankingEntry implements RankingEntry {
  const _RankingEntry({required this.position, required this.displayName, required this.petName, required this.petType, required this.level, required this.totalXp, required this.currentUser});
  factory _RankingEntry.fromJson(Map<String, dynamic> json) => _$RankingEntryFromJson(json);

@override final  int position;
@override final  String displayName;
@override final  String petName;
@override final  String petType;
@override final  int level;
@override final  int totalXp;
@override final  bool currentUser;

/// Create a copy of RankingEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RankingEntryCopyWith<_RankingEntry> get copyWith => __$RankingEntryCopyWithImpl<_RankingEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RankingEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RankingEntry&&(identical(other.position, position) || other.position == position)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.petName, petName) || other.petName == petName)&&(identical(other.petType, petType) || other.petType == petType)&&(identical(other.level, level) || other.level == level)&&(identical(other.totalXp, totalXp) || other.totalXp == totalXp)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,position,displayName,petName,petType,level,totalXp,currentUser);

@override
String toString() {
  return 'RankingEntry(position: $position, displayName: $displayName, petName: $petName, petType: $petType, level: $level, totalXp: $totalXp, currentUser: $currentUser)';
}


}

/// @nodoc
abstract mixin class _$RankingEntryCopyWith<$Res> implements $RankingEntryCopyWith<$Res> {
  factory _$RankingEntryCopyWith(_RankingEntry value, $Res Function(_RankingEntry) _then) = __$RankingEntryCopyWithImpl;
@override @useResult
$Res call({
 int position, String displayName, String petName, String petType, int level, int totalXp, bool currentUser
});




}
/// @nodoc
class __$RankingEntryCopyWithImpl<$Res>
    implements _$RankingEntryCopyWith<$Res> {
  __$RankingEntryCopyWithImpl(this._self, this._then);

  final _RankingEntry _self;
  final $Res Function(_RankingEntry) _then;

/// Create a copy of RankingEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? position = null,Object? displayName = null,Object? petName = null,Object? petType = null,Object? level = null,Object? totalXp = null,Object? currentUser = null,}) {
  return _then(_RankingEntry(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,petName: null == petName ? _self.petName : petName // ignore: cast_nullable_to_non_nullable
as String,petType: null == petType ? _self.petType : petType // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,totalXp: null == totalXp ? _self.totalXp : totalXp // ignore: cast_nullable_to_non_nullable
as int,currentUser: null == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
