import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/core/utils/enums.dart';
import 'package:todo_app/features/home/presentation/manager/cubits/create_task_cubit/create_task_cubit.dart';

class PrioritySelector extends StatefulWidget {
  const PrioritySelector({super.key});

  @override
  State<PrioritySelector> createState() => _PrioritySelectorState();
}

class _PrioritySelectorState extends State<PrioritySelector> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateOrEditTaskCubit>();

    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: ExpansionTile(
        title: Text(
          'Priority',
          style: AppStyles.text16.copyWith(color: kPrimaryColor),
        ),
        leading: const Icon(
          Icons.flag_outlined,
          color: kPrimaryColor,
        ),
        collapsedBackgroundColor: const Color(0xffF0ECFF),
        backgroundColor: const Color(0xffF0ECFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        children: [
          for (int i = 0; i < TaskPriorityEnum.values.length; i++)
            RadioListTile(
              value: cubit.priority == TaskPriorityEnum.values[i],
              title: Text(
                TaskPriorityEnum.values[i].name,
                style: AppStyles.text16.copyWith(color: kPrimaryColor),
              ),
              groupValue: true,
              onChanged: (_) {
                setState(() {
                  cubit.priority = TaskPriorityEnum.values[i];
                });
              },
            ),
        ],
      ),
    );
  }
}
