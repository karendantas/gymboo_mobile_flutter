// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PetLog {

 int get id; String get action; String get attribute; int? get oldValue; int? get newValue; String get createdAt;
/// Create a copy of PetLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetLogCopyWith<PetLog> get copyWith => _$PetLogCopyWithImpl<PetLog>(this as PetLog, _$identity);

  /// Serializes this PetLog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetLog&&(identical(other.id, id) || other.id == id)&&(identical(other.action, action) || other.action == action)&&(identical(other.attribute, attribute) || other.attribute == attribute)&&(identical(other.oldValue, oldValue) || other.oldValue == oldValue)&&(identical(other.newValue, newValue) || other.newValue == newValue)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,action,attribute,oldValue,newValue,createdAt);

@override
String toString() {
  return 'PetLog(id: $id, action: $action, attribute: $attribute, oldValue: $oldValue, newValue: $newValue, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PetLogCopyWith<$Res>  {
  factory $PetLogCopyWith(PetLog value, $Res Function(PetLog) _then) = _$PetLogCopyWithImpl;
@useResult
$Res call({
 int id, String action, String attribute, int? oldValue, int? newValue, String createdAt
});




}
/// @nodoc
class _$PetLogCopyWithImpl<$Res>
    implements $PetLogCopyWith<$Res> {
  _$PetLogCopyWithImpl(this._self, this._then);

  final PetLog _self;
  final $Res Function(PetLog) _then;

/// Create a copy of PetLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? action = null,Object? attribute = null,Object? oldValue = freezed,Object? newValue = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,attribute: null == attribute ? _self.attribute : attribute // ignore: cast_nullable_to_non_nullable
as String,oldValue: freezed == oldValue ? _self.oldValue : oldValue // ignore: cast_nullable_to_non_nullable
as int?,newValue: freezed == newValue ? _self.newValue : newValue // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PetLog].
extension PetLogPatterns on PetLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PetLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PetLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PetLog value)  $default,){
final _that = this;
switch (_that) {
case _PetLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PetLog value)?  $default,){
final _that = this;
switch (_that) {
case _PetLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String action,  String attribute,  int? oldValue,  int? newValue,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PetLog() when $default != null:
return $default(_that.id,_that.action,_that.attribute,_that.oldValue,_that.newValue,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String action,  String attribute,  int? oldValue,  int? newValue,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _PetLog():
return $default(_that.id,_that.action,_that.attribute,_that.oldValue,_that.newValue,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String action,  String attribute,  int? oldValue,  int? newValue,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PetLog() when $default != null:
return $default(_that.id,_that.action,_that.attribute,_that.oldValue,_that.newValue,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PetLog implements PetLog {
  const _PetLog({required this.id, required this.action, required this.attribute, this.oldValue, this.newValue, required this.createdAt});
  factory _PetLog.fromJson(Map<String, dynamic> json) => _$PetLogFromJson(json);

@override final  int id;
@override final  String action;
@override final  String attribute;
@override final  int? oldValue;
@override final  int? newValue;
@override final  String createdAt;

/// Create a copy of PetLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PetLogCopyWith<_PetLog> get copyWith => __$PetLogCopyWithImpl<_PetLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PetLogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PetLog&&(identical(other.id, id) || other.id == id)&&(identical(other.action, action) || other.action == action)&&(identical(other.attribute, attribute) || other.attribute == attribute)&&(identical(other.oldValue, oldValue) || other.oldValue == oldValue)&&(identical(other.newValue, newValue) || other.newValue == newValue)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,action,attribute,oldValue,newValue,createdAt);

@override
String toString() {
  return 'PetLog(id: $id, action: $action, attribute: $attribute, oldValue: $oldValue, newValue: $newValue, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PetLogCopyWith<$Res> implements $PetLogCopyWith<$Res> {
  factory _$PetLogCopyWith(_PetLog value, $Res Function(_PetLog) _then) = __$PetLogCopyWithImpl;
@override @useResult
$Res call({
 int id, String action, String attribute, int? oldValue, int? newValue, String createdAt
});




}
/// @nodoc
class __$PetLogCopyWithImpl<$Res>
    implements _$PetLogCopyWith<$Res> {
  __$PetLogCopyWithImpl(this._self, this._then);

  final _PetLog _self;
  final $Res Function(_PetLog) _then;

/// Create a copy of PetLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? action = null,Object? attribute = null,Object? oldValue = freezed,Object? newValue = freezed,Object? createdAt = null,}) {
  return _then(_PetLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,attribute: null == attribute ? _self.attribute : attribute // ignore: cast_nullable_to_non_nullable
as String,oldValue: freezed == oldValue ? _self.oldValue : oldValue // ignore: cast_nullable_to_non_nullable
as int?,newValue: freezed == newValue ? _self.newValue : newValue // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
