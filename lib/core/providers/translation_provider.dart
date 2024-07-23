import 'package:flutter/material.dart';
import 'package:linguify/core/models/request/translate_request_model/translate_request_model.dart';
import 'package:linguify/core/models/response/language_listings/language_model.dart';

class TranslationProvider extends ChangeNotifier {
  LanguageModel? _currentForInput;
  LanguageModel? _currentForOutput;
  LanguageModel? _detectedLanguage;

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

  final List<LanguageModel?>? languageList = [];

  final List<TranslateRequestModel?>? translatedTextList = [];

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
