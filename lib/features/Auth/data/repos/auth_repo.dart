import 'package:dartz/dartz.dart';
import 'package:todo_app/core/failures/failures.dart';
import 'package:todo_app/features/Auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, Unit>> login({
    required String phone,
    required String password,
  });

  Future<Either<Failure, Unit>> signUp({
    required String phone,
    required String password,
    required String displayName,
    required String address,
    required String level,
    required int experienceYears,
  });

  Future<Either<Failure, Unit>> logout();

  Future<Either<Failure, UserModel>> getProfileInfo();
}
