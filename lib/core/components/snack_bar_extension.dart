import 'package:flutter/material.dart';
import 'package:linguify/theme/app_theme.dart';

extension SnackbarManager on BuildContext {
  void showSuccessMessage() {}

  void showInfoMessage({required String message}) {
    final snackbar = SnackBar(
      content: Text(message),
      backgroundColor: AppColors.snackBarColor,
    );

    ScaffoldMessenger.of(this).showSnackBar(snackbar);
  }

  //*
  void showErrorMessage({
    required String message,
    Widget? internetIcon,
    void Function()? onRetryAction,
  }) {
    if (onRetryAction == null) {
      final snackbar = SnackBar(
        duration: const Duration(seconds: 8),
        content: Row(
          children: [
            internetIcon ?? const SizedBox.shrink(),
            AppSpacing.smallHorizontalSpace,
            Text(message),
          ],
        ),
        backgroundColor: AppColors.focusedErrorBorder,
      );
      ScaffoldMessenger.of(this).showSnackBar(snackbar);
    } 
    else {
      final snackbar = SnackBar(
        duration: const Duration(seconds: 8),
        content: Row(
          children: [
            internetIcon ?? const SizedBox.shrink(),
            AppSpacing.smallHorizontalSpace,
            Text(message),
          ],
        ),
        backgroundColor: AppColors.focusedErrorBorder,
        action: SnackBarAction(
          //backgroundColor: AppColors.dividerColor,
          label: "Retry",
          textColor: AppColors.labelColor,
          onPressed: () => (),
        ),
      );
        ScaffoldMessenger.of(this).showSnackBar(snackbar);
      
    }
  }
}
