import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/core/services/service_locator.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/core/widgets/default_button.dart';

class OnboardingDetails extends StatelessWidget {
  const OnboardingDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding).w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // title
          Text(
            'Task Management &\nTo-Do List',
            textAlign: TextAlign.center,
            style: AppStyles.text24,
          ),

          SizedBox(height: 16.h),

          // desc
          Text(
            'This productive tool is designed to help\nyou better manage your task\n project-wise conveniently!',
            textAlign: TextAlign.center,
            style: AppStyles.text14,
          ),

          SizedBox(height: 32.h),

          // get started button
          DefaultButton(
            onPressed: () => _onGetStartedButtonPressed(context),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Let\'s Start',
                  textAlign: TextAlign.center,
                  style: AppStyles.text19,
                ),
                const SizedBox(width: 8),
                Image.asset(
                  'assets/icons/Arrow-Left.png',
                  width: 24.r,
                  height: 24.r,
                ),
              ],
            ),
          ),

          SizedBox(height: 74.h),
        ],
      ),
    );
  }

  void _onGetStartedButtonPressed(BuildContext context) {
    // save the onboarding state in the shared prefs
    sl<SharedPreferences>().setBool(kOnBoardingPrefsKey, true);

    // navigate to the login view
    Navigator.pushReplacementNamed(
      context,
      AppRouter.loginView,
    );
  }
}
