import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_styles.dart';

class ProfileInfoTile extends StatelessWidget {
  const ProfileInfoTile({
    super.key,
    required this.title,
    required this.content,
    this.suffix,
  });

  final String title;
  final String content;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 12.r),
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.text12.copyWith(
                    color: const Color(0xff2F2F2F).withOpacity(0.4),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.text19.copyWith(
                    color: const Color(0xff2F2F2F).withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),

          // suffix
          if (suffix != null) suffix!,
        ],
      ),
    );
  }
}
