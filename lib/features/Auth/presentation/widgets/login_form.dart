import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/core/widgets/default_button.dart';
import 'package:todo_app/core/widgets/default_text_field.dart';
import 'package:todo_app/features/Auth/presentation/widgets/country_code_picker.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding).w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          Text(
            'Login',
            style: AppStyles.text24,
          ),

          SizedBox(height: 24.h),

          // phone number
          DefaultTextField(
            onChanged: (v) {},
            hintText: '123 456-7890',
            keyboardType: TextInputType.number,
            prefix: CustomCountryCodePicker(
              onChanged: (c) {},
            ),
          ),

          SizedBox(height: 20.h),

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

          // login button
          DefaultButton(
            onPressed: () {},
            btnText: 'Sign In',
          ),

          SizedBox(height: 12.h),

          // sign up button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  'Didn\'t have any account?',
                  style: AppStyles.text14,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Sign Up here',
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
    );
  }
}
