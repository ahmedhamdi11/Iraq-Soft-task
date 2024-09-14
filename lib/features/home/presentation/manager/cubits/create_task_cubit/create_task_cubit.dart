import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/core/utils/enums.dart';
import 'package:todo_app/core/utils/functions.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';
import 'package:todo_app/features/home/data/repos/home_repo.dart';

part 'create_task_state.dart';

class CreateOrEditTaskCubit extends Cubit<CreateOrEditTaskState> {
  final HomeRepo _homeRepo;
  CreateOrEditTaskCubit(this._homeRepo) : super(CreateOrEditTaskInitial());

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

    emit(CreateOrEditTaskLoading());

    var result = await _homeRepo.createTask(
      title: title,
      desc: desc,
      image: imagePath ?? 'path.png',
      priority: priority!.name,
      status: status?.name ?? TaskStatusEnum.waiting.name,
    );

    result.fold(
      (failure) => emit(CreateOrEditTaskFailure(failure.errMessage)),
      (data) => emit(CreateOrEditTaskSuccess()),
    );
  }

  Future<void> editTask(TaskModel task) async {
    if (!_validateInputs()) {
      return;
    }

    emit(CreateOrEditTaskLoading());

    var result = await _homeRepo.editTask(
      task: TaskModel(
        id: task.id,
        image: imagePath ?? '',
        title: title,
        desc: desc,
        priority: priority!,
        status: status ?? TaskStatusEnum.waiting,
        userId: "userId",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );

    result.fold(
      (failure) => emit(CreateOrEditTaskFailure(failure.errMessage)),
      (data) => emit(CreateOrEditTaskSuccess()),
    );
  }
}
