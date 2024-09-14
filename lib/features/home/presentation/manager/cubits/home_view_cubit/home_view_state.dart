part of 'home_view_cubit.dart';

sealed class HomeViewState {}

final class HomeViewInitial extends HomeViewState {}

/// filter state
final class TasksFilterChanged extends HomeViewState {}

/// get tasks states
final class GetTasksLoading extends HomeViewState {}

final class GetTasksSuccess extends HomeViewState {}

final class GetTasksFailure extends HomeViewState {
  final String errMessage;

  GetTasksFailure(this.errMessage);
}

/// delete task states
final class DeleteTasksLoading extends HomeViewState {}

final class DeleteTasksSuccess extends HomeViewState {
  final String successMessage;

  DeleteTasksSuccess(this.successMessage);
}

final class DeleteTasksFailure extends HomeViewState {
  final String errMessage;

  DeleteTasksFailure(this.errMessage);
}

/// get task from qr cod states
final class GetTaskFromQrLoading extends HomeViewState {}

final class GetTaskFromQrSuccess extends HomeViewState {
  final TaskModel task;

  GetTaskFromQrSuccess(this.task);
}

final class GetTaskFromQrFailure extends HomeViewState {
  final String errMessage;

  GetTaskFromQrFailure(this.errMessage);
}
