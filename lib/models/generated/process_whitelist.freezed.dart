// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../process_whitelist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProcessWhitelist {

 int get id; String get processName; String get exePath; bool get enabled; String? get description; DateTime? get createdAt;
/// Create a copy of ProcessWhitelist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcessWhitelistCopyWith<ProcessWhitelist> get copyWith => _$ProcessWhitelistCopyWithImpl<ProcessWhitelist>(this as ProcessWhitelist, _$identity);

  /// Serializes this ProcessWhitelist to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProcessWhitelist&&(identical(other.id, id) || other.id == id)&&(identical(other.processName, processName) || other.processName == processName)&&(identical(other.exePath, exePath) || other.exePath == exePath)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,processName,exePath,enabled,description,createdAt);

@override
String toString() {
  return 'ProcessWhitelist(id: $id, processName: $processName, exePath: $exePath, enabled: $enabled, description: $description, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ProcessWhitelistCopyWith<$Res>  {
  factory $ProcessWhitelistCopyWith(ProcessWhitelist value, $Res Function(ProcessWhitelist) _then) = _$ProcessWhitelistCopyWithImpl;
@useResult
$Res call({
 int id, String processName, String exePath, bool enabled, String? description, DateTime? createdAt
});




}
/// @nodoc
class _$ProcessWhitelistCopyWithImpl<$Res>
    implements $ProcessWhitelistCopyWith<$Res> {
  _$ProcessWhitelistCopyWithImpl(this._self, this._then);

  final ProcessWhitelist _self;
  final $Res Function(ProcessWhitelist) _then;

/// Create a copy of ProcessWhitelist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? processName = null,Object? exePath = null,Object? enabled = null,Object? description = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,processName: null == processName ? _self.processName : processName // ignore: cast_nullable_to_non_nullable
as String,exePath: null == exePath ? _self.exePath : exePath // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProcessWhitelist].
extension ProcessWhitelistPatterns on ProcessWhitelist {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProcessWhitelist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProcessWhitelist() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProcessWhitelist value)  $default,){
final _that = this;
switch (_that) {
case _ProcessWhitelist():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProcessWhitelist value)?  $default,){
final _that = this;
switch (_that) {
case _ProcessWhitelist() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String processName,  String exePath,  bool enabled,  String? description,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProcessWhitelist() when $default != null:
return $default(_that.id,_that.processName,_that.exePath,_that.enabled,_that.description,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String processName,  String exePath,  bool enabled,  String? description,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _ProcessWhitelist():
return $default(_that.id,_that.processName,_that.exePath,_that.enabled,_that.description,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String processName,  String exePath,  bool enabled,  String? description,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ProcessWhitelist() when $default != null:
return $default(_that.id,_that.processName,_that.exePath,_that.enabled,_that.description,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProcessWhitelist implements ProcessWhitelist {
  const _ProcessWhitelist({this.id = -1, required this.processName, required this.exePath, this.enabled = true, this.description, this.createdAt});
  factory _ProcessWhitelist.fromJson(Map<String, dynamic> json) => _$ProcessWhitelistFromJson(json);

@override@JsonKey() final  int id;
@override final  String processName;
@override final  String exePath;
@override@JsonKey() final  bool enabled;
@override final  String? description;
@override final  DateTime? createdAt;

/// Create a copy of ProcessWhitelist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcessWhitelistCopyWith<_ProcessWhitelist> get copyWith => __$ProcessWhitelistCopyWithImpl<_ProcessWhitelist>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProcessWhitelistToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProcessWhitelist&&(identical(other.id, id) || other.id == id)&&(identical(other.processName, processName) || other.processName == processName)&&(identical(other.exePath, exePath) || other.exePath == exePath)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,processName,exePath,enabled,description,createdAt);

@override
String toString() {
  return 'ProcessWhitelist(id: $id, processName: $processName, exePath: $exePath, enabled: $enabled, description: $description, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ProcessWhitelistCopyWith<$Res> implements $ProcessWhitelistCopyWith<$Res> {
  factory _$ProcessWhitelistCopyWith(_ProcessWhitelist value, $Res Function(_ProcessWhitelist) _then) = __$ProcessWhitelistCopyWithImpl;
@override @useResult
$Res call({
 int id, String processName, String exePath, bool enabled, String? description, DateTime? createdAt
});




}
/// @nodoc
class __$ProcessWhitelistCopyWithImpl<$Res>
    implements _$ProcessWhitelistCopyWith<$Res> {
  __$ProcessWhitelistCopyWithImpl(this._self, this._then);

  final _ProcessWhitelist _self;
  final $Res Function(_ProcessWhitelist) _then;

/// Create a copy of ProcessWhitelist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? processName = null,Object? exePath = null,Object? enabled = null,Object? description = freezed,Object? createdAt = freezed,}) {
  return _then(_ProcessWhitelist(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,processName: null == processName ? _self.processName : processName // ignore: cast_nullable_to_non_nullable
as String,exePath: null == exePath ? _self.exePath : exePath // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
