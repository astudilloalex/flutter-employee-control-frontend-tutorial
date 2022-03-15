import 'package:employees_control/src/domain/entities/employee.dart';

class Task {
  const Task({
    required this.id,
    required this.title,
    required this.description,
    this.done = false,
    this.employeeId = 0,
  });

  final int id;
  final String title;
  final String description;
  final bool done;
  final int employeeId;

  Task copyWith({
    final int? id,
    final String? title,
    final String? description,
    final bool? done,
    final int? employeeId,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      done: done ?? this.done,
      employeeId: employeeId ?? this.employeeId,
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      done: json['done'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != 0) 'id': id,
      'title': title,
      'description': description,
      'done': done,
      'employee': {
        'id': employeeId,
      }
    };
  }
}
