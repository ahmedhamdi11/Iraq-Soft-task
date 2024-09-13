import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/utils/app_styles.dart';

class TaskCreationDateTile extends StatelessWidget {
  const TaskCreationDateTile({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      margin: EdgeInsets.only(bottom: 8.h),
      padding: const EdgeInsetsDirectional.only(
        start: 24,
        end: 10,
        top: 7,
        bottom: 7,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffF0ECFF),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Created At",
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.text9,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat.yMMMd().format(date),
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.text14.copyWith(
                      color: const Color(0xff2F2F2F),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // suffix
          SvgPicture.asset(
            'assets/icons/calendar_icon.svg',
            width: 24.r,
          ),
        ],
      ),
    );
  }
}
