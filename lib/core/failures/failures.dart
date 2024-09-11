import 'dart:io';
import 'package:dio/dio.dart';

class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDio(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('connection timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure('send timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('receive timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure(
            'the Certificate Verification failed on the server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioError.response);
      case DioExceptionType.cancel:
        return ServerFailure('request canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('connection error');
      case DioExceptionType.unknown:
        if (dioError.error is SocketException) {
          return ServerFailure(
              'no internet connection, check your connection and try again!');
        } else {
          return ServerFailure('something went wrong, please try again!');
        }

      default:
        return ServerFailure('something went wrong, please try again!');
    }
  }

  factory ServerFailure.fromResponse(
    Response? res,
  ) {
    if (res?.data['message'] != null) {
      return ServerFailure(res!.data['message']);
    } else {
      return ServerFailure('something went wrong, please try again!');
    }
  }
}
