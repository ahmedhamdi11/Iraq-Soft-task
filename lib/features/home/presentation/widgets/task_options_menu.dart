import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/core/utils/functions.dart';
import 'package:todo_app/core/widgets/confirm_alert_dialog.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';
import 'package:todo_app/features/home/presentation/manager/cubits/home_view_cubit/home_view_cubit.dart';

class TaskOptionsMenu extends StatelessWidget {
  const TaskOptionsMenu({
    super.key,
    required this.task,
    this.inDetailsView = false,
  });

  final TaskModel task;
  final bool inDetailsView;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      iconColor: kBlackColor,
      position: PopupMenuPosition.under,
      clipBehavior: Clip.hardEdge,
      color: Colors.white,
      offset: Offset(-20.w, 6.h),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      icon: Icon(
        Icons.more_vert_rounded,
        color: kBlackColor,
        size: 24.r,
      ),
      itemBuilder: (context) => [
        // edit
        PopupMenuItem(
          onTap: () {},
          labelTextStyle: WidgetStatePropertyAll(
            AppStyles.text16.copyWith(
              color: kBlackColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          child: Text(
            'Edit',
            style: AppStyles.text16.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        // delete
        PopupMenuItem(
          onTap: () => _onDeletePressed(context, taskId: task.id),
          labelTextStyle: WidgetStatePropertyAll(
            AppStyles.text16.copyWith(
              color: kBlackColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          child: Text(
            'Delete',
            style: AppStyles.text16.copyWith(
              fontWeight: FontWeight.w500,
              color: kOrangeColor,
            ),
          ),
        ),
      ],
    );
  }

  void _onDeletePressed(
    BuildContext context, {
    required String taskId,
  }) {
    showDialog(
      context: context,
      builder: (context) => BlocListener<HomeViewCubit, HomeViewState>(
        listener: (context, state) {
          if (state is DeleteTasksLoading) {
            EasyLoading.show();
          } else if (state is DeleteTasksFailure) {
            EasyLoading.dismiss();
            showToastMessage(state.errMessage);
          } else if (state is DeleteTasksSuccess) {
            EasyLoading.dismiss();
            showToastMessage(state.successMessage);
            Navigator.pop(context);

            // pop the details view if task deleted from it
            if (inDetailsView) {
              Navigator.pop(context);
            }
          }
        },
        child: ConfirmAlertDialog(
          onConfirm: () => context.read<HomeViewCubit>().deleteTask(taskId),
          message: "Are you sure you want to delete this task?",
        ),
      ),
    );
  }
}
