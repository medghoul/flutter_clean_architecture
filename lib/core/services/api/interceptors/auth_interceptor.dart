import 'package:clean_architecture/core/services/shared_preferences/shared_prefs_service.dart';
import 'package:clean_architecture/core/structures/enums.dart';
import 'package:dio/dio.dart';		

class AuthInterceptor extends Interceptor {		
  final SharedPreferencesService _prefs;		
  final Dio _dio;		
  bool _isRefreshing = false;		

  AuthInterceptor(this._prefs, this._dio);		

  @override		
  void onRequest(		
    RequestOptions options,		
    RequestInterceptorHandler handler,		
  ) async {		
    final token = _prefs.getValue<String>(PrefsKeys.token);		
    if (token != null) {		
      options.headers['Authorization'] = 'Bearer $token';		
    }		
    handler.next(options);		
  }		

  @override		
  Future<void> onError(		
      DioException err, ErrorInterceptorHandler handler) async {		
    if (err.response?.statusCode == 401 && !_isRefreshing) {		
      _isRefreshing = true;		
      try {		
        final refreshToken =		
            _prefs.getValue<String>(PrefsKeys.refreshToken);		
        if (refreshToken != null) {		
          final newToken = await _refreshToken(refreshToken);		
          if (newToken != null) {		
            // Salva il nuovo token		
            await _prefs.setValue(PrefsKeys.token, newToken);		

            // Ripeti la richiesta originale con il nuovo token		
            final response = await _retry(err.requestOptions, newToken);		
            _isRefreshing = false;		
            return handler.resolve(response);		
          }		
        }		
        // Se arriviamo qui, il refresh è fallito		
        _isRefreshing = false;		
        await _handleLogout();		
      } catch (e) {		
        _isRefreshing = false;		
        await _handleLogout();		
      }		
    }		
    return handler.next(err);		
  }		

  Future<String?> _refreshToken(String refreshToken) async {		
    try {		
      final response = await _dio.post(		
        ApiEndpoints.auth.value,		
        data: {		
          'refresh_token': refreshToken,		
        },		
      );		

      if (response.statusCode == 200) {		
        final newToken = response.data['access_token'] as String;		
        final newRefreshToken = response.data['refresh_token'] as String;		

        await _prefs.setValue(PrefsKeys.refreshToken, newRefreshToken);		

        return newToken;		
      }		
      return null;		
    } catch (e) {		
      return null;		
    }		
  }		

  Future<Response<dynamic>> _retry(		
    RequestOptions requestOptions,		
    String newToken,		
  ) async {		
    final options = Options(		
      method: requestOptions.method,		
      headers: {		
        ...requestOptions.headers,		
        'Authorization': 'Bearer $newToken',		
      },		
    );		

    return _dio.request<dynamic>(		
      requestOptions.path,		
      data: requestOptions.data,		
      queryParameters: requestOptions.queryParameters,		
      options: options,		
    );		
  }		

  Future<void> _handleLogout() async {		
    // Rimuovi i token		
    await _prefs.removeValue(PrefsKeys.token);		
    await _prefs.removeValue(PrefsKeys.refreshToken);				

    // TODO: Implementare la logica di logout (es. navigazione alla login page)		
    // Esempio:		
    // final navigationService = di<NavigationService>();		
    // navigationService.clearStackAndShow('/login');		
  }		
}