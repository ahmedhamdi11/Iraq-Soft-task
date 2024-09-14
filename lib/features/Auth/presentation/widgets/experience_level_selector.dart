import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/core/utils/enums.dart';
import 'package:todo_app/features/Auth/presentation/controller/sign_up_cubit/sign_up_cubit.dart';

class ExperienceLevelSelector extends StatefulWidget {
  const ExperienceLevelSelector({super.key});

  @override
  State<ExperienceLevelSelector> createState() =>
      _ExperienceLevelSelectorState();
}

class _ExperienceLevelSelectorState extends State<ExperienceLevelSelector> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: ExpansionTile(
        minTileHeight: 50.h,
        title: Text(
          'Choose experience Level',
          style: AppStyles.text14.copyWith(
            color: kBlackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        collapsedBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
          side: const BorderSide(color: kStrokeColor),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
          side: const BorderSide(color: kStrokeColor),
        ),
        children: [
          for (int i = 0; i < ExperienceLevelEnum.values.length; i++)
            RadioListTile(
              dense: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              value: context.read<SignUpCubit>().level ==
                  ExperienceLevelEnum.values[i],
              title: Text(
                ExperienceLevelEnum.values[i].name,
                style: AppStyles.text14.copyWith(
                  color: kBlackColor,
                ),
              ),
              groupValue: true,
              onChanged: (v) => _onLevelChanged(i),
            ),
        ],
      ),
    );
  }

  void _onLevelChanged(int index) {
    context.read<SignUpCubit>().level = ExperienceLevelEnum.values[index];
    setState(() {});
  }
}
