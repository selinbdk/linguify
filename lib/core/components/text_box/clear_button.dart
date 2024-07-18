part of 'text_box_widget.dart';

class _ClearButton extends StatelessWidget {
  const _ClearButton(this.controller);

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(14),
          child: Consumer<ValidationProvider>(
            builder: (_, provider, __) {
              return IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: AppColors.dividerColor,
                ),
                onPressed: () {
                  controller.clear();
                  provider.validateForm();
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
