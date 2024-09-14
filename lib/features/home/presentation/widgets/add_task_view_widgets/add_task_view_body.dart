import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/core/widgets/default_button.dart';
import 'package:todo_app/core/widgets/default_text_field.dart';
import 'package:todo_app/features/home/presentation/widgets/add_task_view_widgets/image_section.dart';
import 'package:todo_app/features/home/presentation/widgets/add_task_view_widgets/priority_selector.dart';
import 'package:todo_app/features/home/presentation/widgets/add_task_view_widgets/task_status_selector.dart';

class AddTaskViewBody extends StatelessWidget {
  const AddTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding).w,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 20),

                  // task image
                  ImageSection(),

                  SizedBox(height: 16.h),

                  // task title
                  Text(
                    'Task title',
                    style: AppStyles.text12.copyWith(
                      color: kSecondaryColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  const DefaultTextField(
                    hintText: 'Enter title here...',
                  ),

                  SizedBox(height: 16.h),

                  // task desc
                  Text(
                    'Task Description',
                    style: AppStyles.text12.copyWith(
                      color: kSecondaryColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  const DefaultTextField(
                    hintText: 'Enter description here...',
                    maxLines: 5,
                  ),

                  SizedBox(height: 16.h),

                  // priority
                  Text(
                    'Priority',
                    style: AppStyles.text12.copyWith(
                      color: kSecondaryColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  const PrioritySelector(),

                  SizedBox(height: 16.h),

                  // status
                  Text(
                    'Status',
                    style: AppStyles.text12.copyWith(
                      color: kSecondaryColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  const StatusSelector(),

                  SizedBox(height: 16.h),
                ],
              ),
            ),

            // button
            DefaultButton(
              onPressed: () {},
              btnText: 'Add task',
            ),

            SizedBox(height: 35.h),
          ],
        ),
      ),
    );
  }
}
