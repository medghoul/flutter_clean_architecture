import 'package:freezed_annotation/freezed_annotation.dart';		

part 'pagination.freezed.dart';		
part 'pagination.g.dart';		

@freezed		
abstract class Pagination with _$Pagination {		
  const factory Pagination({		
    required int currentPage,		
    required int totalPages,		
    required int itemsPerPage,		
    required int totalItems,		
  }) = _Pagination;		

  factory Pagination.fromJson(Map<String, dynamic> json) =>		
      _$PaginationFromJson(json);		
}