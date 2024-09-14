part of 'create_task_cubit.dart';

sealed class CreateOrEditTaskState {}

final class CreateOrEditTaskInitial extends CreateOrEditTaskState {}

/// upload image states
final class UploadImageLoading extends CreateOrEditTaskState {}

final class UploadImageSuccess extends CreateOrEditTaskState {
  final String imagePath;

  UploadImageSuccess(this.imagePath);
}

final class UploadImageFailure extends CreateOrEditTaskState {
  final String errMessage;

  UploadImageFailure(this.errMessage);
}

/// create or edit task states
final class CreateOrEditTaskLoading extends CreateOrEditTaskState {}

final class CreateOrEditTaskSuccess extends CreateOrEditTaskState {}

final class CreateOrEditTaskFailure extends CreateOrEditTaskState {
  final String errMessage;

  CreateOrEditTaskFailure(this.errMessage);
}
