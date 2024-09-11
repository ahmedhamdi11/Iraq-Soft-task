import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
