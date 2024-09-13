import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/widgets/default_error_widget.dart';
import 'package:todo_app/features/home/presentation/manager/cubits/home_view_cubit/home_view_cubit.dart';
import 'package:todo_app/features/home/presentation/widgets/task_card_widgets/task_card.dart';

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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeViewCubit>();

    return Expanded(
      child: BlocBuilder<HomeViewCubit, HomeViewState>(
        builder: (context, state) {
          if (state is GetTasksLoading && cubit.tasksPage == 1) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetTasksFailure && cubit.tasksPage == 1) {
            return Center(
              child: Text(state.errMessage),
            );
          }

          // else the state is success state
          // check if there the tasks is empty to display the empty ui else display the tasks list
          if (cubit.tasks.isEmpty && cubit.tasksPage == 1) {
            return const Center(
              child: Text('no tasks'),
            );
          }
          return ListView.builder(
            itemCount: cubit.tasks.length + 1,
            controller: _scrollController,
            padding: const EdgeInsets.only(bottom: 130).h,
            itemBuilder: (context, index) {
              if (index < cubit.tasks.length) {
                return TaskCard(task: cubit.tasks[index]);
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
          );
        },
      ),
    );
  }
}
