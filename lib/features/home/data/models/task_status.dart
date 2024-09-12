import 'package:todo_app/core/utils/enums.dart';

class TaskStatusModel {
  final String name;
  final TaskStatusType type;

  const TaskStatusModel({
    required this.name,
    required this.type,
  });
}
