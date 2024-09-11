import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// show toast
showToastMessage(
  String message, {
  Color? backgroundColor,
  Color? txtColor,
}) =>
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: backgroundColor,
      textColor: txtColor,
      toastLength: Toast.LENGTH_LONG,
    );

/// config loading
void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.chasingDots
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..backgroundColor = Colors.transparent
    ..indicatorSize = 55
    ..dismissOnTap = false
    ..maskType = EasyLoadingMaskType.black
    ..boxShadow = <BoxShadow>[];
}
