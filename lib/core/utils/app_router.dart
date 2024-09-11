import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/services/service_locator.dart';
import 'package:todo_app/core/utils/custom_page_route_builder.dart';
import 'package:todo_app/features/Auth/data/repos/auth_repo.dart';
import 'package:todo_app/features/Auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:todo_app/features/Auth/presentation/controller/sign_up_cubit/sign_up_cubit.dart';
import 'package:todo_app/features/Auth/presentation/views/login_view.dart';
import 'package:todo_app/features/Auth/presentation/views/sign_up_view.dart';
import 'package:todo_app/features/Onboarding/presentation/views/onboarding_view.dart';
import 'package:todo_app/features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  // routes names
  static const onBoardingView = '/onBoardingView';
  static const loginView = '/loginView';
  static const signUpView = '/signUpView';
  static const homeView = '/homeView';

  /// This function is responsible for generating routes based on the route settings.
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // onboarding view route
      case onBoardingView:
        // This route leads to the OnBoardingView
        return CustomPageRouteBuilder(
          page: const OnboardingView(),
        );

      // login view route
      case loginView:
        // This route leads to the OnBoardingView
        return CustomPageRouteBuilder(
          page: BlocProvider(
            create: (context) => LoginCubit(sl<AuthRepo>()),
            child: const LoginView(),
          ),
        );

      // sign up view route
      case signUpView:
        // This route leads to the OnBoardingView
        return CustomPageRouteBuilder(
          transitionType: TransitionTypeEnum.bottomToTop,
          page: BlocProvider(
            create: (context) => SignUpCubit(sl<AuthRepo>()),
            child: const SignUpView(),
          ),
        );

      // home view route
      case homeView:
        // This route leads to the OnBoardingView
        return CustomPageRouteBuilder(
          page: const HomeView(),
        );

      default:
        // If the route is not found, return null.
        return null;
    }
  }
}
