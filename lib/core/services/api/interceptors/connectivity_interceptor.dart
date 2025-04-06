import 'package:clean_architecture/core/network/network_info.dart';
import 'package:dio/dio.dart';		
		

class ConnectivityInterceptor extends Interceptor {		
  final NetworkInfo _networkInfo;		

  ConnectivityInterceptor(this._networkInfo);		

  @override		
  void onRequest(		
    RequestOptions options,		
    RequestInterceptorHandler handler,		
  ) async {		
    if (!await _networkInfo.isConnected) {		
      return handler.reject(		
        DioException(		
          requestOptions: options,		
          type: DioExceptionType.connectionError,		
          error: 'No internet connection',		
        ),		
      );		
    }		
    handler.next(options);		
  }		
}