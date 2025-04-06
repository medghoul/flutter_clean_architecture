import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.freezed.dart';

@freezed
abstract class ApiError with _$ApiError {
  const factory ApiError.noConnection({
    String? message,
  }) = _NoConnection;

  const factory ApiError.timeout({
    String? message,
  }) = _Timeout;

  const factory ApiError.unauthorized({
    String? message,
    String? code,
  }) = _Unauthorized;

  const factory ApiError.notFound({
    String? message,
    String? resource,
  }) = _NotFound;

  const factory ApiError.serverError({
    String? message,
    String? stackTrace,
  }) = _ServerError;

  const factory ApiError.badRequest({
    String? message,
    Map<String, dynamic>? errors,
  }) = _BadRequest;

  const factory ApiError.forbidden({
    String? message,
    String? reason,
  }) = _Forbidden;

  const factory ApiError.unexpected({
    String? message,
    dynamic error,
  }) = _Unexpected;

  factory ApiError.fromDioError(DioException error) {
    final response = error.response?.data;
    final message = _extractErrorMessage(response);

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiError.timeout(
          message: message ?? 'Connection timed out',
        );

      case DioExceptionType.connectionError:
        return ApiError.noConnection(
          message: message ?? 'No internet connection',
        );

      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case 400:
            return ApiError.badRequest(
              message: message ?? 'Bad request',
              errors: _extractValidationErrors(response),
            );

          case 401:
            return ApiError.unauthorized(
              message: message ?? 'Unauthorized',
              code: _extractErrorCode(response),
            );

          case 403:
            return ApiError.forbidden(
              message: message ?? 'Access denied',
              reason: _extractForbiddenReason(response),
            );

          case 404:
            return ApiError.notFound(
              message: message ?? 'Resource not found',
              resource: _extractResourceName(response),
            );

          case 500:
          case 502:
          case 503:
          case 504:
            return ApiError.serverError(
              message: message ?? 'Server error',
              stackTrace: error.stackTrace?.toString(),
            );

          default:
            return ApiError.unexpected(
              message: message ?? 'Unexpected error',
              error: error.error,
            );
        }

      default:
        return ApiError.unexpected(
          message: message ?? 'Unexpected error',
          error: error.error,
        );
    }
  }

  /// Estrae il messaggio di errore dalla risposta
  static String? _extractErrorMessage(dynamic response) {
    if (response == null) return null;

    if (response is Map<String, dynamic>) {
      return response['message'] as String? ??
          response['error'] as String? ??
          response['error_description'] as String?;
    }

    if (response is String) return response;
    return null;
  }

  /// Estrae gli errori di validazione
  static Map<String, dynamic>? _extractValidationErrors(dynamic response) {
    if (response is! Map<String, dynamic>) return null;
    return response['errors'] as Map<String, dynamic>?;
  }

  /// Estrae il codice di errore
  static String? _extractErrorCode(dynamic response) {
    if (response is! Map<String, dynamic>) return null;
    return response['error_code'] as String? ?? response['code'] as String?;
  }

  /// Estrae la ragione del forbidden
  static String? _extractForbiddenReason(dynamic response) {
    if (response is! Map<String, dynamic>) return null;
    return response['reason'] as String?;
  }

  /// Estrae il nome della risorsa non trovata
  static String? _extractResourceName(dynamic response) {
    if (response is! Map<String, dynamic>) return null;
    return response['resource'] as String?;
  }
}
