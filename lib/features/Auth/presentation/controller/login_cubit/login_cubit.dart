import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/functions.dart';
import 'package:todo_app/features/Auth/data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo _repo;
  LoginCubit(this._repo) : super(LoginInitial());

  bool isVisiblePassword = false;

  void togglePasswordVisibility() {
    isVisiblePassword = !isVisiblePassword;
    emit(TogglePasswordVisibility());
  }

  String phone = '';
  String countryCode = '+20';
  String password = '';

  bool _validInput() {
    return phone.isNotEmpty && password.isNotEmpty;
  }

  Future<void> login() async {
    if (!_validInput()) {
      showToastMessage('phone number and password cannot be empty!');
      return;
    }
    emit(LoginLoading());

    var result = await _repo.login(
      phone: countryCode + phone,
      password: password,
    );

    result.fold(
      (failure) => emit(LoginFailure(failure.errMessage)),
      (success) => emit(LoginSuccess()),
    );
  }
}
