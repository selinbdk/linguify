import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundColor = Color(0xFFd4f2fa);

  static const Color text = Colors.black;

  static const Color dividerColor = Color.fromARGB(255, 0, 55, 98);

  static const Color enabledBorder = Colors.black45;

  static const Color focusedBorder = Colors.black87;

  static const Color errorBorder = Colors.red;

  static const Color focusedErrorBorder = Color.fromARGB(255, 200, 18, 5);

  static const Color snackBarColor = Color.fromARGB(255, 0, 55, 98);

  static const Color labelColor = Colors.white;

  static const Color translateButtonColor = Color.fromARGB(255, 0, 55, 98);

  static const Color languageListColor = Color.fromARGB(180, 0, 0, 0);

  
}

class AppPadding {
  static const EdgeInsets pagePadding = EdgeInsets.symmetric(vertical: 16, horizontal: 12);
}

sealed class AppSpacing {
  static const _kValue = 20;

  static SizedBox get smallVerticalSpace => const SizedBox(height: _kValue * 1);
  static SizedBox get smallHorizontalSpace => const SizedBox(width: _kValue * 1);

  static SizedBox get mediumVerticalSpace => const SizedBox(height: _kValue * 2);
  static SizedBox get largeVerticalSpace => const SizedBox(height: _kValue * 3);
  static SizedBox get megaLargeVertical => const SizedBox(height: _kValue * 3 * 2);
}

//* context.pagePadding
// extension AppThemeExtension on BuildContext {
//   EdgeInsets get pagePadding =>
//       const EdgeInsets.symmetric(vertical: 16, horizontal: 12);
// }
