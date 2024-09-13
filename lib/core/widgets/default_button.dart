import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    this.onPressed,
    this.btnText = '',
    this.btnTextColor = Colors.white,
    this.width,
    this.height,
    this.radius,
    this.border,
    this.btnColor = kPrimaryColor,
    this.child,
  });

  final void Function()? onPressed;
  final String btnText;
  final Color btnTextColor;
  final Color btnColor;
  final double? width;
  final double? height;
  final double? radius;
  final BoxBorder? border;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(radius ?? 12.0.r),
      child: Ink(
        height: height ?? 50.h,
        width: width ?? 1.sw,
        decoration: BoxDecoration(
          border: border,
          color: btnColor,
          borderRadius: BorderRadius.circular(radius ?? 12.r),
        ),
        child: Align(
          alignment: Alignment.center,
          child: child ??
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    btnText,
                    style: AppStyles.text19.copyWith(
                      color: btnTextColor,
                    ),
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
