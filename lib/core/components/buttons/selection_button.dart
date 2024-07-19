import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:linguify/theme/app_theme.dart';

class SelectionButton extends StatelessWidget {
  SelectionButton({
    super.key,
    this.onChanged,
    required this.result,
  });

  final void Function(String?)? onChanged;

  //final List<DropdownMenuItem> languages2 = [];
  final List<String> languages = <String>[
    "Turkish",
    "English",
    "Spanish33",
    "Spanish52",
    "Spanish2",
  ];

  final String result;

  @override
  Widget build(BuildContext context) {
    return DropdownButton2(
      iconStyleData: const IconStyleData(
        iconEnabledColor: AppColors.dividerColor,
      ),
      dropdownStyleData: const DropdownStyleData(
        maxHeight: 500,
      ),
      value: result,
      items: languages.map<DropdownMenuItem<String>>(
        (String language) {
          return DropdownMenuItem<String>(
            value: language,
            child: Text(language),
          );
        },
      ).toList(),
      onChanged: onChanged,
    );

    //onPressed: () => SampleProvider().translateText()
  }
}


// onChanged: (String? newValue) {
//         setState(() {
//           result = newValue!;
//         });
//       },