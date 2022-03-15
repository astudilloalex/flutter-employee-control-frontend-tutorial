import 'package:employees_control/src/data/http/base_http_client.dart';
import 'package:employees_control/src/data/http/url_paths.dart';
import 'package:employees_control/src/domain/entities/task.dart';
import 'package:employees_control/src/domain/repositories/task_repository.dart';
import 'package:employees_control/src/domain/responses/task_response.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class TaskHttp implements TaskRepository {
  const TaskHttp({
    this.baseHttpClient = const BaseHttpClient(),
  });

  final BaseHttpClient baseHttpClient;

  @override
  Future<TaskResponse> addTask(Task task) async {
    try {
      final http.Response response = await baseHttpClient.post(
        UrlPaths.addTask,
        request: task.toJson(),
      );
      return compute(taskResponseFromJson, response.body);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TaskResponse> get all async {
    try {
      final http.Response response = await baseHttpClient.get(
        UrlPaths.getMytasks,
      );
      return compute(taskResponseFromJson, response.body);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TaskResponse> taskDone(Task task) async {
    try {
      final http.Response response = await baseHttpClient.post(
        UrlPaths.taskDone,
        parameters: {'taskId': '${task.id}', 'done': '${task.done}'},
      );
      return compute(taskResponseFromJson, response.body);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TaskResponse> taskByEmployee(final int employeeId) async {
    try {
      final http.Response response = await baseHttpClient.get(
        UrlPaths.tasksByEmployee,
        {'employeeId': '$employeeId'},
      );
      return compute(taskResponseFromJson, response.body);
    } catch (e) {
      rethrow;
    }
  }
}
