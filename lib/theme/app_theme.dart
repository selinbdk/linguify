import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundColor = Color(0xFFd4f2fa);

  static const Color text = Colors.black;

  static const Color dividercolor = Color.fromARGB(255, 0, 55, 98);
}

class AppPadding {
  static const EdgeInsets pagePadding =
      EdgeInsets.symmetric(vertical: 16, horizontal: 12);
}

sealed class AppSpacing {
  static const _kValue = 20;

  static SizedBox get smallVerticalSpace => const SizedBox(height: _kValue * 1);
  static SizedBox get mediumVerticalSpace =>
      const SizedBox(height: _kValue * 2);
  static SizedBox get largeVerticalSpace => const SizedBox(height: _kValue * 3);
}

//* context.pagePadding
// extension AppThemeExtension on BuildContext {
//   EdgeInsets get pagePadding =>
//       const EdgeInsets.symmetric(vertical: 16, horizontal: 12);
// }
