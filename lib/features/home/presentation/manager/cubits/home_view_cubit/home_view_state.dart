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
