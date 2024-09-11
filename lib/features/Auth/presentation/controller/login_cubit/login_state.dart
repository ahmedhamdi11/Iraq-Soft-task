part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class TogglePasswordVisibility extends LoginState {}

/// login stats
final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginFailure extends LoginState {
  final String errMessage;

  LoginFailure(this.errMessage);
}
