import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
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
