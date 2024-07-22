import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:linguify/theme/app_theme.dart';

class SelectionButton<T> extends StatelessWidget {
  const SelectionButton({
    super.key,
    required this.result,
    required this.onChanged,
    required this.itemList,
    required this.texts,
  }) : assert(itemList?.length == texts?.length,
            'ITEM LIST AND TEXTS LIST MUST BE SAME LENGHT');

  final void Function(T? model)? onChanged;
  final List<T?>? itemList;
  final T result;
  final List<String?>? texts;

  @override
  Widget build(BuildContext context) {
    return DropdownButton2<T>(
      iconStyleData: const IconStyleData(
        iconEnabledColor: AppColors.dividerColor,
      ),
      dropdownStyleData: const DropdownStyleData(maxHeight: 500),
      value: result,
      items: List.generate(
        itemList?.length ?? 0,
        (index) {
          return DropdownMenuItem<T>(
            value: itemList?[index],
            child: Text(texts?[index] ?? ''),
          );
        },
      ),
      onChanged: onChanged,
    );
  }
}
