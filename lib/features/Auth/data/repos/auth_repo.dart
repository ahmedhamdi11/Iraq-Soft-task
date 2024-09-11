import 'package:dartz/dartz.dart';
import 'package:todo_app/core/failures/failures.dart';

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
}
