import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';

class TaskOptionsMenu extends StatelessWidget {
  const TaskOptionsMenu({super.key});

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
          onTap: () {},
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
}
