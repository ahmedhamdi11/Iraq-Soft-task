import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/core/utils/enums.dart';

class TaskStatusWidget extends StatelessWidget {
  const TaskStatusWidget({
    super.key,
    required this.taskStatus,
  });

  final TaskStatusEnum taskStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4).w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: (_getColor()).withOpacity(0.15),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Text(
        _getName(),
        style: AppStyles.text12.copyWith(
          color: _getColor(),
        ),
      ),
    );
  }

  Color _getColor() {
    switch (taskStatus) {
      case TaskStatusEnum.inProgress:
        return kPrimaryColor;
      case TaskStatusEnum.waiting:
        return kOrangeColor;
      case TaskStatusEnum.finished:
        return kBlueColor;
    }
  }

  String _getName() {
    switch (taskStatus) {
      case TaskStatusEnum.inProgress:
        return "InProgress";
      case TaskStatusEnum.waiting:
        return "Waiting";
      case TaskStatusEnum.finished:
        return "Finished";
    }
  }
}
