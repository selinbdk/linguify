import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextBoxWidget extends StatelessWidget {
  const TextBoxWidget({
    super.key,
    required this.hintText,
    required this.controller,
  });

  final String? hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
        suffixIcon: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: IconButton(
                icon: const Icon(
                  Icons.clear,
                ),
                onPressed: () => controller.clear(),
              ),
            ),
          ],
        ),
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 4,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 4,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 4,
            color: Colors.red,
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
