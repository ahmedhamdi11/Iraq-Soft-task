import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/Auth/data/models/user_model.dart';
import 'package:todo_app/features/Auth/data/repos/auth_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final AuthRepo _repo;
  ProfileCubit(this._repo) : super(ProfileInitial());

  Future<void> getUserInfo() async {
    emit(ProfileLoading());

    var result = await _repo.getProfileInfo();

    result.fold(
      (failure) => emit(ProfileFailure(failure.errMessage)),
      (user) => emit(ProfileSuccess(user)),
    );
  }
}
