part of 'edit_task_cubit.dart';

sealed class EditTaskState {}

final class EditTaskInitial extends EditTaskState {}

/// upload image states
final class UploadImageLoading extends EditTaskState {}

final class UploadImageSuccess extends EditTaskState {
  final String imagePath;

  UploadImageSuccess(this.imagePath);
}

final class UploadImageFailure extends EditTaskState {
  final String errMessage;

  UploadImageFailure(this.errMessage);
}

/// edit task states
final class EditTaskLoading extends EditTaskState {}

final class EditTaskSuccess extends EditTaskState {}

final class EditTaskFailure extends EditTaskState {
  final String errMessage;

  EditTaskFailure(this.errMessage);
}
