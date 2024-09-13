import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:todo_app/features/Auth/presentation/widgets/profile_view_widgets/profile_info_tile.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      children: [
        // user name
        const ProfileInfoTile(
          title: 'Name',
          content: 'infooooooooo',
        ),

        // phone
        ProfileInfoTile(
          title: 'Phone',
          content: 'infooooooooo',
          suffix: IconButton(
            onPressed: () {
              Clipboard.setData(const ClipboardData(text: 'text'));
            },
            icon: SvgPicture.asset(
              'assets/icons/copy_icon.svg',
              width: 24.r,
            ),
          ),
        ),

        // level
        const ProfileInfoTile(
          title: 'Level',
          content: 'infooooooooo',
        ),

        // years of experience
        const ProfileInfoTile(
          title: 'Years of experience',
          content: 'infooooooooo',
        ),

        // address
        const ProfileInfoTile(
          title: 'Location',
          content: 'infooooooooo',
        ),
      ],
    );
  }
}
