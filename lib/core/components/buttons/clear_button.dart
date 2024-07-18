import 'package:flutter/material.dart';
import 'package:linguify/theme/app_theme.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(14),
          child: IconButton(
            icon: const Icon(
              Icons.clear,
              color: AppColors.dividerColor,
            ),
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
