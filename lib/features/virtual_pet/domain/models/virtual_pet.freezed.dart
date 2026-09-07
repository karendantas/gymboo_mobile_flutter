// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'virtual_pet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VirtualPet {

 String get id; String get name; int get life; int get level; int get points; int get xpToNextLevel; PetColorVariant get colorVariant;
/// Create a copy of VirtualPet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VirtualPetCopyWith<VirtualPet> get copyWith => _$VirtualPetCopyWithImpl<VirtualPet>(this as VirtualPet, _$identity);

  /// Serializes this VirtualPet to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VirtualPet&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.life, life) || other.life == life)&&(identical(other.level, level) || other.level == level)&&(identical(other.points, points) || other.points == points)&&(identical(other.xpToNextLevel, xpToNextLevel) || other.xpToNextLevel == xpToNextLevel)&&(identical(other.colorVariant, colorVariant) || other.colorVariant == colorVariant));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,life,level,points,xpToNextLevel,colorVariant);

@override
String toString() {
  return 'VirtualPet(id: $id, name: $name, life: $life, level: $level, points: $points, xpToNextLevel: $xpToNextLevel, colorVariant: $colorVariant)';
}


}

/// @nodoc
abstract mixin class $VirtualPetCopyWith<$Res>  {
  factory $VirtualPetCopyWith(VirtualPet value, $Res Function(VirtualPet) _then) = _$VirtualPetCopyWithImpl;
@useResult
$Res call({
 String id, String name, int life, int level, int points, int xpToNextLevel, PetColorVariant colorVariant
});




}
/// @nodoc
class _$VirtualPetCopyWithImpl<$Res>
    implements $VirtualPetCopyWith<$Res> {
  _$VirtualPetCopyWithImpl(this._self, this._then);

  final VirtualPet _self;
  final $Res Function(VirtualPet) _then;

/// Create a copy of VirtualPet
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? life = null,Object? level = null,Object? points = null,Object? xpToNextLevel = null,Object? colorVariant = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,life: null == life ? _self.life : life // ignore: cast_nullable_to_non_nullable
as int,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,xpToNextLevel: null == xpToNextLevel ? _self.xpToNextLevel : xpToNextLevel // ignore: cast_nullable_to_non_nullable
as int,colorVariant: null == colorVariant ? _self.colorVariant : colorVariant // ignore: cast_nullable_to_non_nullable
as PetColorVariant,
  ));
}

}


/// Adds pattern-matching-related methods to [VirtualPet].
extension VirtualPetPatterns on VirtualPet {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VirtualPet value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VirtualPet() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VirtualPet value)  $default,){
final _that = this;
switch (_that) {
case _VirtualPet():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VirtualPet value)?  $default,){
final _that = this;
switch (_that) {
case _VirtualPet() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int life,  int level,  int points,  int xpToNextLevel,  PetColorVariant colorVariant)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VirtualPet() when $default != null:
return $default(_that.id,_that.name,_that.life,_that.level,_that.points,_that.xpToNextLevel,_that.colorVariant);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int life,  int level,  int points,  int xpToNextLevel,  PetColorVariant colorVariant)  $default,) {final _that = this;
switch (_that) {
case _VirtualPet():
return $default(_that.id,_that.name,_that.life,_that.level,_that.points,_that.xpToNextLevel,_that.colorVariant);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int life,  int level,  int points,  int xpToNextLevel,  PetColorVariant colorVariant)?  $default,) {final _that = this;
switch (_that) {
case _VirtualPet() when $default != null:
return $default(_that.id,_that.name,_that.life,_that.level,_that.points,_that.xpToNextLevel,_that.colorVariant);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VirtualPet extends VirtualPet {
  const _VirtualPet({required this.id, required this.name, required this.life, required this.level, required this.points, required this.xpToNextLevel, required this.colorVariant}): super._();
  factory _VirtualPet.fromJson(Map<String, dynamic> json) => _$VirtualPetFromJson(json);

@override final  String id;
@override final  String name;
@override final  int life;
@override final  int level;
@override final  int points;
@override final  int xpToNextLevel;
@override final  PetColorVariant colorVariant;

/// Create a copy of VirtualPet
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VirtualPetCopyWith<_VirtualPet> get copyWith => __$VirtualPetCopyWithImpl<_VirtualPet>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VirtualPetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VirtualPet&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.life, life) || other.life == life)&&(identical(other.level, level) || other.level == level)&&(identical(other.points, points) || other.points == points)&&(identical(other.xpToNextLevel, xpToNextLevel) || other.xpToNextLevel == xpToNextLevel)&&(identical(other.colorVariant, colorVariant) || other.colorVariant == colorVariant));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,life,level,points,xpToNextLevel,colorVariant);

@override
String toString() {
  return 'VirtualPet(id: $id, name: $name, life: $life, level: $level, points: $points, xpToNextLevel: $xpToNextLevel, colorVariant: $colorVariant)';
}


}

/// @nodoc
abstract mixin class _$VirtualPetCopyWith<$Res> implements $VirtualPetCopyWith<$Res> {
  factory _$VirtualPetCopyWith(_VirtualPet value, $Res Function(_VirtualPet) _then) = __$VirtualPetCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int life, int level, int points, int xpToNextLevel, PetColorVariant colorVariant
});




}
/// @nodoc
class __$VirtualPetCopyWithImpl<$Res>
    implements _$VirtualPetCopyWith<$Res> {
  __$VirtualPetCopyWithImpl(this._self, this._then);

  final _VirtualPet _self;
  final $Res Function(_VirtualPet) _then;

/// Create a copy of VirtualPet
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? life = null,Object? level = null,Object? points = null,Object? xpToNextLevel = null,Object? colorVariant = null,}) {
  return _then(_VirtualPet(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,life: null == life ? _self.life : life // ignore: cast_nullable_to_non_nullable
as int,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,xpToNextLevel: null == xpToNextLevel ? _self.xpToNextLevel : xpToNextLevel // ignore: cast_nullable_to_non_nullable
as int,colorVariant: null == colorVariant ? _self.colorVariant : colorVariant // ignore: cast_nullable_to_non_nullable
as PetColorVariant,
  ));
}


}

// dart format on
