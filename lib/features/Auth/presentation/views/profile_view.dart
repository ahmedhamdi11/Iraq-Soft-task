import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/core/widgets/default_back_button.dart';
import 'package:todo_app/features/Auth/presentation/widgets/profile_view_widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ProfileViewBody(),
      appBar: AppBar(
        leadingWidth: 65.w,
        leading: const DefaultBackButton(),
        title: Text(
          'Profile',
          style: AppStyles.text16,
        ),
        titleSpacing: 4,
      ),
    );
  }
}
