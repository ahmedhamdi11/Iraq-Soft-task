import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/core/widgets/default_back_button.dart';
import 'package:todo_app/features/home/presentation/widgets/add_task_view_widgets/add_task_view_body.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const AddTaskViewBody(),
      appBar: AppBar(
        leadingWidth: 65.w,
        leading: const DefaultBackButton(),
        title: Text(
          'Add new task',
          style: AppStyles.text16,
        ),
        titleSpacing: 4,
      ),
    );
  }
}
