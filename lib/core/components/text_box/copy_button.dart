// ignore_for_file: use_build_context_synchronously

part of 'text_box_widget.dart';

class _CopyButton extends StatelessWidget {
  const _CopyButton(this.controller);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: IconButton(
            icon: const Icon(Icons.copy, color: AppColors.dividerColor),
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: controller.text));
              context.showInfoMessage(message: "Copied Successfully!");
            },
          ),
        ),
      ],
    );
  }
}
