import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static String baseUrl = dotenv.env["base_url"] ?? "";

  static String apiToken = dotenv.env["api-token"] ?? "";
}
