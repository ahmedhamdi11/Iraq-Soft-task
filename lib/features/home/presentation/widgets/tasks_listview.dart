import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/widgets/default_error_widget.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';
import 'package:todo_app/features/home/presentation/manager/cubits/home_view_cubit/home_view_cubit.dart';
import 'package:todo_app/features/home/presentation/widgets/no_tasks_widget.dart';
import 'package:todo_app/features/home/presentation/widgets/task_card_widgets/task_card.dart';
import 'package:todo_app/features/home/presentation/widgets/tasks_loading_shimmer.dart';

class TasksListview extends StatefulWidget {
  const TasksListview({super.key});

  @override
  State<TasksListview> createState() => _TasksListviewState();
}

class _TasksListviewState extends State<TasksListview> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _listenToScrollController();
    super.initState();
  }

  void _listenToScrollController() {
    final cubit = context.read<HomeViewCubit>();

    _scrollController.addListener(() {
      final currentScrollOffset = _scrollController.offset;
      final maxScrollOffset = _scrollController.position.maxScrollExtent;

      if (currentScrollOffset > 0.8 * maxScrollOffset &&
          !cubit.isLastPage &&
          cubit.state is! GetTasksLoading &&
          cubit.state is! GetTasksFailure) {
        cubit.tasksPage++;
        cubit.getTasks();
      }
    });
  }

  Future<void> _onRefresh() async {
    final cubit = context.read<HomeViewCubit>();

    // reset the pagination
    cubit.tasksPage = 1;
    cubit.isLastPage = false;
    cubit.tasks = [];

    // fetch the tasks
    await cubit.getTasks();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeViewCubit>();

    return Expanded(
      child: RefreshIndicator(
        onRefresh: () => _onRefresh(),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: BlocBuilder<HomeViewCubit, HomeViewState>(
                buildWhen: (p, c) =>
                    c is GetTasksLoading ||
                    c is GetTasksFailure ||
                    c is GetTasksSuccess,
                builder: (context, state) {
                  if (state is GetTasksLoading && cubit.tasksPage == 1) {
                    return const TasksLoadingShimmer();
                  } else if (state is GetTasksFailure && cubit.tasksPage == 1) {
                    return Center(
                      child: DefaultErrorWidget(
                        errMessage: state.errMessage,
                        onTryAgainPressed: () => cubit.getTasks(),
                      ),
                    );
                  }

                  // else the state is success state
                  // check if there the tasks is empty to display the empty ui else display the tasks list
                  List<TaskModel> filteredTasks = [];

                  // TODO: filter the tasks based on it's status
                  // return all data for now
                  if (false) {
                    filteredTasks.addAll(cubit.tasks.where(
                      (e) => e.status == cubit.selectedFilterStatus,
                    ));
                  } else {
                    filteredTasks = cubit.tasks;
                  }

                  if (filteredTasks.isEmpty) {
                    return const NoTasksWidget();
                  }
                  return Animate(
                    effects: const [FadeEffect()],
                    child: ListView.builder(
                      itemCount: filteredTasks.length + 1,
                      controller: _scrollController,
                      padding: const EdgeInsets.only(bottom: 130).h,
                      itemBuilder: (context, index) {
                        if (index < filteredTasks.length) {
                          return TaskCard(task: filteredTasks[index]);
                        } else {
                          return state is GetTasksLoading
                              ? const Center(child: CircularProgressIndicator())
                              : state is GetTasksFailure
                                  ? DefaultErrorWidget(
                                      errMessage: state.errMessage,
                                      onTryAgainPressed: () => cubit.getTasks(),
                                    )
                                  : const SizedBox.shrink();
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
