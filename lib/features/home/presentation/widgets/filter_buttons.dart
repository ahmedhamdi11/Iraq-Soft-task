import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';

class FilterButtons extends StatelessWidget {
  const FilterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      child: ListView.builder(
        itemCount: 4,
        padding: EdgeInsetsDirectional.only(start: 22.w, end: 14.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const FilterButton(),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      margin: EdgeInsetsDirectional.only(end: 8.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Text(
        'Inprogress',
        style: AppStyles.text16.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
