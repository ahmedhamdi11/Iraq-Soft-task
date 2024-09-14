// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_app/core/constants/api_constants.dart';
import 'package:todo_app/core/utils/enums.dart';

class TaskModel {
  final String id;
  final String image;
  final String title;
  final String desc;
  final TaskPriorityEnum priority;
  final TaskStatusEnum status;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TaskModel({
    required this.id,
    required this.image,
    required this.title,
    required this.desc,
    required this.priority,
    required this.status,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    // assign the task status
    TaskStatusEnum taskStatus = TaskStatusEnum.waiting;
    if (json['status'] != null) {
      if (json['status'] == 'inProgress') {
        taskStatus = TaskStatusEnum.inProgress;
      } else if (json['status'] == 'finished') {
        taskStatus = TaskStatusEnum.finished;
      }
    }

    // assign the task priority
    TaskPriorityEnum taskPriority = TaskPriorityEnum.low;
    if (json['priority'] != null) {
      if (json['priority'] == 'medium') {
        taskPriority = TaskPriorityEnum.medium;
      } else if (json['priority'] == 'high') {
        taskPriority = TaskPriorityEnum.high;
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
      image: json['image'] != null ? "$kImagesBaseUrl${json['image']}" : '',
      title: json['title'],
      desc: json['desc'],
      priority: taskPriority,
      status: taskStatus,
      userId: json['user'],
      createdAt: createdAt,
      updatedAt: updatedAt ?? createdAt,
    );
  }
}
