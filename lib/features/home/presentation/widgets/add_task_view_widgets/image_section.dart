import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12.r),
      child: DottedBorder(
        color: kPrimaryColor,
        radius: Radius.circular(12.r),
        borderType: BorderType.RRect,
        child: Container(
          height: 56.h,
          alignment: Alignment.center,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              children: [
                Icon(
                  Icons.image_outlined,
                  size: 24.r,
                  color: kPrimaryColor,
                ),
                const SizedBox(width: 8),
                Text(
                  'Add Image',
                  style: AppStyles.text19.copyWith(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
