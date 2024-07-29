//import 'dart:html';

import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class TranslateButton extends StatelessWidget {
  const TranslateButton({
    required this.onPressed,
    super.key,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: AppColors.enabledBorder,
        backgroundColor: AppColors.translateButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: const Text(
        'Translate',
        style: TextStyle(
          color: AppColors.labelColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
