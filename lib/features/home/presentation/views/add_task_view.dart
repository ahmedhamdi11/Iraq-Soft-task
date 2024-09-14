import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/core/utils/functions.dart';
import 'package:todo_app/core/widgets/default_back_button.dart';
import 'package:todo_app/features/home/presentation/manager/cubits/create_task_cubit/create_task_cubit.dart';
import 'package:todo_app/features/home/presentation/manager/cubits/home_view_cubit/home_view_cubit.dart';
import 'package:todo_app/features/home/presentation/widgets/add_task_view_widgets/add_task_view_body.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateTaskCubit, CreateTaskState>(
      listener: (context, state) {
        if (state is CreateTaskLoading) {
          EasyLoading.show();
        } else if (state is CreateTaskFailure) {
          _onCreateFailure(state.errMessage);
        } else if (state is CreateTaskSuccess) {
          _onCreateSuccess(context);
        }
      },
      child: Scaffold(
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
      ),
    );
  }

  void _onCreateFailure(String errMessage) {
    EasyLoading.dismiss();
    showToastMessage(errMessage);
  }

  void _onCreateSuccess(BuildContext context) {
    EasyLoading.dismiss();
    showToastMessage('Task Created');

    // refresh the tasks list and pop the create task view
    context.read<HomeViewCubit>().refreshTasks();
    Navigator.pop(context);
  }
}
