import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotenvWrapper {
  static const String apiKey = 'API_KEY';

  DotenvWrapper._();
  static final DotenvWrapper instance = DotenvWrapper._();

  Future<void> load() async {
    await dotenv.load(fileName: ".env");
  }

  String? getValue(String key) {
    return dotenv.env[key];
  }
}