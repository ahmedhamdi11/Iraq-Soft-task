import 'package:flutter/material.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';

class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
