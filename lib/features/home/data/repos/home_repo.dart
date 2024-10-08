import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/core/failures/failures.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<TaskModel>>> getTasks(int page);

  Future<Either<Failure, TaskModel>> getTaskById(String taskId);

  Future<Either<Failure, String>> deleteTask(String taskId);

  Future<Either<Failure, String>> uploadImage(ImageSource source);

  Future<Either<Failure, Unit>> createTask({
    required String image,
    required String title,
    required String desc,
    required String priority,
    required String status,
  });

  Future<Either<Failure, Unit>> editTask({required TaskModel task});
}
