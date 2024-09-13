import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/core/utils/enums.dart';
import 'package:todo_app/features/home/presentation/manager/cubits/home_view_cubit/home_view_cubit.dart';
import 'package:todo_app/features/home/presentation/widgets/task_status_filter_widgets/filter_button.dart';

class FilterButtons extends StatelessWidget {
  const FilterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewCubit, HomeViewState>(
      buildWhen: (previous, current) => current is TasksFilterChanged,
      builder: (context, state) {
        return SizedBox(
          height: 36.h,
          child: ListView.builder(
            itemCount: TaskStatusEnum.values.length + 1,
            padding: EdgeInsetsDirectional.only(
              start: kHorizontalPadding.w,
              end: 14.w,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const FilterButton(
                  status: null,
                );
              }
              return FilterButton(
                status: TaskStatusEnum.values[index - 1],
              );
            },
          ),
        );
      },
    );
  }
}
