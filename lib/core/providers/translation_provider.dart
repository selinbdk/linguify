import 'package:flutter/material.dart';

import '../models/response/language_listings/language_model.dart';

class TranslationProvider extends ChangeNotifier {
  LanguageModel? _currentForInput;
  LanguageModel? _currentForOutput;
  LanguageModel? _detectedLanguage;
  bool click = false;

  final List<LanguageModel?>? languageList = [];

  LanguageModel? get detectedLanguage => _detectedLanguage;
  LanguageModel? get currentForOutput => _currentForOutput;
  LanguageModel? get currentForInput => _currentForInput;

  set currentForInput(LanguageModel? languageModel) {
    _currentForInput = languageModel;
    notifyListeners();
  }

  set currentForOutput(LanguageModel? languageModel) {
    _currentForOutput = languageModel;
    notifyListeners();
  }

  set detectedLanguage(LanguageModel? languageModel) {
    _detectedLanguage = languageModel;
    notifyListeners();
  }

  void changeInputLanguage(LanguageModel? newInputLanguage) {
    if (newInputLanguage == null) return;
    _detectedLanguage = newInputLanguage;
    _currentForInput = newInputLanguage;
    notifyListeners();
  }

  void changeOutputLanguage(LanguageModel? newOutputLanguage) {
    if (newOutputLanguage == null) return;

    _currentForOutput = newOutputLanguage;
    notifyListeners();
  }
}
