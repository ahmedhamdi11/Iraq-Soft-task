import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/enums.dart';
import 'package:todo_app/core/utils/functions.dart';
import 'package:todo_app/features/Auth/data/repos/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo _repo;

  SignUpCubit(this._repo) : super(SignUpInitial());

  bool isVisiblePassword = false;

  void togglePasswordVisibility() {
    isVisiblePassword = !isVisiblePassword;
    emit(TogglePasswordVisibility());
  }

  String phone = '';
  String countryCode = '+20';
  String password = '';
  String address = '';
  String displayName = '';
  int? experienceYears;
  ExperienceLevel? level;

  bool _validInput() {
    return phone.isNotEmpty &&
        password.isNotEmpty &&
        address.isNotEmpty &&
        displayName.isNotEmpty &&
        level != null &&
        experienceYears != null;
  }

  Future<void> signUp() async {
    if (!_validInput()) {
      showToastMessage('all fields is required');
      return;
    }
    emit(SignUpLoading());

    var result = await _repo.signUp(
      phone: countryCode + phone,
      password: password,
      address: address,
      displayName: displayName,
      experienceYears: experienceYears!,
      level: level!.name,
    );

    result.fold(
      (failure) => emit(SignUpFailure(failure.errMessage)),
      (success) => emit(SignUpSuccess()),
    );
  }
}
