import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class CopyButton extends StatelessWidget {
  const CopyButton({required this.onPressed, super.key});

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
