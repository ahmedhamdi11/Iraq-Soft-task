import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/core/utils/enums.dart';
import 'package:todo_app/features/home/presentation/manager/cubits/create_task_cubit/create_task_cubit.dart';

class StatusSelector extends StatefulWidget {
  const StatusSelector({super.key});

  @override
  State<StatusSelector> createState() => _StatusSelectorState();
}

class _StatusSelectorState extends State<StatusSelector> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateTaskCubit>();

    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: ExpansionTile(
        title: Text(
          'Task Status',
          style: AppStyles.text16.copyWith(color: kPrimaryColor),
        ),
        collapsedBackgroundColor: const Color(0xffF0ECFF),
        backgroundColor: const Color(0xffF0ECFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        children: [
          for (int i = 0; i < TaskStatusEnum.values.length; i++)
            RadioListTile(
              value: cubit.status == TaskStatusEnum.values[i],
              title: Text(
                TaskStatusEnum.values[i].name,
                style: AppStyles.text16.copyWith(color: kPrimaryColor),
              ),
              groupValue: true,
              onChanged: (_) {
                setState(() {
                  cubit.status = TaskStatusEnum.values[i];
                });
              },
            ),
        ],
      ),
    );
  }
}
