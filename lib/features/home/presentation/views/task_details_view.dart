import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/core/widgets/default_back_button.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';
import 'package:todo_app/features/home/presentation/widgets/task_details_view_widgets/task_details_view_body.dart';
import 'package:todo_app/features/home/presentation/widgets/task_options_menu.dart';

class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({
    super.key,
    required this.task,
    this.showOptions = true,
  });

  final TaskModel task;
  final bool showOptions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildDetailsAppBar(),
      body: TaskDetailsViewBody(task: task),
    );
  }

  AppBar _buildDetailsAppBar() {
    return AppBar(
      leadingWidth: 65.w,
      leading: const DefaultBackButton(),
      actions: [
        if (showOptions)
          TaskOptionsMenu(
            task: task,
            inDetailsView: true,
          ),
        if (showOptions) SizedBox(width: 12.w)
      ],
      title: Text(
        'Task Details',
        style: AppStyles.text16,
      ),
      titleSpacing: 4,
    );
  }
}
