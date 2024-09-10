import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';

class CustomCountryCodePicker extends StatelessWidget {
  const CustomCountryCodePicker({super.key, this.onChanged});

  final void Function(CountryCode)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CountryCodePicker(
          initialSelection: '+20',
          dialogTextStyle: AppStyles.text14.copyWith(color: kBlackColor),
          searchStyle: AppStyles.text14.copyWith(color: kBlackColor),
          dialogSize: Size(250.w, 400.h),
          boxDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.white,
          ),
          onChanged: onChanged,
          builder: (code) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 14.w),
                if (code?.flagUri != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.asset(
                      code!.flagUri!,
                      package: 'country_code_picker',
                      fit: BoxFit.fill,
                      width: 26.r,
                      height: 24.r,
                    ),
                  ),
                SizedBox(width: 8.w),
                FittedBox(
                  child: Text(
                    code?.dialCode.toString() ?? '+20',
                    style: AppStyles.text14.copyWith(
                      color: kBlackColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            );
          },
        ),

        // arrow down
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: kGreyColor,
            size: 24.r,
          ),
        ),
        SizedBox(width: 10.w),
      ],
    );
  }
}
