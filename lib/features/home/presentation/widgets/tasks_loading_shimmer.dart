import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:todo_app/core/utils/enums.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';
import 'package:todo_app/features/home/presentation/widgets/task_card_widgets/task_card.dart';

class TasksLoadingShimmer extends StatelessWidget {
  const TasksLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView.builder(
        itemCount: 10,
        padding: const EdgeInsets.only(bottom: 130).h,
        itemBuilder: (context, index) => TaskCard(
          task: TaskModel(
            id: "",
            image: 'image',
            title: 'title ' * 2,
            desc: 'desc ddddd dd dddd ddddd',
            priority: TaskPriorityEnum.low,
            status: TaskStatusEnum.inProgress,
            userId: 'userId',
            createdAt: DateTime(2024),
            updatedAt: DateTime(2024),
          ),
        ),
      ),
    );
  }
}
