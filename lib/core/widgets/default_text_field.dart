import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    super.key,
    this.hintText,
    this.isHiddenPassword = false,
    this.suffix,
    this.prefix,
    this.validator,
    this.controller,
    this.onChanged,
    this.hintStyle,
    this.textInputColor = kBlackColor,
    this.textInputStyle,
    this.keyboardType,
    this.initialValue,
    this.contentPadding,
    this.focusNode,
    this.autofocus = false,
    this.maxLines = 1,
    this.maxLength,
    this.inputFormatters,
    this.textInputAction,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onTapOutside,
    this.onTap,
  });

  final String? hintText;
  final bool isHiddenPassword;
  final Widget? suffix;
  final Widget? prefix;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextStyle? hintStyle;
  final Color textInputColor;
  final TextStyle? textInputStyle;
  final TextInputType? keyboardType;
  final String? initialValue;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;
  final bool autofocus;
  final int maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isHiddenPassword,
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      initialValue: initialValue,
      focusNode: focusNode,
      autofocus: autofocus,
      maxLines: maxLines,
      maxLength: maxLength,
      textInputAction: textInputAction,
      style: textInputStyle ??
          AppStyles.text14.copyWith(
            color: textInputColor,
            fontWeight: FontWeight.w700,
          ),
      inputFormatters: inputFormatters,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      onTap: onTap,

      // text field decoration
      decoration: InputDecoration(
        enabledBorder: _fieldBorder(),
        border: _fieldBorder(),
        hintText: hintText,
        hintStyle: hintStyle ?? AppStyles.text14.copyWith(color: kStrokeColor),
        prefixIcon: prefix,
        suffixIcon: suffix,
        suffixIconColor: WidgetStateColor.resolveWith(
          (states) => states.contains(WidgetState.focused)
              ? kPrimaryColor
              : kStrokeColor,
        ),
        filled: true,
        fillColor: Colors.white,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
        prefixIconConstraints: BoxConstraints(
          minHeight: 35.h,
          minWidth: 48.w,
        ),
        suffixIconConstraints: BoxConstraints(
          minHeight: 35.h,
          minWidth: 48.w,
        ),
      ),
    );
  }

  OutlineInputBorder _fieldBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0.r),
      borderSide: const BorderSide(color: kStrokeColor),
    );
  }
}
