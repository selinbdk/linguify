// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../theme/app_theme.dart';
// import '../../view/home_view.dart';
// import '../providers/validation_provider.dart';
// import 'snackbar/snack_bar_extension.dart';

// class InternetCheck {
//   Future<void> displayInternetStatus(BuildContext context) async {
//     final validationProvider = context.read<ValidationProvider>();

//     await validationProvider.checkInternetConnection();

//     if (validationProvider.hasInternet == false) {
//       context.showErrorMessage(
//           message: 'There is no Internet Connection!',
//           errorIcon: const Icon(
//             Icons.wifi_off_rounded,
//             color: AppColors.labelColor,
//           ),
//           onRetryAction: () async {
//             await validationProvider.checkInternetConnection();
//             if (validationProvider.hasInternet == true) {
//               Future.delayed(
//                 const Duration(seconds: 1),
//                 () async => Navigator.of(context).pushReplacement(
//                   PageRouteBuilder<dynamic>(
//                     transitionDuration: const Duration(seconds: 1),
//                     pageBuilder: (_, __, ___) => const HomeView(),
//                   ),
//                 ),
//               );
//             } else {
//               displayInternetStatus;
//             }
//           });
//     }
//   }
// }
