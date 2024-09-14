import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/core/utils/functions.dart';
import 'package:todo_app/core/widgets/default_button.dart';
import 'package:todo_app/features/home/presentation/manager/cubits/create_task_cubit/create_task_cubit.dart';

class UploadImageBottomSheet extends StatelessWidget {
  const UploadImageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateOrEditTaskCubit>();

    return BlocListener<CreateOrEditTaskCubit, CreateOrEditTaskState>(
      listener: (context, state) {
        if (state is UploadImageLoading) {
          EasyLoading.show();
        } else if (state is UploadImageFailure) {
          EasyLoading.dismiss();
          showToastMessage(state.errMessage);
        } else if (state is UploadImageSuccess) {
          EasyLoading.dismiss();
          Navigator.pop(context);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(kHorizontalPadding).w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // upload from gallery
            DefaultButton(
              onPressed: () => cubit.uploadImage(ImageSource.gallery),
              btnColor: kPrimaryColor.withOpacity(0.1),
              btnText: 'Upload from Gallery',
              btnTextColor: kPrimaryColor,
            ),

            SizedBox(height: 16.h),

            // upload from camera
            DefaultButton(
              onPressed: () => cubit.uploadImage(ImageSource.camera),
              btnColor: kPrimaryColor.withOpacity(0.1),
              btnText: 'Upload from camera',
              btnTextColor: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
