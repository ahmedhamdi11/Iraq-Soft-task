import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/home/presentation/widgets/task_card_widgets/task_card.dart';

class TasksListview extends StatelessWidget {
  const TasksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        padding: const EdgeInsets.only(bottom: 130).h,
        itemBuilder: (context, index) => const TaskCard(),
      ),
    );
  }
}
