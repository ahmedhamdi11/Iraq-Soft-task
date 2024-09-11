import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  bool isVisiblePassword = false;

  void togglePasswordVisibility() {
    isVisiblePassword = !isVisiblePassword;
    emit(TogglePasswordVisibility());
  }
}
