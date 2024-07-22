import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static String baseUrl = dotenv.env["base_url"] ?? "";

  static String detectLanguagePath = dotenv.env["detect_language_path"] ?? "";

  static String getListPath = dotenv.env["get_list_path"] ?? "";

  static String translateTextPath = dotenv.env["translate_text_path"] ?? "";
}
