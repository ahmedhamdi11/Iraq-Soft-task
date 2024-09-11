part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class TogglePasswordVisibility extends LoginState {}
