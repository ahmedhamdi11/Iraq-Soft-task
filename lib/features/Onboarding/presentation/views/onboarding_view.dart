import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/Onboarding/presentation/widgets/onboarding_details.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // background image
            Image.asset(
              'assets/images/onboarding_image.png',
              width: 1.sw,
            ),

            // onboarding details
            const Align(
              alignment: Alignment.bottomCenter,
              child: OnboardingDetails(),
            ),
          ],
        ),
      ),
    );
  }
}
