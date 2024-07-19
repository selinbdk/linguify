import 'package:flutter/material.dart';

class TranslationProvider extends ChangeNotifier {
  String currentForInput = "Turkish";
  String currentForOutput = "English";

  void inputCurrentLanguage(String value) {
    currentForInput = value;
    notifyListeners();
  }

  void outputCurrentLanguage(String value) {
    currentForOutput = value;
    notifyListeners();
  }
}
