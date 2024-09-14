import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/core/utils/functions.dart';
import 'package:todo_app/core/widgets/default_back_button.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';
import 'package:todo_app/features/home/presentation/manager/cubits/create_task_cubit/create_task_cubit.dart';
import 'package:todo_app/features/home/presentation/manager/cubits/home_view_cubit/home_view_cubit.dart';
import 'package:todo_app/features/home/presentation/widgets/create_edit_task_widgets/add_task_view_body.dart';

class CreateEditTaskView extends StatefulWidget {
  const CreateEditTaskView({super.key, this.task});

  final TaskModel? task;

  @override
  State<CreateEditTaskView> createState() => _CreateEditTaskViewState();
}

class _CreateEditTaskViewState extends State<CreateEditTaskView> {
  @override
  void initState() {
    final cubit = context.read<CreateOrEditTaskCubit>();

    // set the initial data if user try to edit existing
    if (widget.task != null) {
      cubit.desc = widget.task!.desc;
      cubit.title = widget.task!.title;
      cubit.priority = widget.task!.priority;
      cubit.status = widget.task!.status;
      cubit.imagePath = widget.task!.image;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateOrEditTaskCubit, CreateOrEditTaskState>(
      listener: (context, state) {
        if (state is CreateOrEditTaskLoading) {
          EasyLoading.show();
        } else if (state is CreateOrEditTaskFailure) {
          _onCreateFailure(state.errMessage);
        } else if (state is CreateOrEditTaskSuccess) {
          _onCreateSuccess(context);
        }
      },
      child: Scaffold(
        body: CreateEditTaskViewBody(task: widget.task),
        appBar: AppBar(
          leadingWidth: 65.w,
          leading: const DefaultBackButton(),
          title: Text(
            widget.task != null ? 'Edit Task' : 'Add new task',
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
    showToastMessage(widget.task != null ? "Task Edited" : 'Task Created');

    // refresh the tasks list and pop the create task view
    context.read<HomeViewCubit>().refreshTasks();
    Navigator.pop(context);
  }
}
