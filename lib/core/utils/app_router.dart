import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/services/service_locator.dart';
import 'package:todo_app/core/utils/custom_page_route_builder.dart';
import 'package:todo_app/features/Auth/data/repos/auth_repo.dart';
import 'package:todo_app/features/Auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:todo_app/features/Auth/presentation/controller/profile_cubit/profile_cubit.dart';
import 'package:todo_app/features/Auth/presentation/controller/sign_up_cubit/sign_up_cubit.dart';
import 'package:todo_app/features/Auth/presentation/views/login_view.dart';
import 'package:todo_app/features/Auth/presentation/views/profile_view.dart';
import 'package:todo_app/features/Auth/presentation/views/sign_up_view.dart';
import 'package:todo_app/features/Onboarding/presentation/views/onboarding_view.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';
import 'package:todo_app/features/home/data/repos/home_repo.dart';
import 'package:todo_app/features/home/presentation/manager/cubits/create_task_cubit/create_task_cubit.dart';
import 'package:todo_app/features/home/presentation/views/create_edit_task_view.dart';
import 'package:todo_app/features/home/presentation/views/home_view.dart';
import 'package:todo_app/features/home/presentation/views/sanner_view.dart';
import 'package:todo_app/features/home/presentation/views/task_details_view.dart';

abstract class AppRouter {
  // routes names
  static const onBoardingView = '/onBoardingView';
  static const loginView = '/loginView';
  static const signUpView = '/signUpView';
  static const homeView = '/homeView';
  static const profileView = '/profileView';
  static const taskDetailsView = '/taskDetailsView';
  static const scannerView = '/scannerView';
  static const createEditTaskView = '/createEditTaskView';

  /// This function is responsible for generating routes based on the route settings.
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // onboarding view route
      case onBoardingView:
        return CustomPageRouteBuilder(
          page: const OnboardingView(),
        );

      // login view route
      case loginView:
        return CustomPageRouteBuilder(
          page: BlocProvider(
            create: (context) => LoginCubit(sl<AuthRepo>()),
            child: const LoginView(),
          ),
        );

      // sign up view route
      case signUpView:
        return CustomPageRouteBuilder(
          transitionType: TransitionTypeEnum.bottomToTop,
          page: BlocProvider(
            create: (context) => SignUpCubit(sl<AuthRepo>()),
            child: const SignUpView(),
          ),
        );

      // home view route
      case homeView:
        return CustomPageRouteBuilder(
          page: const HomeView(),
        );

      // profile view route
      case profileView:
        return CustomPageRouteBuilder(
          page: BlocProvider(
            create: (context) => ProfileCubit(sl<AuthRepo>())..getUserInfo(),
            child: const ProfileView(),
          ),
        );

      // task details view route
      case taskDetailsView:
        final args = settings.arguments as Map<String, dynamic>;
        return CustomPageRouteBuilder(
          transitionType: TransitionTypeEnum.fade,
          page: TaskDetailsView(
            task: args['task'],
            showOptions: args['showOptions'] ?? true,
          ),
        );

      // scanner view route
      case scannerView:
        return CustomPageRouteBuilder(
          page: const ScannerView(),
        );

      // add task view route
      case createEditTaskView:
        return CustomPageRouteBuilder(
          page: BlocProvider(
            create: (context) => CreateOrEditTaskCubit(sl<HomeRepo>()),
            child: CreateEditTaskView(
              task: settings.arguments as TaskModel?,
            ),
          ),
        );

      default:
        // If the route is not found, return null.
        return null;
    }
  }
}
