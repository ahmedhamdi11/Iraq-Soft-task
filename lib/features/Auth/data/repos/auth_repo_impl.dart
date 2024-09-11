import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/api_constants.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/core/failures/failures.dart';
import 'package:todo_app/core/services/api_services.dart';
import 'package:todo_app/features/Auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiServices _apiServices;

  const AuthRepoImpl(this._apiServices);

  @override
  Future<Either<Failure, Unit>> login({
    required String phone,
    required String password,
  }) async {
    try {
      Response res = await _apiServices.post(
        endPoint: kLoginEndpoint,
      );

      debugPrint(res.toString());

      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(e));
      } else {
        return left(Failure(kUnknownErrorMessage));
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> signUp({
    required String phone,
    required String password,
    required String displayName,
    required String address,
    required String level,
    required int experienceYears,
  }) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
