import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linguify/core/components/snack_bar_extension.dart';
import 'package:linguify/theme/app_theme.dart';

class TextBoxWidget extends StatelessWidget {
  const TextBoxWidget({
    super.key,
    required this.controller,
    this.hasCopyButton = false,
    this.hasClearButton = false,
    this.hintText,
    this.validateDigit,
    this.formKey,
  });

  final String? hintText;
  final TextEditingController controller;
  final bool hasClearButton;
  final bool hasCopyButton;
  final String? Function(String?)? validateDigit;
  final GlobalKey<FormState>? formKey;
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validateDigit,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: AppColors.dividerColor,
      controller: controller,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.top,
      maxLines: null,
      maxLength: 50,
      expands: true,
      maxLengthEnforcement: MaxLengthEnforcement.none,
      decoration: InputDecoration(
        //errorText: validateDigit,
        contentPadding: const EdgeInsets.only(
          right: 12,
          left: 12,
          bottom: 0,
          top: 36,
        ),

        suffixIcon: Builder(
          builder: (context) {
            if (hasClearButton) {
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
                        onPressed: () {
                          controller.clear();
                          //formKey.currentState!.validate();
                        }),
                  ),
                ],
              );
            } else if (hasCopyButton) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: IconButton(
                      icon:
                          const Icon(Icons.copy, color: AppColors.dividerColor),
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(
                            text: controller.text,
                          ),
                        ).then(
                          (_) {
                            context.showErrorMessage(
                              message:"There is no Internet Connection!"
                              //message: "Copied Successfully!",
                            );
                            // ScaffoldMessenger.of(context)
                            //     .showSnackBar(SnackBarWidget.snackBarForCopy());
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
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
