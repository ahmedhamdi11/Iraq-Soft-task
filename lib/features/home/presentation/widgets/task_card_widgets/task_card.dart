import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';
import 'package:todo_app/features/home/presentation/widgets/task_card_widgets/task_priority.dart';
import 'package:todo_app/features/home/presentation/widgets/task_card_widgets/task_status_widget.dart';
import 'package:todo_app/features/home/presentation/widgets/task_options_menu.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 22.h),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.r),
        onTap: () => Navigator.pushNamed(
          context,
          AppRouter.taskDetailsView,
          arguments: task,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0).w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // task image
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CachedNetworkImage(
                  imageUrl: task.image,
                  height: 64.h,
                  width: 64.h,
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/icons/launcher_icon.png'),
                  placeholder: (context, url) =>
                      Image.asset('assets/icons/launcher_icon.png'),
                ),
              ),

              SizedBox(width: 12.w),

              // task details (title, desc, priority, status, date)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // title
                        Expanded(
                          child: Text(
                            task.title,
                            style: AppStyles.text16,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        SizedBox(width: 8.w),

                        // task status
                        TaskStatusWidget(taskStatus: task.status)
                      ],
                    ),

                    SizedBox(height: 4.h),

                    // task desc
                    Text(
                      task.desc,
                      style: AppStyles.text14.copyWith(
                        color: kBlackColor.withOpacity(0.6),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: 4.h),

                    // task priority and date
                    Row(
                      children: [
                        // priority
                        TaskPriority(
                          priority: task.priority,
                        ),

                        // date
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: AlignmentDirectional.centerEnd,
                            child: Text(
                              DateFormat.yMd().format(task.createdAt),
                              style: AppStyles.text12.copyWith(
                                color: kBlackColor.withOpacity(0.6),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(width: 4.w),

              // options icon button
              TaskOptionsMenu(task: task),
            ],
          ),
        ),
      ),
    );
  }
}
