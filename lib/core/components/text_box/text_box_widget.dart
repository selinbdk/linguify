import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linguify/core/components/snack_bar_extension.dart';
import 'package:linguify/core/providers/validation_provider.dart';
import 'package:linguify/theme/app_theme.dart';
import 'package:provider/provider.dart';

part 'clear_button.dart';
part 'copy_button.dart';

class TextBoxWidget extends StatelessWidget {
  const TextBoxWidget({
    super.key,
    required this.controller,
    this.hintText,
    this.validator,
    this.onChanged,
  })  : _hasClearButton = false,
        _hasCopyButton = false;

  const TextBoxWidget.withCopy({
    super.key,
    required this.controller,
    this.hintText,
    this.validator,
    this.onChanged,
  })  : _hasClearButton = false,
        _hasCopyButton = true;

  const TextBoxWidget.withClear({
    super.key,
    required this.controller,
    this.hintText,
    this.validator,
    this.onChanged,
  })  : _hasClearButton = true,
        _hasCopyButton = false;

  final String? hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  final bool _hasClearButton;
  final bool _hasCopyButton;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        suffixIcon: switch ((_hasClearButton, _hasCopyButton)) {
          (true, false) => _ClearButton(controller),
          (false, true) => _CopyButton(controller),
          (_, _) => const SizedBox.shrink(),
        },
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
