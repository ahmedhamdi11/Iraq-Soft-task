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
  bool _isExpanded = false;
  late final ScrollController _scrollController;

  List<ExperienceLevel> experience = [
    ExperienceLevel.fresh,
    ExperienceLevel.junior,
    ExperienceLevel.midLevel,
    ExperienceLevel.senior,
  ];

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      borderRadius: BorderRadius.circular(12.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _isExpanded ? 200.h : 50.h,
        padding: EdgeInsets.only(
          left: 14,
          right: 14,
          bottom: _isExpanded ? 14 : 0,
        ).w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: kStrokeColor),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // header
            SizedBox(
              height: 48.h,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Choose experience Level',
                      style: AppStyles.text14.copyWith(
                        color: kBlackColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    size: 24.r,
                    color: kGreyColor,
                  ),
                ],
              ),
            ),

            // levels list
            if (_isExpanded)
              Expanded(
                child: Scrollbar(
                  controller: _scrollController,
                  thumbVisibility: true,
                  radius: const Radius.circular(10),
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: experience.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsetsDirectional.only(end: 20),
                      child: RadioListTile(
                        dense: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        value: context.read<SignUpCubit>().level ==
                            experience[index],
                        title: Text(
                          experience[index].name,
                          style: AppStyles.text14.copyWith(
                            color: kBlackColor,
                          ),
                        ),
                        groupValue: true,
                        onChanged: (v) => _onLevelChanged(index),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _onLevelChanged(int index) {
    context.read<SignUpCubit>().level = experience[index];
    setState(() {});
  }
}
