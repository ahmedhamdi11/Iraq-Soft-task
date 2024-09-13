import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:todo_app/features/Auth/presentation/widgets/profile_view_widgets/profile_info_tile.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        itemCount: 5,
        itemBuilder: (context, i) => ProfileInfoTile(
          title: 'title',
          content: 'content' * 3,
        ),
      ),
    );
  }
}
