import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_app/core/constants/api_constants.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/core/failures/failures.dart';
import 'package:todo_app/core/services/api_services.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';
import 'package:todo_app/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices _apiServices;
  const HomeRepoImpl(this._apiServices);

  @override
  Future<Either<Failure, List<TaskModel>>> getTasks(int page) async {
    try {
      Response res = await _apiServices.get(
        endPoint: kTodosListEndpoint,
        queryParameters: {
          'page': page,
        },
      );

      if (res.statusCode == 200) {
        List<TaskModel> tasks = [];

        for (var element in res.data) {
          tasks.add(TaskModel.fromJson(element));
        }

        return right(tasks);
      } else {
        return left(Failure(kUnknownErrorMessage));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(e));
      } else {
        return left(Failure(kUnknownErrorMessage));
      }
    }
  }

  @override
  Future<Either<Failure, String>> deleteTask(String taskId) async {
    try {
      Response res = await _apiServices.delete(
        endPoint: '$kTodosListEndpoint/$taskId',
      );

      if (res.statusCode == 200) {
        return right('Task deleted');
      } else {
        return left(Failure(kUnknownErrorMessage));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(e));
      } else {
        return left(Failure(kUnknownErrorMessage));
      }
    }
  }

  @override
  Future<Either<Failure, TaskModel>> getTaskById(String taskId) async {
    try {
      Response res = await _apiServices.get(
        endPoint: '$kTodosListEndpoint/$taskId',
      );

      if (res.statusCode == 200) {
        return right(TaskModel.fromJson(res.data));
      } else {
        return left(Failure(kUnknownErrorMessage));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(e));
      } else {
        return left(Failure(kUnknownErrorMessage));
      }
    }
  }
}
