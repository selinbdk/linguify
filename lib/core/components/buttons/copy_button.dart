import 'package:flutter/material.dart';
import 'package:linguify/theme/app_theme.dart';

class CopyButton extends StatelessWidget {
  const CopyButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: IconButton(
            icon: const Icon(Icons.copy, color: AppColors.dividerColor),
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
