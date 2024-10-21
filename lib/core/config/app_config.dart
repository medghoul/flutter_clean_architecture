class AppConfig {
  AppConfig._();

  static late final String apiBaseUrl;
  static late final String apiKey;

  static void initialize() {
    apiBaseUrl = const String.fromEnvironment('API_BASE_URL');
    apiKey = const String.fromEnvironment('API_KEY');
  }
}