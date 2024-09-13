import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';

class DefaultErrorWidget extends StatelessWidget {
  const DefaultErrorWidget({
    super.key,
    required this.errMessage,
    required this.onTryAgainPressed,
  });

  final String errMessage;
  final void Function() onTryAgainPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.error_outline,
          color: kSecondaryColor,
        ),
        const SizedBox(height: 2),
        Text(
          errMessage,
          textAlign: TextAlign.center,
          style: AppStyles.text14,
        ),
        const SizedBox(height: 4),
        TextButton(
          onPressed: onTryAgainPressed,
          style: TextButton.styleFrom(
            backgroundColor: kCardColor,
          ),
          child: const Text('Try Again'),
        ),
      ],
    );
  }
}
