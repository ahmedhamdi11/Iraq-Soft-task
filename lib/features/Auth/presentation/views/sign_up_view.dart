import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/Auth/presentation/widgets/sign_up_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // background image
            Image.asset(
              'assets/images/bacground_colors.png',
              fit: BoxFit.fitWidth,
              width: 1.sw,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20).h,
              child: Image.asset(
                'assets/images/ART.png',
                width: 1.sw,
                height: 0.25.sh,
              ),
            ),

            // onboarding details
            const Align(
              alignment: Alignment.bottomCenter,
              child: SignUpForm(),
            ),
          ],
        ),
      ),
    );
  }
}
