import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/services/service_locator.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/core/utils/functions.dart';
import 'package:todo_app/core/widgets/confirm_alert_dialog.dart';
import 'package:todo_app/features/Auth/data/repos/auth_repo.dart';
import 'package:todo_app/features/Auth/presentation/controller/logout_cubit/logout_cubit.dart';
import 'package:todo_app/features/home/presentation/widgets/floating_action_buttons.dart';
import 'package:todo_app/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const HomeViewBody(),
      floatingActionButton: const FloatingActionButtons(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: EdgeInsetsDirectional.only(start: 22.w),
        child: const Text('Logo'),
      ),
      titleSpacing: 0,
      actions: [
        // profile button
        IconButton(
          onPressed: () => Navigator.pushNamed(context, AppRouter.profileView),
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
          onPressed: () => _logout(context),
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

  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => BlocProvider(
        create: (context) => LogoutCubit(sl<AuthRepo>()),
        child: BlocListener<LogoutCubit, LogoutState>(
          listener: (context, state) {
            if (state is LogoutLoading) {
              EasyLoading.show();
            } else if (state is LogoutFailure) {
              EasyLoading.dismiss();
              showToastMessage(state.errMessage);
            } else if (state is LogoutSuccess) {
              EasyLoading.dismiss();
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRouter.loginView,
                (r) => false,
              );
            }
          },
          child: Builder(
            builder: (context) {
              return ConfirmAlertDialog(
                onConfirm: () => context.read<LogoutCubit>().logout(),
                message: "Are you sure you want to Logout?",
              );
            },
          ),
        ),
      ),
    );
  }
}
