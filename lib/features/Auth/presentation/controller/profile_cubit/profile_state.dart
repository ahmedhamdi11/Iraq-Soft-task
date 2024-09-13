part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

// get info states
final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final UserModel user;

  ProfileSuccess(this.user);
}

final class ProfileFailure extends ProfileState {
  final String errMessage;

  ProfileFailure(this.errMessage);
}
