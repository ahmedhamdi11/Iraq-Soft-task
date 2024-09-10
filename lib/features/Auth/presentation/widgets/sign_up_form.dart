import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/core/widgets/default_button.dart';
import 'package:todo_app/core/widgets/default_text_field.dart';
import 'package:todo_app/features/Auth/presentation/widgets/country_code_picker.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding).w,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 0.22.sh),
            // title
            Text(
              'Sign up',
              style: AppStyles.text24,
            ),

            SizedBox(height: 24.h),

            // name field
            DefaultTextField(
              onChanged: (v) {},
              hintText: 'Name...',
            ),

            SizedBox(height: 15.h),

            // phone number
            DefaultTextField(
              onChanged: (v) {},
              hintText: '123 456-7890',
              keyboardType: TextInputType.number,
              prefix: CustomCountryCodePicker(
                onChanged: (c) {},
              ),
            ),

            SizedBox(height: 15.h),

            // years of experience field
            DefaultTextField(
              onChanged: (v) {},
              hintText: 'Years of experience...',
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 15.h),

            // years of experience field
            DefaultTextField(
              onChanged: (v) {},
              hintText: 'Years of experience...',
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 15.h),

            // address field
            DefaultTextField(
              onChanged: (v) {},
              hintText: 'Address...',
            ),

            SizedBox(height: 15.h),

            // password field
            DefaultTextField(
              onChanged: (v) {},
              hintText: 'Password...',
              isHiddenPassword: true,
              suffix: Icon(
                Icons.visibility_outlined,
                size: 24.r,
              ),
            ),

            SizedBox(height: 24.h),

            // sign up button
            DefaultButton(
              onPressed: () {},
              btnText: 'Sign up',
            ),

            SizedBox(height: 12.h),

            // go back to sign in button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    'Already have any account?',
                    style: AppStyles.text14,
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Sign in',
                    style: AppStyles.text14.copyWith(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 14.h),
          ],
        ),
      ),
    );
  }
}
