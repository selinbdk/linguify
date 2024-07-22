import 'package:dio/dio.dart';
import 'package:linguify/core/constants/app_constants.dart';
import 'package:linguify/core/models/request/translate_request_model/translate_request_model.dart';
import 'package:linguify/core/models/response/detect_language_result_model/detect_language_result_model.dart';
import 'package:linguify/core/models/response/language_listings/language_listings_model.dart';

class TranslationRepository {
  //* Get list of languages
  Future<LanguageListingsModel> getLanguageList() async {
    final response =
        await Dio().get(AppConstants.baseUrl + AppConstants.getListPath);

    final data = response.data;

    final languageModel =
        LanguageListingsModel.fromJson(data as Map<String, dynamic>);

    return languageModel;
  }

  //* Detect the languages
  Future<DetectLanguageResultModel> detectLanguage() async {
    final response = await Dio()
        .post(AppConstants.baseUrl + AppConstants.detectLanguagePath);

    final data = response.data;

    final detectLanguageResultModel =
        DetectLanguageResultModel.fromJson(data as Map<String, dynamic>);

    return detectLanguageResultModel;
  }

  //*Translate text
  Future<TranslateRequestModel> translateText() async {
    final response =
        await Dio().post(AppConstants.baseUrl + AppConstants.translateTextPath);

    final data = response.data;

    final translateRequestModel =
        TranslateRequestModel.fromJson(data as Map<String, dynamic>);

    return translateRequestModel;
  }
}
