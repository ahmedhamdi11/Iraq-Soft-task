import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';
import 'package:todo_app/features/home/presentation/widgets/task_details_view_widgets/task_creation_date_tile.dart';
import 'package:todo_app/features/home/presentation/widgets/task_details_view_widgets/task_priority_tile.dart';
import 'package:todo_app/features/home/presentation/widgets/task_details_view_widgets/task_status_tile.dart';

class TaskDetailsViewBody extends StatelessWidget {
  const TaskDetailsViewBody({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
        vertical: 20,
      ).w,
      children: [
        // task image
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: CachedNetworkImage(
            imageUrl: task.image,
            height: 225.h,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => Image.asset(
              'assets/icons/launcher_icon.png',
              fit: BoxFit.cover,
            ),
            placeholder: (context, url) => Image.asset(
              'assets/icons/launcher_icon.png',
              fit: BoxFit.cover,
            ),
          ),
        ),

        SizedBox(height: 16.h),

        // task title
        Text(
          task.title,
          style: AppStyles.text24,
          textAlign: TextAlign.center,
        ),

        SizedBox(height: 8.h),

        // task desc
        Text(
          task.desc,
          style: AppStyles.text14.copyWith(
            color: kBlackColor.withOpacity(0.6),
          ),
        ),

        SizedBox(height: 16.h),

        // task creation date
        TaskCreationDateTile(date: task.createdAt),

        // task status
        TaskStatusTile(taskStatus: task.status),

        // task priority
        TaskPriorityTile(priority: task.priority),
      ],
    );
  }
}
