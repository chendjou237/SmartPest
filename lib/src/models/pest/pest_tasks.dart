import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';
import 'package:pest_gpt/src/utils/json_convertor.dart';

part 'pest_tasks.g.dart';

@JsonSerializable()
class PestTasks {
  @Uint8ListConverter()
  @JsonKey(includeFromJson: false, includeToJson: false)
  Uint8List? image;
  String pestName;
  List<Task> tasks;

  PestTasks({required this.pestName, required this.tasks, this.image});

  factory PestTasks.fromJson(Map<String, dynamic> json) =>
      _$PestTasksFromJson(json);

  Map<String, dynamic> toJson() => _$PestTasksToJson(this);
}

@JsonSerializable()
class Task {
  String taskName;
  bool isCompleted;

  Task({
    required this.taskName,
    this.isCompleted = false,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
