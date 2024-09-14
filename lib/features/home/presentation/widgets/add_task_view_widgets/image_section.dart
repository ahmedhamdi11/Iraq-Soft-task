import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/api_constants.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';

import 'package:todo_app/features/home/presentation/manager/cubits/create_task_cubit/create_task_cubit.dart';
import 'package:todo_app/features/home/presentation/widgets/add_task_view_widgets/upload_image_bottom_sheet.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateTaskCubit>();

    return BlocBuilder<CreateTaskCubit, CreateTaskState>(
      buildWhen: (previous, current) => current is UploadImageSuccess,
      builder: (context, state) {
        return InkWell(
          onTap: () => _uploadImage(context),
          borderRadius: BorderRadius.circular(12.r),
          child: cubit.imagePath != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: CachedNetworkImage(
                    imageUrl: "$kImagesBaseUrl${cubit.imagePath}",
                    height: 225.h,
                    fit: BoxFit.contain,
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/icons/launcher_icon.png',
                      fit: BoxFit.cover,
                    ),
                    placeholder: (context, url) => Image.asset(
                      'assets/icons/launcher_icon.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : DottedBorder(
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
      },
    );
  }

  _uploadImage(BuildContext context) {
    final cubit = context.read<CreateTaskCubit>();

    showModalBottomSheet(
      context: context,
      builder: (context) => BlocProvider.value(
        value: cubit,
        child: const UploadImageBottomSheet(),
      ),
    );
  }
}
