// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/components/snackbar/snack_bar_extension.dart';
import '../core/constants/image_constants.dart';
import '../core/providers/translation_provider.dart';
import '../core/repository/repository.dart';
import '../theme/app_theme.dart';
import 'home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    getLanguages();
    super.initState();
  }

  Future<void> getLanguages() async {
    try {
      final languageModel = await TranslationRepository().getLanguageList();

      final provider = context.read<TranslationProvider>();

      provider.languageList?.addAll(languageModel.languages ?? []);

      provider
        ..changeInputLanguage(languageModel.languages?.first)
        ..changeOutputLanguage(languageModel.languages?.first);

      Future.delayed(
        const Duration(seconds: 1),
        () async => Navigator.of(context).pushReplacement(
          PageRouteBuilder<dynamic>(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (_, __, ___) => const HomeView(),
          ),
        ),
      );
    } on DioException catch (e) {
      print(e.message);
      if (e.error is SocketException) {
        context.showErrorMessage(
          message: 'No Internet Connection',
          onRetryAction: getLanguages,
          errorIcon: const Icon(Icons.wifi_off),
        );
      } else if (e.response?.statusCode == 429) {
        context.showErrorMessage(
          message: 'Free trial is ended. Please refresh your token',
          onRetryAction: getLanguages,
          errorIcon: const Icon(Icons.payments_sharp),
        );
      } else {
        context.showErrorMessage(
          message: 'Something went wrong',
          onRetryAction: getLanguages,
          errorIcon: const Icon(Icons.error_outline),
        );
      }
    } catch (e) {
      context.showErrorMessage(
        message: 'Something went wrong',
        onRetryAction: getLanguages,
        errorIcon: const Icon(Icons.error_outline),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Hero(
          tag: 'linguifyLogo',
          child: Image.asset(ImageConstants.appIconPath),
        ),
      ),
    );
  }
}
