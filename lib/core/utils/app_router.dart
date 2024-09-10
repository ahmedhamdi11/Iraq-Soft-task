import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/custom_page_route_builder.dart';
import 'package:todo_app/features/Auth/presentation/views/login_view.dart';
import 'package:todo_app/features/Onboarding/presentation/views/onboarding_view.dart';

abstract class AppRouter {
  // routes names
  static const onBoardingView = '/onBoardingView';
  static const loginView = '/loginView';

  /// This function is responsible for generating routes based on the route settings.
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // onboarding view route
      case '/':
        // This route leads to the OnBoardingView
        return CustomPageRouteBuilder(
          page: const OnboardingView(),
        );

      // login view route
      case loginView:
        // This route leads to the OnBoardingView
        return CustomPageRouteBuilder(
          page: const LoginView(),
        );

      default:
        // If the route is not found, return null.
        return null;
    }
  }
}
