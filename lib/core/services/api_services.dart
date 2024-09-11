import 'package:dio/dio.dart';
import 'package:todo_app/core/constants/api_constants.dart';

class ApiServices {
  final Dio _dio;

  ApiServices(
    this._dio, {
    String baseUrl = kBaseUrl,
  }) {
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
    );
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
}
