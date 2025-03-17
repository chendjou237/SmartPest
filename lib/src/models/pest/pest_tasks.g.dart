// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pest_tasks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PestTasks _$PestTasksFromJson(Map<String, dynamic> json) => PestTasks(
      pestName: json['pestName'] as String,
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PestTasksToJson(PestTasks instance) => <String, dynamic>{
      'pestName': instance.pestName,
      'tasks': instance.tasks,
    };

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      taskName: json['taskName'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'taskName': instance.taskName,
      'isCompleted': instance.isCompleted,
    };
