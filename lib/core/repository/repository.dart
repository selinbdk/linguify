import 'package:dio/dio.dart';
import 'package:linguify/core/constants/api_constants.dart';
import 'package:linguify/core/constants/app_constants.dart';
import 'package:linguify/core/models/request/translate_request_model/translate_request_model.dart';
import 'package:linguify/core/models/response/detect_language_result_model/detect_language_result_model.dart';
import 'package:linguify/core/models/response/language_listings/language_listings_model.dart';
import 'package:linguify/core/utils/json_reader.dart';

class TranslationRepository {
  //* Get list of languages
  Future<LanguageListingsModel> getLanguageList() async {
    try {
      // final response = await Dio().get(
      //   AppConstants.baseUrl + ApiConstants.getListPath,
      //   options: Options(
      //     headers: {'X-API-Key': AppConstants.apiToken},
      //   ),
      // );

      // final data = response.data;

      final data = await readListOfLanguages();

      final languageModel =
          LanguageListingsModel.fromJson(data as Map<String, dynamic>);

      return languageModel;
    } on Exception catch (e) {
      rethrow;
    }
  }

  //* Detect the languages
  Future<DetectLanguageResultModel> detectLanguage(String userText) async {
    try {
      final response = await Dio().post(
        AppConstants.baseUrl + ApiConstants.detectLanguagePath,
        data: {
          "texts": [userText]
        },
        options: Options(
          headers: {'X-API-Key': AppConstants.apiToken},
        ),
      );

      final data = response.data;

      final detectLanguageResultModel =
          DetectLanguageResultModel.fromJson(data as Map<String, dynamic>);

      return detectLanguageResultModel;
    } on Exception catch (e) {
      print(e);

      rethrow;
    }
  }

  //*Translate text
  Future<TranslateRequestModel> translateText() async {
    final response = await Dio().post(
      AppConstants.baseUrl + ApiConstants.translateTextPath,
      options: Options(
        headers: {'X-API-Key': AppConstants.apiToken},
      ),
    );

    final data = response.data;

    final translateRequestModel =
        TranslateRequestModel.fromJson(data as Map<String, dynamic>);

    return translateRequestModel;
  }
}
