// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_do_updated_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ToDoUpdatedModel _$ToDoUpdatedModelFromJson(Map<String, dynamic> json) =>
    _ToDoUpdatedModel(
      userId: (json['userId'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$ToDoUpdatedModelToJson(_ToDoUpdatedModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
