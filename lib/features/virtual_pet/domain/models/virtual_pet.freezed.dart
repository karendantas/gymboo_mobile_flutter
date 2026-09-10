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
mixin _$PetSkill {

 String get skill; int get level; int get xp; int get xpIntoCurrentLevel; int get xpToNextLevel; double get progress;
/// Create a copy of PetSkill
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetSkillCopyWith<PetSkill> get copyWith => _$PetSkillCopyWithImpl<PetSkill>(this as PetSkill, _$identity);

  /// Serializes this PetSkill to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetSkill&&(identical(other.skill, skill) || other.skill == skill)&&(identical(other.level, level) || other.level == level)&&(identical(other.xp, xp) || other.xp == xp)&&(identical(other.xpIntoCurrentLevel, xpIntoCurrentLevel) || other.xpIntoCurrentLevel == xpIntoCurrentLevel)&&(identical(other.xpToNextLevel, xpToNextLevel) || other.xpToNextLevel == xpToNextLevel)&&(identical(other.progress, progress) || other.progress == progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,skill,level,xp,xpIntoCurrentLevel,xpToNextLevel,progress);

@override
String toString() {
  return 'PetSkill(skill: $skill, level: $level, xp: $xp, xpIntoCurrentLevel: $xpIntoCurrentLevel, xpToNextLevel: $xpToNextLevel, progress: $progress)';
}


}

/// @nodoc
abstract mixin class $PetSkillCopyWith<$Res>  {
  factory $PetSkillCopyWith(PetSkill value, $Res Function(PetSkill) _then) = _$PetSkillCopyWithImpl;
@useResult
$Res call({
 String skill, int level, int xp, int xpIntoCurrentLevel, int xpToNextLevel, double progress
});




}
/// @nodoc
class _$PetSkillCopyWithImpl<$Res>
    implements $PetSkillCopyWith<$Res> {
  _$PetSkillCopyWithImpl(this._self, this._then);

  final PetSkill _self;
  final $Res Function(PetSkill) _then;

/// Create a copy of PetSkill
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? skill = null,Object? level = null,Object? xp = null,Object? xpIntoCurrentLevel = null,Object? xpToNextLevel = null,Object? progress = null,}) {
  return _then(_self.copyWith(
skill: null == skill ? _self.skill : skill // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,xp: null == xp ? _self.xp : xp // ignore: cast_nullable_to_non_nullable
as int,xpIntoCurrentLevel: null == xpIntoCurrentLevel ? _self.xpIntoCurrentLevel : xpIntoCurrentLevel // ignore: cast_nullable_to_non_nullable
as int,xpToNextLevel: null == xpToNextLevel ? _self.xpToNextLevel : xpToNextLevel // ignore: cast_nullable_to_non_nullable
as int,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PetSkill].
extension PetSkillPatterns on PetSkill {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PetSkill value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PetSkill() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PetSkill value)  $default,){
final _that = this;
switch (_that) {
case _PetSkill():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PetSkill value)?  $default,){
final _that = this;
switch (_that) {
case _PetSkill() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String skill,  int level,  int xp,  int xpIntoCurrentLevel,  int xpToNextLevel,  double progress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PetSkill() when $default != null:
return $default(_that.skill,_that.level,_that.xp,_that.xpIntoCurrentLevel,_that.xpToNextLevel,_that.progress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String skill,  int level,  int xp,  int xpIntoCurrentLevel,  int xpToNextLevel,  double progress)  $default,) {final _that = this;
switch (_that) {
case _PetSkill():
return $default(_that.skill,_that.level,_that.xp,_that.xpIntoCurrentLevel,_that.xpToNextLevel,_that.progress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String skill,  int level,  int xp,  int xpIntoCurrentLevel,  int xpToNextLevel,  double progress)?  $default,) {final _that = this;
switch (_that) {
case _PetSkill() when $default != null:
return $default(_that.skill,_that.level,_that.xp,_that.xpIntoCurrentLevel,_that.xpToNextLevel,_that.progress);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PetSkill implements PetSkill {
  const _PetSkill({required this.skill, required this.level, required this.xp, required this.xpIntoCurrentLevel, required this.xpToNextLevel, required this.progress});
  factory _PetSkill.fromJson(Map<String, dynamic> json) => _$PetSkillFromJson(json);

@override final  String skill;
@override final  int level;
@override final  int xp;
@override final  int xpIntoCurrentLevel;
@override final  int xpToNextLevel;
@override final  double progress;

/// Create a copy of PetSkill
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PetSkillCopyWith<_PetSkill> get copyWith => __$PetSkillCopyWithImpl<_PetSkill>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PetSkillToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PetSkill&&(identical(other.skill, skill) || other.skill == skill)&&(identical(other.level, level) || other.level == level)&&(identical(other.xp, xp) || other.xp == xp)&&(identical(other.xpIntoCurrentLevel, xpIntoCurrentLevel) || other.xpIntoCurrentLevel == xpIntoCurrentLevel)&&(identical(other.xpToNextLevel, xpToNextLevel) || other.xpToNextLevel == xpToNextLevel)&&(identical(other.progress, progress) || other.progress == progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,skill,level,xp,xpIntoCurrentLevel,xpToNextLevel,progress);

@override
String toString() {
  return 'PetSkill(skill: $skill, level: $level, xp: $xp, xpIntoCurrentLevel: $xpIntoCurrentLevel, xpToNextLevel: $xpToNextLevel, progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$PetSkillCopyWith<$Res> implements $PetSkillCopyWith<$Res> {
  factory _$PetSkillCopyWith(_PetSkill value, $Res Function(_PetSkill) _then) = __$PetSkillCopyWithImpl;
@override @useResult
$Res call({
 String skill, int level, int xp, int xpIntoCurrentLevel, int xpToNextLevel, double progress
});




}
/// @nodoc
class __$PetSkillCopyWithImpl<$Res>
    implements _$PetSkillCopyWith<$Res> {
  __$PetSkillCopyWithImpl(this._self, this._then);

  final _PetSkill _self;
  final $Res Function(_PetSkill) _then;

/// Create a copy of PetSkill
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? skill = null,Object? level = null,Object? xp = null,Object? xpIntoCurrentLevel = null,Object? xpToNextLevel = null,Object? progress = null,}) {
  return _then(_PetSkill(
skill: null == skill ? _self.skill : skill // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,xp: null == xp ? _self.xp : xp // ignore: cast_nullable_to_non_nullable
as int,xpIntoCurrentLevel: null == xpIntoCurrentLevel ? _self.xpIntoCurrentLevel : xpIntoCurrentLevel // ignore: cast_nullable_to_non_nullable
as int,xpToNextLevel: null == xpToNextLevel ? _self.xpToNextLevel : xpToNextLevel // ignore: cast_nullable_to_non_nullable
as int,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$VirtualPet {

 int get id; String get name; String get type; int get level; int get life; int get points; int get totalXp; List<PetSkill> get skills;
/// Create a copy of VirtualPet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VirtualPetCopyWith<VirtualPet> get copyWith => _$VirtualPetCopyWithImpl<VirtualPet>(this as VirtualPet, _$identity);

  /// Serializes this VirtualPet to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VirtualPet&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.level, level) || other.level == level)&&(identical(other.life, life) || other.life == life)&&(identical(other.points, points) || other.points == points)&&(identical(other.totalXp, totalXp) || other.totalXp == totalXp)&&const DeepCollectionEquality().equals(other.skills, skills));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,level,life,points,totalXp,const DeepCollectionEquality().hash(skills));

@override
String toString() {
  return 'VirtualPet(id: $id, name: $name, type: $type, level: $level, life: $life, points: $points, totalXp: $totalXp, skills: $skills)';
}


}

/// @nodoc
abstract mixin class $VirtualPetCopyWith<$Res>  {
  factory $VirtualPetCopyWith(VirtualPet value, $Res Function(VirtualPet) _then) = _$VirtualPetCopyWithImpl;
@useResult
$Res call({
 int id, String name, String type, int level, int life, int points, int totalXp, List<PetSkill> skills
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? level = null,Object? life = null,Object? points = null,Object? totalXp = null,Object? skills = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,life: null == life ? _self.life : life // ignore: cast_nullable_to_non_nullable
as int,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,totalXp: null == totalXp ? _self.totalXp : totalXp // ignore: cast_nullable_to_non_nullable
as int,skills: null == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<PetSkill>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String type,  int level,  int life,  int points,  int totalXp,  List<PetSkill> skills)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VirtualPet() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.level,_that.life,_that.points,_that.totalXp,_that.skills);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String type,  int level,  int life,  int points,  int totalXp,  List<PetSkill> skills)  $default,) {final _that = this;
switch (_that) {
case _VirtualPet():
return $default(_that.id,_that.name,_that.type,_that.level,_that.life,_that.points,_that.totalXp,_that.skills);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String type,  int level,  int life,  int points,  int totalXp,  List<PetSkill> skills)?  $default,) {final _that = this;
switch (_that) {
case _VirtualPet() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.level,_that.life,_that.points,_that.totalXp,_that.skills);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VirtualPet extends VirtualPet {
  const _VirtualPet({required this.id, required this.name, required this.type, required this.level, required this.life, required this.points, required this.totalXp, required final  List<PetSkill> skills}): _skills = skills,super._();
  factory _VirtualPet.fromJson(Map<String, dynamic> json) => _$VirtualPetFromJson(json);

@override final  int id;
@override final  String name;
@override final  String type;
@override final  int level;
@override final  int life;
@override final  int points;
@override final  int totalXp;
 final  List<PetSkill> _skills;
@override List<PetSkill> get skills {
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_skills);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VirtualPet&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.level, level) || other.level == level)&&(identical(other.life, life) || other.life == life)&&(identical(other.points, points) || other.points == points)&&(identical(other.totalXp, totalXp) || other.totalXp == totalXp)&&const DeepCollectionEquality().equals(other._skills, _skills));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,level,life,points,totalXp,const DeepCollectionEquality().hash(_skills));

@override
String toString() {
  return 'VirtualPet(id: $id, name: $name, type: $type, level: $level, life: $life, points: $points, totalXp: $totalXp, skills: $skills)';
}


}

/// @nodoc
abstract mixin class _$VirtualPetCopyWith<$Res> implements $VirtualPetCopyWith<$Res> {
  factory _$VirtualPetCopyWith(_VirtualPet value, $Res Function(_VirtualPet) _then) = __$VirtualPetCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String type, int level, int life, int points, int totalXp, List<PetSkill> skills
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? level = null,Object? life = null,Object? points = null,Object? totalXp = null,Object? skills = null,}) {
  return _then(_VirtualPet(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,life: null == life ? _self.life : life // ignore: cast_nullable_to_non_nullable
as int,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,totalXp: null == totalXp ? _self.totalXp : totalXp // ignore: cast_nullable_to_non_nullable
as int,skills: null == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<PetSkill>,
  ));
}


}

// dart format on
