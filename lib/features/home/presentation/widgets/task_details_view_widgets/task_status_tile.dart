import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/core/utils/enums.dart';

class TaskStatusTile extends StatelessWidget {
  const TaskStatusTile({
    super.key,
    required this.taskStatus,
  });

  final TaskStatusEnum taskStatus;

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
        child: Text(
          _getName(),
          overflow: TextOverflow.ellipsis,
          style: AppStyles.text16.copyWith(
            color: _getColor(),
          ),
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
