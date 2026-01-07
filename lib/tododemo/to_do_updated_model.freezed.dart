// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'to_do_updated_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ToDoUpdatedModel {

 int get userId; int get id; String get title; bool get completed;
/// Create a copy of ToDoUpdatedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToDoUpdatedModelCopyWith<ToDoUpdatedModel> get copyWith => _$ToDoUpdatedModelCopyWithImpl<ToDoUpdatedModel>(this as ToDoUpdatedModel, _$identity);

  /// Serializes this ToDoUpdatedModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToDoUpdatedModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.completed, completed) || other.completed == completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,id,title,completed);

@override
String toString() {
  return 'ToDoUpdatedModel(userId: $userId, id: $id, title: $title, completed: $completed)';
}


}

/// @nodoc
abstract mixin class $ToDoUpdatedModelCopyWith<$Res>  {
  factory $ToDoUpdatedModelCopyWith(ToDoUpdatedModel value, $Res Function(ToDoUpdatedModel) _then) = _$ToDoUpdatedModelCopyWithImpl;
@useResult
$Res call({
 int userId, int id, String title, bool completed
});




}
/// @nodoc
class _$ToDoUpdatedModelCopyWithImpl<$Res>
    implements $ToDoUpdatedModelCopyWith<$Res> {
  _$ToDoUpdatedModelCopyWithImpl(this._self, this._then);

  final ToDoUpdatedModel _self;
  final $Res Function(ToDoUpdatedModel) _then;

/// Create a copy of ToDoUpdatedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? id = null,Object? title = null,Object? completed = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ToDoUpdatedModel].
extension ToDoUpdatedModelPatterns on ToDoUpdatedModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToDoUpdatedModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToDoUpdatedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToDoUpdatedModel value)  $default,){
final _that = this;
switch (_that) {
case _ToDoUpdatedModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToDoUpdatedModel value)?  $default,){
final _that = this;
switch (_that) {
case _ToDoUpdatedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userId,  int id,  String title,  bool completed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToDoUpdatedModel() when $default != null:
return $default(_that.userId,_that.id,_that.title,_that.completed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userId,  int id,  String title,  bool completed)  $default,) {final _that = this;
switch (_that) {
case _ToDoUpdatedModel():
return $default(_that.userId,_that.id,_that.title,_that.completed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userId,  int id,  String title,  bool completed)?  $default,) {final _that = this;
switch (_that) {
case _ToDoUpdatedModel() when $default != null:
return $default(_that.userId,_that.id,_that.title,_that.completed);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _ToDoUpdatedModel implements ToDoUpdatedModel {
  const _ToDoUpdatedModel({required this.userId, required this.id, required this.title, required this.completed});
  factory _ToDoUpdatedModel.fromJson(Map<String, dynamic> json) => _$ToDoUpdatedModelFromJson(json);

@override final  int userId;
@override final  int id;
@override final  String title;
@override final  bool completed;

/// Create a copy of ToDoUpdatedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToDoUpdatedModelCopyWith<_ToDoUpdatedModel> get copyWith => __$ToDoUpdatedModelCopyWithImpl<_ToDoUpdatedModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToDoUpdatedModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToDoUpdatedModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.completed, completed) || other.completed == completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,id,title,completed);

@override
String toString() {
  return 'ToDoUpdatedModel(userId: $userId, id: $id, title: $title, completed: $completed)';
}


}

/// @nodoc
abstract mixin class _$ToDoUpdatedModelCopyWith<$Res> implements $ToDoUpdatedModelCopyWith<$Res> {
  factory _$ToDoUpdatedModelCopyWith(_ToDoUpdatedModel value, $Res Function(_ToDoUpdatedModel) _then) = __$ToDoUpdatedModelCopyWithImpl;
@override @useResult
$Res call({
 int userId, int id, String title, bool completed
});




}
/// @nodoc
class __$ToDoUpdatedModelCopyWithImpl<$Res>
    implements _$ToDoUpdatedModelCopyWith<$Res> {
  __$ToDoUpdatedModelCopyWithImpl(this._self, this._then);

  final _ToDoUpdatedModel _self;
  final $Res Function(_ToDoUpdatedModel) _then;

/// Create a copy of ToDoUpdatedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? id = null,Object? title = null,Object? completed = null,}) {
  return _then(_ToDoUpdatedModel(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
