import 'dart:convert';

import 'package:employees_control/src/domain/entities/task.dart';

TaskResponse taskResponseFromJson(String str) {
  return TaskResponse.fromJson(json.decode(str) as Map<String, dynamic>);
}

class TaskResponse {
  const TaskResponse({
    required this.status,
    required this.message,
    this.tasks,
  });

  final int status;
  final String message;
  final List<Task>? tasks;

  factory TaskResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic>? data = json['data'] == null
        ? null
        : json['data'] is Map<String, dynamic>
            ? [json['data']]
            : json['data'] as List<dynamic>;
    return TaskResponse(
      status: json['status'] as int,
      message: json['message'] as String,
      tasks: data == null || data.isEmpty
          ? null
          : List<Task>.from(
              data.map((element) {
                return Task.fromJson(element as Map<String, dynamic>);
              }),
            ),
    );
  }
}
