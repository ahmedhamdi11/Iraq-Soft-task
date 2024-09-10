import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/Auth/presentation/widgets/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // background image
            Image.asset(
              'assets/images/onboarding_image.png',
              fit: BoxFit.cover,
              width: 1.sw,
            ),

            // onboarding details
            const Align(
              alignment: Alignment.bottomCenter,
              child: LoginForm(),
            ),
          ],
        ),
      ),
    );
  }
}
