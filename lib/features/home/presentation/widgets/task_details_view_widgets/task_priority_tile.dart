import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/core/utils/enums.dart';

class TaskPriorityTile extends StatelessWidget {
  const TaskPriorityTile({super.key, required this.priority});

  final TaskPriorityEnum priority;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      height: 50.h,
      padding: const EdgeInsetsDirectional.only(
        start: 24,
        end: 10,
        top: 7,
        bottom: 7,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffF0ECFF),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: AlignmentDirectional.centerStart,
        child: Row(
          children: [
            Icon(
              Icons.outlined_flag_rounded,
              size: 22.r,
              color: _getColor(),
            ),
            const SizedBox(width: 6),
            Text(
              '${_getName()} Priority',
              overflow: TextOverflow.ellipsis,
              style: AppStyles.text16.copyWith(
                color: _getColor(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColor() {
    switch (priority) {
      case TaskPriorityEnum.low:
        return kBlueColor;
      case TaskPriorityEnum.medium:
        return kPrimaryColor;
      case TaskPriorityEnum.high:
        return kOrangeColor;
    }
  }

  String _getName() {
    switch (priority) {
      case TaskPriorityEnum.low:
        return "Low";
      case TaskPriorityEnum.medium:
        return "Medium";
      case TaskPriorityEnum.high:
        return "Heigh";
    }
  }
}
