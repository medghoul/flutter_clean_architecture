class AppConfig {
  AppConfig({
    required this.host,
    required this.isProd,
    required this.apiKey,
  });

  final String host;
  final bool isProd;
  final String apiKey;
}
