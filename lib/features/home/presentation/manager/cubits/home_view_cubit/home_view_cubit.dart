import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/enums.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';
import 'package:todo_app/features/home/data/repos/home_repo.dart';

part 'home_view_state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  final HomeRepo _repo;
  HomeViewCubit(this._repo) : super(HomeViewInitial());

  TaskStatusEnum? selectedFilterStatus;
  void changeStatusFilter(TaskStatusEnum? status) {
    selectedFilterStatus = status;
    emit(TasksFilterChanged());
  }

  int tasksPage = 1;
  bool isLastPage = false;
  List<TaskModel> tasks = [];
  Future<void> getTasks() async {
    emit(GetTasksLoading());

    var result = await _repo.getTasks(tasksPage);

    result.fold(
      (failure) => emit(GetTasksFailure(failure.errMessage)),
      (successData) {
        tasks.addAll(successData);
        if (successData.length < 20) {
          isLastPage = true;
        }
        emit(GetTasksSuccess());
      },
    );
  }
}
