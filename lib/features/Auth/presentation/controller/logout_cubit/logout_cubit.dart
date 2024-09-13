import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/Auth/data/repos/auth_repo.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final AuthRepo _repo;
  LogoutCubit(this._repo) : super(LogoutInitial());

  Future<void> logout() async {
    emit(LogoutLoading());

    var result = await _repo.logout();

    result.fold(
      (failure) => emit(LogoutFailure(failure.errMessage)),
      (success) => emit(LogoutSuccess()),
    );
  }
}
