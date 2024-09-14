import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/utils/app_router.dart';

class FloatingActionButtons extends StatelessWidget {
  const FloatingActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // scanner button
        if (Platform.isAndroid)
          SizedBox(
            height: 50.r,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  AppRouter.scannerView,
                ),
                heroTag: 'scan',
                elevation: 0,
                backgroundColor: kCardColor,
                shape: const CircleBorder(),
                child: Image.asset(
                  "assets/icons/qr_code_icon.png",
                  width: 24.r,
                ),
              ),
            ),
          ),

        SizedBox(height: 14.h),

        // add task button
        SizedBox(
          width: 64.r,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () => Navigator.pushNamed(
                context,
                AppRouter.createEditTaskView,
              ),
              heroTag: 'add',
              shape: const CircleBorder(),
              backgroundColor: kPrimaryColor,
              child: Icon(
                Icons.add,
                size: 32.r,
                color: Colors.white,
              ),
            ),
          ),
        ),

        SizedBox(height: 14.h),
      ],
    );
  }
}
