import 'package:dio/dio.dart';

import '../constants/api_constants.dart';
import '../constants/app_constants.dart';
import '../models/request/translate_request_model/translate_request_model.dart';
import '../models/response/detect_language_result_model/detect_language_result_model.dart';
import '../models/response/language_listings/language_listings_model.dart';
import '../models/response/translate_result_model/translate_result_model.dart';

class TranslationRepository {
  //* Get list of languages
  Future<LanguageListingsModel> getLanguageList() async {
    try {
      final response = await Dio().get(
        AppConstants.baseUrl + ApiConstants.getListPath,
        options: Options(
          headers: {'X-API-Key': AppConstants.apiToken},
        ),
      );

      final data = response.data;

      // final data = await readListOfLanguages();

      final languageModel = LanguageListingsModel.fromJson(data as Map<String, dynamic>);

      return languageModel;
    } on DioException catch (dioError) {
      print(dioError);
      rethrow;
    } catch (e) {
      //* something went wrong
      print(e);
      rethrow;
    }
  }

  //* Detect the languages
  Future<DetectLanguageResultModel> detectLanguage(String userText) async {
    try {
      final response = await Dio().post(
        AppConstants.baseUrl + ApiConstants.detectLanguagePath,
        data: {
          'texts': [userText]
        },
        options: Options(
          headers: {'X-API-Key': AppConstants.apiToken},
        ),
      );

      final data = response.data;

      final detectLanguageResultModel = DetectLanguageResultModel.fromJson(data! as Map<String, dynamic>);

      return detectLanguageResultModel;
    } on DioException catch (e) {
      print(e);
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  //*Translate text
  Future<TranslateResultModel> translateText(TranslateRequestModel request) async {
    try {
      final response = await Dio().post(
        AppConstants.baseUrl + ApiConstants.translateTextPath,
        data: request.toJson(),
        options: Options(
          headers: {'X-API-Key': AppConstants.apiToken},
        ),
      );

      final data = response.data;

      final translateResultModel = TranslateResultModel.fromJson(data as Map<String, dynamic>);

      return translateResultModel;
    } on DioException catch (e) {
      print(e);
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
