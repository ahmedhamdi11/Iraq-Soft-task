import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 12.w),
      child: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Transform.flip(
          flipX: true,
          child: Image.asset(
            'assets/icons/Arrow-Left.png',
            color: kBlackColor,
            height: 22.h,
          ),
        ),
      ),
    );
  }
}
