part of 'home_view_cubit.dart';

sealed class HomeViewState {}

final class HomeViewInitial extends HomeViewState {}

/// get tasks states
final class GetTasksLoading extends HomeViewState {}

final class GetTasksSuccess extends HomeViewState {}

final class GetTasksFailure extends HomeViewState {
  final String errMessage;

  GetTasksFailure(this.errMessage);
}
