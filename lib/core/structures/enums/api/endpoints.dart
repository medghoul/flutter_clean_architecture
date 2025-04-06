part of 'index.dart';
enum ApiEndpoints { auth, accounts, offers, reports, articles, history }

extension RequestExtension on ApiEndpoints {
  String get value {
    switch (this) {
      case ApiEndpoints.auth:
        return "/auth";
      case ApiEndpoints.accounts:
        return "/accounts";
      case ApiEndpoints.offers:
        return "/offers";
      case ApiEndpoints.reports:
        return "/reports";
      case ApiEndpoints.articles:
        return "/articles";
      case ApiEndpoints.history:
        return "/history";
    }
  }
}
