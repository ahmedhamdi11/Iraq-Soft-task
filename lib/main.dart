import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/core/services/navigation_service.dart';
import 'package:todo_app/core/services/service_locator.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/core/utils/app_themes.dart';
import 'package:todo_app/core/utils/functions.dart';
import 'package:todo_app/observer.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // set orientation to portrait only
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    // setup service locator
    await setupServiceLocator();

    // configure easy loading
    configLoading();

    Bloc.observer = MyBlocObserver(); // my bloc observer

    // catch flutter errors
    FlutterError.onError = (FlutterErrorDetails details) async {
      log(details.exception.toString(), stackTrace: details.stack);
    };

    // run the app
    runApp(const ToDoApp());
  }, (error, stackTrace) async {
    log(error.toString(), stackTrace: stackTrace);
  });
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        title: 'ToDo',
        theme: AppThemes.lightTheme,
        initialRoute: _initialRoute(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        navigatorKey: sl<NavigationService>().navigatorKey,
      ),
    );
  }

  String _initialRoute() {
    String? token = sl<SharedPreferences>().getString(kAccessTokenPrefsKey);
    bool? onboarding = sl<SharedPreferences>().getBool(kOnBoardingPrefsKey);

    if (token != null) {
      return AppRouter.homeView;
    } else if (onboarding == true) {
      return AppRouter.loginView;
    } else {
      return AppRouter.onBoardingView;
    }
  }
}
