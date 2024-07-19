//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:linguify/theme/app_theme.dart';

class TranslateButton extends StatelessWidget {
  const TranslateButton({
    super.key,
    required this.message,
    required this.onPressed,
  });

  final String? message;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.translateButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        message ?? "",
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
