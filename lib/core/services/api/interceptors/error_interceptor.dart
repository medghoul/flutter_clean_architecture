import 'package:clean_architecture/core/services/api/models/api_error.dart';
import 'package:clean_architecture/core/services/logger/logging.dart';
import 'package:dio/dio.dart';


class ErrorInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final logger = staticLogger;

    // Log request details in a structured way
    final requestInfo = {
      'method': options.method,
      'url': '${options.baseUrl}${options.path}',
      'headers': options.headers,
      'queryParameters': options.queryParameters,
      'body': options.data,
    };

    logger.d('🌐 API Request', error: requestInfo);
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final logger = staticLogger;
    final apiError = ApiError.fromDioError(err);

    final errorInfo = {
      'url': '${err.requestOptions.baseUrl}${err.requestOptions.path}',
      'method': err.requestOptions.method,
      'statusCode': err.response?.statusCode,
      'type': err.type.toString(),
      'apiError': apiError.toString(),
      'responseData': err.response?.data,
      'requestData': err.requestOptions.data,
    };

    logger.e('❌ API Error', error: errorInfo, stackTrace: err.stackTrace);

    // Modifica l'errore per includere l'ApiError
    final error = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: apiError,
    );

    handler.next(error);
  }
}
