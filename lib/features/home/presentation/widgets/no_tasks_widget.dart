import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';

class NoTasksWidget extends StatelessWidget {
  const NoTasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Animate(
            effects: const [
              SlideEffect(
                begin: Offset(5, 0),
                duration: Duration(milliseconds: 800),
                curve: Curves.fastLinearToSlowEaseIn,
              ),
              FadeEffect(),
            ],
            child: Icon(
              Icons.add_task_rounded,
              size: 50.r,
              color: kStrokeColor,
            ),
          ),
          const SizedBox(height: 8),
          Animate(
            effects: const [
              SlideEffect(
                begin: Offset(0, 5),
                duration: Duration(milliseconds: 800),
                curve: Curves.fastLinearToSlowEaseIn,
              ),
              FadeEffect(),
            ],
            child: Text(
              'No tasks yet\n start creating new tasks now!',
              style: AppStyles.text16.copyWith(
                color: kStrokeColor,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 60.h),
        ],
      ),
    );
  }
}
