// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reward.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Reward {

 int get id; String get code; String get name; String get slot; String get requiredSkill; int get requiredLevel; bool get unlocked; bool get equipped;
/// Create a copy of Reward
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RewardCopyWith<Reward> get copyWith => _$RewardCopyWithImpl<Reward>(this as Reward, _$identity);

  /// Serializes this Reward to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reward&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.requiredSkill, requiredSkill) || other.requiredSkill == requiredSkill)&&(identical(other.requiredLevel, requiredLevel) || other.requiredLevel == requiredLevel)&&(identical(other.unlocked, unlocked) || other.unlocked == unlocked)&&(identical(other.equipped, equipped) || other.equipped == equipped));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,slot,requiredSkill,requiredLevel,unlocked,equipped);

@override
String toString() {
  return 'Reward(id: $id, code: $code, name: $name, slot: $slot, requiredSkill: $requiredSkill, requiredLevel: $requiredLevel, unlocked: $unlocked, equipped: $equipped)';
}


}

/// @nodoc
abstract mixin class $RewardCopyWith<$Res>  {
  factory $RewardCopyWith(Reward value, $Res Function(Reward) _then) = _$RewardCopyWithImpl;
@useResult
$Res call({
 int id, String code, String name, String slot, String requiredSkill, int requiredLevel, bool unlocked, bool equipped
});




}
/// @nodoc
class _$RewardCopyWithImpl<$Res>
    implements $RewardCopyWith<$Res> {
  _$RewardCopyWithImpl(this._self, this._then);

  final Reward _self;
  final $Res Function(Reward) _then;

/// Create a copy of Reward
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? name = null,Object? slot = null,Object? requiredSkill = null,Object? requiredLevel = null,Object? unlocked = null,Object? equipped = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as String,requiredSkill: null == requiredSkill ? _self.requiredSkill : requiredSkill // ignore: cast_nullable_to_non_nullable
as String,requiredLevel: null == requiredLevel ? _self.requiredLevel : requiredLevel // ignore: cast_nullable_to_non_nullable
as int,unlocked: null == unlocked ? _self.unlocked : unlocked // ignore: cast_nullable_to_non_nullable
as bool,equipped: null == equipped ? _self.equipped : equipped // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Reward].
extension RewardPatterns on Reward {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Reward value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Reward() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Reward value)  $default,){
final _that = this;
switch (_that) {
case _Reward():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Reward value)?  $default,){
final _that = this;
switch (_that) {
case _Reward() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String code,  String name,  String slot,  String requiredSkill,  int requiredLevel,  bool unlocked,  bool equipped)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Reward() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.slot,_that.requiredSkill,_that.requiredLevel,_that.unlocked,_that.equipped);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String code,  String name,  String slot,  String requiredSkill,  int requiredLevel,  bool unlocked,  bool equipped)  $default,) {final _that = this;
switch (_that) {
case _Reward():
return $default(_that.id,_that.code,_that.name,_that.slot,_that.requiredSkill,_that.requiredLevel,_that.unlocked,_that.equipped);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String code,  String name,  String slot,  String requiredSkill,  int requiredLevel,  bool unlocked,  bool equipped)?  $default,) {final _that = this;
switch (_that) {
case _Reward() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.slot,_that.requiredSkill,_that.requiredLevel,_that.unlocked,_that.equipped);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Reward implements Reward {
  const _Reward({required this.id, required this.code, required this.name, required this.slot, required this.requiredSkill, required this.requiredLevel, required this.unlocked, required this.equipped});
  factory _Reward.fromJson(Map<String, dynamic> json) => _$RewardFromJson(json);

@override final  int id;
@override final  String code;
@override final  String name;
@override final  String slot;
@override final  String requiredSkill;
@override final  int requiredLevel;
@override final  bool unlocked;
@override final  bool equipped;

/// Create a copy of Reward
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RewardCopyWith<_Reward> get copyWith => __$RewardCopyWithImpl<_Reward>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RewardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reward&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.requiredSkill, requiredSkill) || other.requiredSkill == requiredSkill)&&(identical(other.requiredLevel, requiredLevel) || other.requiredLevel == requiredLevel)&&(identical(other.unlocked, unlocked) || other.unlocked == unlocked)&&(identical(other.equipped, equipped) || other.equipped == equipped));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,slot,requiredSkill,requiredLevel,unlocked,equipped);

@override
String toString() {
  return 'Reward(id: $id, code: $code, name: $name, slot: $slot, requiredSkill: $requiredSkill, requiredLevel: $requiredLevel, unlocked: $unlocked, equipped: $equipped)';
}


}

/// @nodoc
abstract mixin class _$RewardCopyWith<$Res> implements $RewardCopyWith<$Res> {
  factory _$RewardCopyWith(_Reward value, $Res Function(_Reward) _then) = __$RewardCopyWithImpl;
@override @useResult
$Res call({
 int id, String code, String name, String slot, String requiredSkill, int requiredLevel, bool unlocked, bool equipped
});




}
/// @nodoc
class __$RewardCopyWithImpl<$Res>
    implements _$RewardCopyWith<$Res> {
  __$RewardCopyWithImpl(this._self, this._then);

  final _Reward _self;
  final $Res Function(_Reward) _then;

/// Create a copy of Reward
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? name = null,Object? slot = null,Object? requiredSkill = null,Object? requiredLevel = null,Object? unlocked = null,Object? equipped = null,}) {
  return _then(_Reward(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as String,requiredSkill: null == requiredSkill ? _self.requiredSkill : requiredSkill // ignore: cast_nullable_to_non_nullable
as String,requiredLevel: null == requiredLevel ? _self.requiredLevel : requiredLevel // ignore: cast_nullable_to_non_nullable
as int,unlocked: null == unlocked ? _self.unlocked : unlocked // ignore: cast_nullable_to_non_nullable
as bool,equipped: null == equipped ? _self.equipped : equipped // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
