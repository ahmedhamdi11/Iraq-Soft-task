import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/core/widgets/default_button.dart';
import 'package:todo_app/core/widgets/default_text_field.dart';
import 'package:todo_app/features/Auth/presentation/controller/sign_up_cubit/sign_up_cubit.dart';
import 'package:todo_app/features/Auth/presentation/widgets/country_code_picker.dart';
import 'package:todo_app/features/Auth/presentation/widgets/experience_level_selector.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

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
              onChanged: (v) => cubit.displayName = v,
              hintText: 'Name...',
            ),

            SizedBox(height: 15.h),

            // phone number
            DefaultTextField(
              onChanged: (v) => cubit.phone = v,
              hintText: '123 456-7890',
              keyboardType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(15)],
              prefix: CustomCountryCodePicker(
                onChanged: (c) => cubit.countryCode = c.dialCode ?? '+20',
              ),
            ),

            SizedBox(height: 15.h),

            // years of experience field
            DefaultTextField(
              onChanged: (v) => cubit.experienceYears = int.parse(v),
              hintText: 'Years of experience...',
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(2),
              ],
            ),

            SizedBox(height: 15.h),

            // experience level
            const ExperienceLevelSelector(),

            SizedBox(height: 15.h),

            // address field
            DefaultTextField(
              onChanged: (v) => cubit.address = v,
              hintText: 'Address...',
            ),

            SizedBox(height: 15.h),

            // password field
            BlocBuilder<SignUpCubit, SignUpState>(
              buildWhen: (p, c) => c is TogglePasswordVisibility,
              builder: (context, state) {
                return DefaultTextField(
                  onChanged: (v) => cubit.password = v,
                  hintText: 'Password...',
                  isHiddenPassword: !cubit.isVisiblePassword,
                  suffix: IconButton(
                    onPressed: () => cubit.togglePasswordVisibility(),
                    icon: Icon(
                      cubit.isVisiblePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 24.r,
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: 24.h),

            // sign up button
            DefaultButton(
              onPressed: () => cubit.signUp(),
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
