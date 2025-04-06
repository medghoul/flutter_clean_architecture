// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Pagination {
  int get currentPage;
  int get totalPages;
  int get itemsPerPage;
  int get totalItems;

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<Pagination> get copyWith =>
      _$PaginationCopyWithImpl<Pagination>(this as Pagination, _$identity);

  /// Serializes this Pagination to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Pagination &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.itemsPerPage, itemsPerPage) ||
                other.itemsPerPage == itemsPerPage) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, currentPage, totalPages, itemsPerPage, totalItems);

  @override
  String toString() {
    return 'Pagination(currentPage: $currentPage, totalPages: $totalPages, itemsPerPage: $itemsPerPage, totalItems: $totalItems)';
  }
}

/// @nodoc
abstract mixin class $PaginationCopyWith<$Res> {
  factory $PaginationCopyWith(
          Pagination value, $Res Function(Pagination) _then) =
      _$PaginationCopyWithImpl;
  @useResult
  $Res call(
      {int currentPage, int totalPages, int itemsPerPage, int totalItems});
}

/// @nodoc
class _$PaginationCopyWithImpl<$Res> implements $PaginationCopyWith<$Res> {
  _$PaginationCopyWithImpl(this._self, this._then);

  final Pagination _self;
  final $Res Function(Pagination) _then;

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? totalPages = null,
    Object? itemsPerPage = null,
    Object? totalItems = null,
  }) {
    return _then(_self.copyWith(
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      itemsPerPage: null == itemsPerPage
          ? _self.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _self.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Pagination implements Pagination {
  const _Pagination(
      {required this.currentPage,
      required this.totalPages,
      required this.itemsPerPage,
      required this.totalItems});
  factory _Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  @override
  final int currentPage;
  @override
  final int totalPages;
  @override
  final int itemsPerPage;
  @override
  final int totalItems;

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaginationCopyWith<_Pagination> get copyWith =>
      __$PaginationCopyWithImpl<_Pagination>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaginationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Pagination &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.itemsPerPage, itemsPerPage) ||
                other.itemsPerPage == itemsPerPage) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, currentPage, totalPages, itemsPerPage, totalItems);

  @override
  String toString() {
    return 'Pagination(currentPage: $currentPage, totalPages: $totalPages, itemsPerPage: $itemsPerPage, totalItems: $totalItems)';
  }
}

/// @nodoc
abstract mixin class _$PaginationCopyWith<$Res>
    implements $PaginationCopyWith<$Res> {
  factory _$PaginationCopyWith(
          _Pagination value, $Res Function(_Pagination) _then) =
      __$PaginationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int currentPage, int totalPages, int itemsPerPage, int totalItems});
}

/// @nodoc
class __$PaginationCopyWithImpl<$Res> implements _$PaginationCopyWith<$Res> {
  __$PaginationCopyWithImpl(this._self, this._then);

  final _Pagination _self;
  final $Res Function(_Pagination) _then;

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentPage = null,
    Object? totalPages = null,
    Object? itemsPerPage = null,
    Object? totalItems = null,
  }) {
    return _then(_Pagination(
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      itemsPerPage: null == itemsPerPage
          ? _self.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _self.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
