import 'package:flutter/material.dart';
import 'package:linguify/core/models/request/translate_request_model/translate_request_model.dart';
import 'package:linguify/core/models/response/language_listings/language_model.dart';

class TranslationProvider extends ChangeNotifier {
  LanguageModel? currentForInput;
  LanguageModel? currentForOutput;
  LanguageModel? detectedLanguage;

  final List<LanguageModel?>? languageList = [];

  final List<TranslateRequestModel?>? translatedTextList = [];

  void changeInputLanguage(LanguageModel? newInputLanguage) {
    if (newInputLanguage == null) return;

    currentForInput = newInputLanguage;
    notifyListeners();
  }

  void changeOutputLanguage(LanguageModel? newOutputLanguage) {
    if (newOutputLanguage == null) return;

    currentForOutput = newOutputLanguage;
    notifyListeners();
  }

  // void addToLanguageList(LanguageModel languageModel) {
  //   languageList.addAll(languageModel);
  //   notifyListeners();
  // }

  // void addForDetectingLanguage(DetectLanguageResultModel? detectLanguageModel) {
  //   detectedLanguageList.add(detectLanguageModel);
  //   notifyListeners();
  // }

  // void addForTranslateList(TranslateRequestModel? translateRequestModel) {
  //   translatedTextList.add(translateRequestModel);
  //   notifyListeners();
  // }
}
