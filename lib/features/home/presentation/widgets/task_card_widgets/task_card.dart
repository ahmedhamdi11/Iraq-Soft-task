import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/core/utils/enums.dart';
import 'package:todo_app/features/home/data/models/task_status.dart';
import 'package:todo_app/features/home/presentation/widgets/task_card_widgets/task_priority.dart';
import 'package:todo_app/features/home/presentation/widgets/task_card_widgets/task_status_widget.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 22.w, right: 22.w, bottom: 24.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // task image
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(
              imageUrl: 'imageUrl',
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
              children: [
                Row(
                  children: [
                    // title
                    Expanded(
                      child: Text(
                        'Grocery Shopping' * 4,
                        style: AppStyles.text16,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    SizedBox(width: 8.w),

                    // task status
                    const TaskStatusWidget(
                      taskStatus: TaskStatusModel(
                        name: "Waiting",
                        type: TaskStatusType.waiting,
                      ),
                    )
                  ],
                ),

                SizedBox(height: 4.h),

                // task desc
                Text(
                  'Grocery Shopping' * 4,
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
                    const TaskPriority(
                      priority: TaskPriorityType.low,
                    ),

                    // date
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          '30/12/2022',
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
          IconButton(
            onPressed: () {},
            iconSize: 24.r,
            icon: const Icon(
              Icons.more_vert_rounded,
              color: kBlackColor,
            ),
          )
        ],
      ),
    );
  }
}
