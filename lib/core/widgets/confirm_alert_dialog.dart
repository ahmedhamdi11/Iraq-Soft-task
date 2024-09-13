import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/core/widgets/default_button.dart';

class ConfirmAlertDialog extends StatelessWidget {
  const ConfirmAlertDialog({
    super.key,
    required this.onConfirm,
    required this.message,
  });

  final Function() onConfirm;
  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 40).w,
      actionsPadding: const EdgeInsets.all(20).r,

      // content
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16.h),
          Icon(
            Icons.error_outline,
            size: 30.r,
            color: kPrimaryColor,
          ),
          SizedBox(height: 4.h),
          Text(
            message,
            textAlign: TextAlign.center,
            style: AppStyles.text19.copyWith(
              color: kBlackColor,
            ),
          ),
          SizedBox(height: 8.h),
        ],
      ),

      // actions
      actions: [
        Row(
          children: [
            // cancel button
            Flexible(
              child: DefaultButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                width: 150.w,
                btnColor: kCardColor,
                btnTextColor: kPrimaryColor,
                btnText: "Cancel",
              ),
            ),
            const SizedBox(width: 12),

            // confirm button
            DefaultButton(
              onPressed: onConfirm,
              width: 100.w,
              btnText: "Confirm",
            ),
          ],
        ),
      ],
    );
  }
}
