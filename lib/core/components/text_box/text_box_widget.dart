import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linguify/theme/app_theme.dart';

class TextBoxWidget extends StatelessWidget {
  const TextBoxWidget({
    super.key,
    required this.controller,
    this.suffix,
    this.hintText,
    this.validator,
    this.onChanged,
    required this.readOnly,
  });

  final Widget? suffix;
  final String? hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: AppColors.dividerColor,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.top,
      maxLines: null,
      maxLength: 50,
      expands: true,
      maxLengthEnforcement: MaxLengthEnforcement.none,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          right: 12,
          left: 12,
          bottom: 0,
          top: 36,
        ),
        suffixIcon: suffix,
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.enabledBorder,
            width: 4,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.focusedBorder,
            width: 4,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: AppColors.errorBorder,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 4,
            color: AppColors.focusedErrorBorder,
          ),
        ),
      ),
      // buildCounter: (
      //   context, {
      //   required int currentLength,
      //   required bool isFocused,
      //   maxLength,
      // }) {
      //   return const SizedBox.shrink();
      // },
    );
  }
}
