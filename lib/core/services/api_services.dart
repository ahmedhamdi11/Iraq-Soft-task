import 'package:dio/dio.dart';
import 'package:todo_app/core/constants/api_constants.dart';
import 'package:todo_app/core/services/api_interceptor.dart';

class ApiServices {
  final Dio _dio;

  ApiServices(
    this._dio, {
    String baseUrl = kBaseUrl,
  }) {
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
    );

    _dio.interceptors.add(ApiInterceptor());
  }

  Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response = await _dio.get(
      endPoint,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
    return response;
  }

  Future<Response> post({
    required String endPoint,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    Response response = await _dio.post(
      endPoint,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
      data: data,
    );
    return response;
  }

  Future<Response> delete({
    required String endPoint,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    Response response = await _dio.delete(
      endPoint,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
      data: data,
    );
    return response;
  }

  Future<Response> put({
    required String endPoint,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    Response response = await _dio.put(
      endPoint,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
      data: data,
    );
    return response;
  }
}
