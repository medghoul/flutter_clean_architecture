import 'package:dio/dio.dart';		
import 'package:freezed_annotation/freezed_annotation.dart';		

part 'api_response.freezed.dart';		

@Freezed()		
class ApiResponse<T> with _$ApiResponse<T> {		
  const factory ApiResponse.success(T data) = Success;		
  const factory ApiResponse.error(DioException error) = Error;		
}