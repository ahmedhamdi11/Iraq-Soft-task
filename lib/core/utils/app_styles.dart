import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';

abstract class AppStyles {
  static TextStyle text12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle text14 = TextStyle(
    fontSize: 14.sp,
    color: kSecondaryColor,
    fontWeight: FontWeight.w400,
  );
  static TextStyle text16 = TextStyle(
    fontSize: 16.sp,
    color: kBlackColor,
    fontWeight: FontWeight.w700,
  );
  static TextStyle text19 = TextStyle(
    fontSize: 19.sp,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );
  static TextStyle text24 = TextStyle(
    fontSize: 24.sp,
    color: kBlackColor,
    fontWeight: FontWeight.w700,
  );
}
