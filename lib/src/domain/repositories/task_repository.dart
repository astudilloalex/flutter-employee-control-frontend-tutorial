import 'package:employees_control/src/domain/entities/task.dart';
import 'package:employees_control/src/domain/responses/task_response.dart';

abstract class TaskRepository {
  const TaskRepository();

  Future<TaskResponse> addTask(final Task task);
  Future<TaskResponse> get all;
  Future<TaskResponse> taskDone(final Task task);
  Future<TaskResponse> taskByEmployee(final int employeeId);
}
