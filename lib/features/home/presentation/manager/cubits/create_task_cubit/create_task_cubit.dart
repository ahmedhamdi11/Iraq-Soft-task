import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/features/home/data/repos/home_repo.dart';

part 'create_task_state.dart';

class CreateTaskCubit extends Cubit<CreateTaskState> {
  final HomeRepo _homeRepo;
  CreateTaskCubit(this._homeRepo) : super(CreateTaskInitial());

  String? imagePath;
  Future<void> uploadImage(ImageSource source) async {
    emit(UploadImageLoading());

    var result = await _homeRepo.uploadImage(source);

    result.fold(
      (failure) => emit(UploadImageFailure(failure.errMessage)),
      (data) {
        imagePath = data;
        emit(UploadImageSuccess(data));
      },
    );
  }
}
