import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/core/utils/enums.dart';
import 'package:todo_app/core/utils/functions.dart';
import 'package:todo_app/features/home/data/repos/home_repo.dart';

part 'create_task_state.dart';

class CreateTaskCubit extends Cubit<CreateTaskState> {
  final HomeRepo _homeRepo;
  CreateTaskCubit(this._homeRepo) : super(CreateTaskInitial());

  String? imagePath;
  String title = '';
  String desc = '';
  TaskPriorityEnum? priority;
  TaskStatusEnum? status;

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

  bool _validateInputs() {
    if (title.isEmpty) {
      showToastMessage('Title cannot be empty');
      return false;
    } else if (desc.isEmpty) {
      showToastMessage('Description cannot be empty');
      return false;
    } else if (priority == null) {
      showToastMessage('Select Task priority first');
      return false;
    }
    return true;
  }

  Future<void> createTask() async {
    if (!_validateInputs()) {
      return;
    }

    emit(CreateTaskLoading());

    var result = await _homeRepo.createTask(
      title: title,
      desc: desc,
      image: imagePath ?? 'path.png',
      priority: priority!.name,
      status: status?.name ?? TaskStatusEnum.waiting.name,
    );

    result.fold(
      (failure) => emit(CreateTaskFailure(failure.errMessage)),
      (data) => emit(CreateTaskSuccess()),
    );
  }
}
