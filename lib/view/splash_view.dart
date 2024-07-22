import 'package:flutter/material.dart';
import 'package:linguify/core/constants/image_constants.dart';
import 'package:linguify/core/providers/translation_provider.dart';
import 'package:linguify/core/repository/repository.dart';
import 'package:linguify/theme/app_theme.dart';
import 'package:linguify/view/home_view.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    //todo(selin): burada repoya istek atılacak

    TranslationRepository().getLanguageList().then(
      (languageModel) async {
        final provider = context.read<TranslationProvider>();

        provider.languageList?.addAll(languageModel.languages ?? []);

        provider.changeInputLanguage(languageModel.languages?.first);
        provider.changeOutputLanguage(languageModel.languages?.first);

        await Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (_, __, ___) => const HomeView(),
          ),
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Hero(
          tag: "linguifyLogo",
          child: Image.asset(ImageConstants.appIconPath),
        ),
      ),
    );
  }
}
