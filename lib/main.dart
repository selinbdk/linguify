import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:linguify/core/providers/translation_provider.dart';
import 'package:linguify/core/providers/validation_provider.dart';
import 'package:linguify/view/splash_view.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ValidationProvider()),
        ChangeNotifierProvider(create: (context) => TranslationProvider()),
      ],
      child: const MaterialApp(
        home: SplashView(),
      ),
    );
  }
}
