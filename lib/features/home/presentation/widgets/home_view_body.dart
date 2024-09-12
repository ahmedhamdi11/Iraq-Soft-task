import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/features/home/presentation/widgets/filter_buttons.dart';
import 'package:todo_app/features/home/presentation/widgets/tasks_listview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: 22.w,
            bottom: 16.h,
            top: 24.h,
          ),
          child: Text(
            'My Tasks',
            style: AppStyles.text16.copyWith(
              color: kBlackColor.withOpacity(0.6),
            ),
          ),
        ),

        // filter buttons
        const FilterButtons(),

        SizedBox(height: 24.h),

        // tasks list
        const TasksListview(),
      ],
    );
  }
}
