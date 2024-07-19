import 'package:flutter/material.dart';
import 'package:linguify/core/constants/image_constants.dart';
import 'package:linguify/theme/app_theme.dart';
import 'package:linguify/view/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    //todo(selin): burada repoya istek atılacak

    Future.delayed(
      const Duration(seconds: 1),
      () async {
        await Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (_, __, ___) => const HomeView(),
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
        //* Hero
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Image.asset(ImageConstants.appIconPath),
      ),
    );
  }
}
