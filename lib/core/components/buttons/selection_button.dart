import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class SelectionButton<T> extends StatelessWidget {
  const SelectionButton({
    required this.result,
    required this.onChanged,
    required this.itemList,
    required this.texts,
    super.key,
  }) : assert(itemList?.length == texts?.length, 'ITEM LIST AND TEXTS LIST MUST BE SAME LENGHT');

  final void Function(T? model)? onChanged;
  final List<T?>? itemList;
  final T result;
  final List<String?>? texts;

  @override
  Widget build(BuildContext context) {
    return DropdownButton2<T>(
      underline: Container(height: 1, color: AppColors.dividerColor),

      style: const TextStyle(color: AppColors.dividerColor),

      //barrierColor: AppColors.dividerColor,
      iconStyleData: const IconStyleData(iconEnabledColor: AppColors.dividerColor),
      dropdownStyleData: const DropdownStyleData(
        maxHeight: 500,
        decoration: BoxDecoration(color: AppColors.backgroundColor),
      ),

      value: result,
      items: List.generate(
        itemList?.length ?? 0,
        (index) {
          final isSelected = itemList?[index] == result;

          return DropdownMenuItem<T>(
            value: itemList?[index],
            child: Text(
              texts?[index] ?? '',
              style: TextStyle(
                shadows: isSelected
                    ? const [
                        Shadow(
                          color: AppColors.dividerColor,
                          blurRadius: 2,
                          offset: Offset(1, 1),
                        ),
                      ]
                    : [],
                fontSize: 18,
                color: isSelected ? AppColors.dividerColor : const Color.fromARGB(192, 0, 0, 0),
              ),
            ),
          );
        },
      ),
      onChanged: onChanged,
    );
  }
}
