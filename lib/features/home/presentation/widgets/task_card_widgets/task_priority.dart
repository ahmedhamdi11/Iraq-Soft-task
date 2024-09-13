import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/core/utils/enums.dart';

class TaskPriority extends StatelessWidget {
  const TaskPriority({
    super.key,
    required this.priority,
  });

  final TaskPriorityEnum priority;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.outlined_flag_rounded,
          size: 16.r,
          color: _getColor(),
        ),
        const SizedBox(width: 4),
        Text(
          priority.name,
          style: AppStyles.text12.copyWith(
            color: _getColor(),
          ),
        ),
      ],
    );
  }

  Color _getColor() {
    switch (priority) {
      case TaskPriorityEnum.low:
        return kBlueColor;
      case TaskPriorityEnum.medium:
        return kPrimaryColor;
      case TaskPriorityEnum.heigh:
        return kOrangeColor;
    }
  }
}
