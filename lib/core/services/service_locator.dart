import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/services/api_services.dart';
import 'package:todo_app/features/Auth/data/repos/auth_repo.dart';
import 'package:todo_app/features/Auth/data/repos/auth_repo_impl.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Initialize shared preferences
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Register shared preferences
  sl.registerSingleton<SharedPreferences>(prefs);

  // register api service
  sl.registerLazySingleton<ApiServices>(() => ApiServices(Dio()));

  // register the auth repo
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl.get<ApiServices>()));
}
