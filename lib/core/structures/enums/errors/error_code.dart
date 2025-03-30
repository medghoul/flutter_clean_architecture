part 'error_domain.dart';

enum ErrorCode {
  // API Default Errors: 0x00 - 0x0F
  unauthorized(code: 0x00, domain: ErrorDomain.api, label: 'unauthorized'),
  forbidden(code: 0x01, domain: ErrorDomain.api, label: 'forbidden'),
  notFound(code: 0x02, domain: ErrorDomain.api, label: 'not_found'),
  methodNotAllowed(code: 0x03, domain: ErrorDomain.api, label: 'method_not_allowed'),
  conflict(code: 0x04, domain: ErrorDomain.api, label: 'conflict'),
  payloadTooLarge(code: 0x05, domain: ErrorDomain.api, label: 'payload_too_large'),
  unsupportedAppVersion(code: 0x06, domain: ErrorDomain.api, label: 'unsupported_app_version'),
  nullData(code: 0x07, domain: ErrorDomain.api, label: 'null_data'),

  // Server Errors: 0x10 - 0x1F
  internalServerError(code: 0x10, domain: ErrorDomain.server, label: 'internal_server_error'),
  badGateway(code: 0x11, domain: ErrorDomain.server, label: 'bad_gateway'),
  serviceUnavailable(code: 0x12, domain: ErrorDomain.server, label: 'service_unavailable'),
  gatewayTimeout(code: 0x13, domain: ErrorDomain.server, label: 'gateway_timeout'),

  // Network Errors: 0x20 - 0x2F
  timeout(code: 0x20, domain: ErrorDomain.network, label: 'timeout'),
  connectionError(code: 0x21, domain: ErrorDomain.network, label: 'connection_error'),
  noInternetConnection(code: 0x22, domain: ErrorDomain.network, label: 'no_internet_connection'),
  
  unknown(code: 0xFF, domain: ErrorDomain.unknown, label: 'unknown');

  final int code;
  final ErrorDomain domain;
  final String label;

  const ErrorCode({required this.code, required this.domain, required this.label});
}
