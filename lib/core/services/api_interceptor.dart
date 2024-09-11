import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/constants/api_constants.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/core/services/api_services.dart';
import 'package:todo_app/core/services/navigation_service.dart';
import 'package:todo_app/core/services/service_locator.dart';
import 'package:todo_app/core/utils/app_router.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String? accessToken =
        sl<SharedPreferences>().getString(kAccessTokenPrefsKey);

    if (accessToken != null) {
      options.headers.addAll({
        'Authorization': 'bearer $accessToken',
      });
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 &&
        err.response?.data['message'] == 'Unauthorized') {
      if (await _refreshToken()) {
        handler.resolve(await Dio().fetch(err.requestOptions));
      }
    }
    super.onError(err, handler);
  }

  Future<bool> _refreshToken() async {
    String? refreshToken =
        sl<SharedPreferences>().getString(kRefreshTokenPrefsKey);

    if (refreshToken != null) {
      try {
        Response res = await sl<ApiServices>().get(
          endPoint: kRefreshTokenEndpoint,
          queryParameters: {
            'token': sl<SharedPreferences>().getString(kRefreshTokenPrefsKey),
          },
        );
        if (res.data['access_token'] != null) {
          sl<SharedPreferences>()
              .setString(kAccessTokenPrefsKey, res.data['access_token']);
          return true;
        } else {
          return false;
        }
      } catch (_) {
        await _deleteSavedDataAndNavigateToLogin();
        return false;
      }
    }
    return false;
  }

  Future<void> _deleteSavedDataAndNavigateToLogin() async {
    await sl<SharedPreferences>().remove(kAccessTokenPrefsKey);
    await sl<SharedPreferences>().remove(kRefreshTokenPrefsKey);
    await sl<NavigationService>().pushNamedAndRemoveUntil(AppRouter.loginView);
  }
}
