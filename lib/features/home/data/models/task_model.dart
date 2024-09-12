// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_app/core/utils/enums.dart';

class TaskModel {
  final String id;
  final String image;
  final String title;
  final String desc;
  final TaskPriorityType priority;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TaskModel({
    required this.id,
    required this.image,
    required this.title,
    required this.desc,
    required this.priority,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    // assign the task priority
    TaskPriorityType taskPriority = TaskPriorityType.low;
    if (json['priority'] != null) {
      if (json['priority'] == 'medium') {
        taskPriority = TaskPriorityType.medium;
      } else if (json['priority'] == 'high') {
        taskPriority = TaskPriorityType.heigh;
      }
    }

    // assign the task dates
    late DateTime createdAt;
    DateTime? updatedAt;
    if (json['createdAt'] != null) {
      createdAt = DateTime.parse(json['createdAt']).toLocal();
    }
    if (json['updatedAt'] != null) {
      updatedAt = DateTime.parse(json['updatedAt']).toLocal();
    }

    return TaskModel(
      id: json['_id'],
      image: json['image'],
      title: json['title'],
      desc: json['desc'],
      priority: taskPriority,
      userId: json['user'],
      createdAt: createdAt,
      updatedAt: updatedAt ?? createdAt,
    );
  }
}
