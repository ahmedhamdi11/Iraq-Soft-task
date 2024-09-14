import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/core/utils/functions.dart';
import 'package:todo_app/core/widgets/default_back_button.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';
import 'package:todo_app/features/home/presentation/manager/cubits/home_view_cubit/home_view_cubit.dart';

class ScannerView extends StatefulWidget {
  const ScannerView({super.key});

  @override
  State<ScannerView> createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> {
  late MobileScannerController _controller;

  @override
  void initState() {
    _controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onQrScanSuccess(TaskModel task) {
    EasyLoading.dismiss();
    Navigator.pushReplacementNamed(
      context,
      AppRouter.taskDetailsView,
      arguments: {
        'task': task,
        'showOptions': false,
      },
    );
  }

  void _onQrCodeScanFailure(String errMessage) {
    EasyLoading.dismiss();
    showToastMessage(errMessage);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeViewCubit, HomeViewState>(
      listener: (context, state) {
        if (state is GetTaskFromQrLoading) {
          EasyLoading.show();
        } else if (state is GetTaskFromQrFailure) {
          _onQrCodeScanFailure(state.errMessage);
        } else if (state is GetTaskFromQrSuccess) {
          _onQrScanSuccess(state.task);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 65.w,
          leading: const DefaultBackButton(),
          title: Text(
            'Scanner',
            style: AppStyles.text16,
          ),
          titleSpacing: 4,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: kHorizontalPadding.w,
            vertical: 20.h,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: MobileScanner(
              controller: _controller,
              onDetect: (BarcodeCapture capture) {
                final List<Barcode> barcodes = capture.barcodes;

                if (barcodes.first.rawValue != null) {
                  context.read<HomeViewCubit>().getTaskById(
                        barcodes.first.rawValue!,
                      );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
