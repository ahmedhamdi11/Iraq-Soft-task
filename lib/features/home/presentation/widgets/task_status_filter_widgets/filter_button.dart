import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/core/utils/enums.dart';
import 'package:todo_app/features/home/presentation/manager/cubits/home_view_cubit/home_view_cubit.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    this.status,
  });

  final TaskStatusEnum? status;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeViewCubit>();

    return BlocBuilder<HomeViewCubit, HomeViewState>(
      buildWhen: (previous, current) => current is TasksFilterChanged,
      builder: (context, state) {
        return GestureDetector(
          onTap: () => cubit.changeStatusFilter(status),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            margin: EdgeInsetsDirectional.only(end: 8.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: cubit.selectedFilterStatus == status
                  ? kPrimaryColor
                  : const Color(0xffF0ECFF),
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Text(
              _getName(),
              style: AppStyles.text16.copyWith(
                fontWeight: cubit.selectedFilterStatus == status
                    ? FontWeight.w700
                    : FontWeight.w400,
                color: cubit.selectedFilterStatus == status
                    ? Colors.white
                    : const Color(0xff7C7C80),
              ),
            ),
          ),
        );
      },
    );
  }

  String _getName() {
    switch (status) {
      case TaskStatusEnum.inProgress:
        return "InProgress";
      case TaskStatusEnum.waiting:
        return "Waiting";
      case TaskStatusEnum.finished:
        return "Finished";

      default:
        return 'All';
    }
  }
}
