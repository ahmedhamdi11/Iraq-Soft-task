import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/functions.dart';
import 'package:todo_app/features/Auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:todo_app/features/Auth/presentation/widgets/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (p, c) =>
          c is LoginFailure || c is LoginLoading || c is LoginSuccess,
      listener: (context, state) {
        if (state is LoginLoading) {
          EasyLoading.show();
        } else if (state is LoginFailure) {
          _onLoginFailure(state.errMessage);
        } else if (state is LoginSuccess) {
          _onLoginSuccess();
        }
      },
      child: Scaffold(
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
      ),
    );
  }

  void _onLoginSuccess() {
    EasyLoading.dismiss();
  }

  void _onLoginFailure(String errMessage) {
    EasyLoading.dismiss();
    showToastMessage(errMessage);
  }
}
