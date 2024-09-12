import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/features/home/presentation/widgets/floating_action_buttons.dart';
import 'package:todo_app/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const HomeViewBody(),
      floatingActionButton: const FloatingActionButtons(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Padding(
        padding: EdgeInsetsDirectional.only(start: 22.w),
        child: const Text('Logo'),
      ),
      titleSpacing: 0,
      actions: [
        // profile button
        IconButton(
          onPressed: () {},
          iconSize: 24.r,
          icon: Image.asset(
            "assets/icons/person_icon.png",
            color: kBlackColor,
            width: 24.r,
          ),
        ),

        const SizedBox(width: 2),

        // logout button
        IconButton(
          onPressed: () {},
          iconSize: 24.r,
          icon: const Icon(
            Icons.logout_rounded,
            color: kPrimaryColor,
          ),
        ),

        SizedBox(width: 18.w),
      ],
    );
  }
}
