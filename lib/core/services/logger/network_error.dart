import 'package:dio/dio.dart';

/// Base class for network errors in the application.
///
/// This abstract class extends [DioException] to provide a standardized way of
/// handling network-related errors throughout the application. It adds additional
/// functionality for error classification and handling.
abstract class NetworkError extends DioException {
  /// A string representation of the HTTP status code.
  ///
  /// This value can be used to identify specific types of errors and
  /// handle them appropriately. It may be null if the error occurred
  /// before receiving a response from the server.
  final String? statusCodeValue;

  /// Creates a new [NetworkError] instance.
  ///
  /// Parameters:
  /// - [dioException]: The original [DioException] that triggered this error
  /// - [statusCodeValue]: Optional status code value to associate with this error
  ///
  /// The constructor forwards all relevant information from the original
  /// [DioException] to ensure no error context is lost.
  NetworkError(DioException dioException, {this.statusCodeValue})
      : super(
          requestOptions: dioException.requestOptions,
          response: dioException.response,
          error: dioException.error,
          type: dioException.type,
        );

  /// Flag indicating if this error should be shown in production.
  ///
  /// Implementations can override this to control error visibility in
  /// production environments. By default, returns true.
  bool get showInProduction => true;

  /// The error code associated with this error.
  ///
  /// This getter should be implemented by subclasses to provide
  /// specific error codes that can be used for error handling and logging.
  String? get getErrorCode;
}
