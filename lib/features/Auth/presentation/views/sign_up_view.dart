import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/functions.dart';
import 'package:todo_app/features/Auth/presentation/controller/sign_up_cubit/sign_up_cubit.dart';
import 'package:todo_app/features/Auth/presentation/widgets/sign_up_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (p, c) =>
          c is SignUpFailure || c is SignUpLoading || c is SignUpSuccess,
      listener: (context, state) {
        if (state is SignUpLoading) {
          EasyLoading.show();
        } else if (state is SignUpFailure) {
          _onSignUpFailure(state.errMessage);
        } else if (state is SignUpSuccess) {
          _onSignUpSuccess();
        }
      },
      child: Scaffold(
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
      ),
    );
  }

  void _onSignUpSuccess() {
    EasyLoading.dismiss();
  }

  void _onSignUpFailure(String errMessage) {
    EasyLoading.dismiss();
    showToastMessage(errMessage);
  }
}
