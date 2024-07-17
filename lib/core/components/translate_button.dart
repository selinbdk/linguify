//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:linguify/theme/app_theme.dart';

class TranslateButton extends StatefulWidget {
  const TranslateButton({
    super.key,
    required this.message,
    this.onPressed,
    required this.inputController,
    required this.isDisabledButton,
    
  });

  final String? message;
  final void Function()? onPressed;
  final TextEditingController inputController;
  final bool Function(TextEditingController inputController) isDisabledButton;
  


  @override
  State<TranslateButton> createState() => _TranslateButtonState();
}

class _TranslateButtonState extends State<TranslateButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.translateButtonColor,
      ),
      onPressed: widget.isDisabledButton(widget.inputController)==true ? null : () {},

      child: Text(
        widget.message ?? "",
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
