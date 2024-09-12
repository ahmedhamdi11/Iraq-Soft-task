import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/core/utils/enums.dart';
import 'package:todo_app/features/home/data/models/task_status.dart';

class TaskStatusWidget extends StatelessWidget {
  const TaskStatusWidget({
    super.key,
    required this.taskStatus,
  });

  final TaskStatusModel taskStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4).w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: (_getNameColor()).withOpacity(0.15),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Text(
        taskStatus.name,
        style: AppStyles.text12.copyWith(
          color: _getNameColor(),
        ),
      ),
    );
  }

  Color _getNameColor() {
    switch (taskStatus.type) {
      case TaskStatusType.inProgress:
        return kPrimaryColor;
      case TaskStatusType.waiting:
        return kOrangeColor;
      case TaskStatusType.finished:
        return kBlueColor;
    }
  }
}
