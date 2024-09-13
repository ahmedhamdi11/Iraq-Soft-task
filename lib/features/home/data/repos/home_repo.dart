import 'package:dartz/dartz.dart';
import 'package:todo_app/core/failures/failures.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<TaskModel>>> getTasks(int page);

  Future<Either<Failure, String>> deleteTask(String taskId);
}
