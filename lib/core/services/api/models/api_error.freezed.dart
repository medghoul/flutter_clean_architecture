// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiError {
  String? get message;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ApiErrorCopyWith<ApiError> get copyWith =>
      _$ApiErrorCopyWithImpl<ApiError>(this as ApiError, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApiError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ApiError(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ApiErrorCopyWith<$Res> {
  factory $ApiErrorCopyWith(ApiError value, $Res Function(ApiError) _then) =
      _$ApiErrorCopyWithImpl;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$ApiErrorCopyWithImpl<$Res> implements $ApiErrorCopyWith<$Res> {
  _$ApiErrorCopyWithImpl(this._self, this._then);

  final ApiError _self;
  final $Res Function(ApiError) _then;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_self.copyWith(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _NoConnection implements ApiError {
  const _NoConnection({this.message});

  @override
  final String? message;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NoConnectionCopyWith<_NoConnection> get copyWith =>
      __$NoConnectionCopyWithImpl<_NoConnection>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NoConnection &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ApiError.noConnection(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$NoConnectionCopyWith<$Res>
    implements $ApiErrorCopyWith<$Res> {
  factory _$NoConnectionCopyWith(
          _NoConnection value, $Res Function(_NoConnection) _then) =
      __$NoConnectionCopyWithImpl;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$NoConnectionCopyWithImpl<$Res>
    implements _$NoConnectionCopyWith<$Res> {
  __$NoConnectionCopyWithImpl(this._self, this._then);

  final _NoConnection _self;
  final $Res Function(_NoConnection) _then;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_NoConnection(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _Timeout implements ApiError {
  const _Timeout({this.message});

  @override
  final String? message;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TimeoutCopyWith<_Timeout> get copyWith =>
      __$TimeoutCopyWithImpl<_Timeout>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Timeout &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ApiError.timeout(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$TimeoutCopyWith<$Res>
    implements $ApiErrorCopyWith<$Res> {
  factory _$TimeoutCopyWith(_Timeout value, $Res Function(_Timeout) _then) =
      __$TimeoutCopyWithImpl;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$TimeoutCopyWithImpl<$Res> implements _$TimeoutCopyWith<$Res> {
  __$TimeoutCopyWithImpl(this._self, this._then);

  final _Timeout _self;
  final $Res Function(_Timeout) _then;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_Timeout(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _Unauthorized implements ApiError {
  const _Unauthorized({this.message, this.code});

  @override
  final String? message;
  final String? code;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UnauthorizedCopyWith<_Unauthorized> get copyWith =>
      __$UnauthorizedCopyWithImpl<_Unauthorized>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Unauthorized &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @override
  String toString() {
    return 'ApiError.unauthorized(message: $message, code: $code)';
  }
}

/// @nodoc
abstract mixin class _$UnauthorizedCopyWith<$Res>
    implements $ApiErrorCopyWith<$Res> {
  factory _$UnauthorizedCopyWith(
          _Unauthorized value, $Res Function(_Unauthorized) _then) =
      __$UnauthorizedCopyWithImpl;
  @override
  @useResult
  $Res call({String? message, String? code});
}

/// @nodoc
class __$UnauthorizedCopyWithImpl<$Res>
    implements _$UnauthorizedCopyWith<$Res> {
  __$UnauthorizedCopyWithImpl(this._self, this._then);

  final _Unauthorized _self;
  final $Res Function(_Unauthorized) _then;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
  }) {
    return _then(_Unauthorized(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _NotFound implements ApiError {
  const _NotFound({this.message, this.resource});

  @override
  final String? message;
  final String? resource;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotFoundCopyWith<_NotFound> get copyWith =>
      __$NotFoundCopyWithImpl<_NotFound>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotFound &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.resource, resource) ||
                other.resource == resource));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, resource);

  @override
  String toString() {
    return 'ApiError.notFound(message: $message, resource: $resource)';
  }
}

/// @nodoc
abstract mixin class _$NotFoundCopyWith<$Res>
    implements $ApiErrorCopyWith<$Res> {
  factory _$NotFoundCopyWith(_NotFound value, $Res Function(_NotFound) _then) =
      __$NotFoundCopyWithImpl;
  @override
  @useResult
  $Res call({String? message, String? resource});
}

/// @nodoc
class __$NotFoundCopyWithImpl<$Res> implements _$NotFoundCopyWith<$Res> {
  __$NotFoundCopyWithImpl(this._self, this._then);

  final _NotFound _self;
  final $Res Function(_NotFound) _then;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? resource = freezed,
  }) {
    return _then(_NotFound(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      resource: freezed == resource
          ? _self.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _ServerError implements ApiError {
  const _ServerError({this.message, this.stackTrace});

  @override
  final String? message;
  final String? stackTrace;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServerErrorCopyWith<_ServerError> get copyWith =>
      __$ServerErrorCopyWithImpl<_ServerError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServerError &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, stackTrace);

  @override
  String toString() {
    return 'ApiError.serverError(message: $message, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class _$ServerErrorCopyWith<$Res>
    implements $ApiErrorCopyWith<$Res> {
  factory _$ServerErrorCopyWith(
          _ServerError value, $Res Function(_ServerError) _then) =
      __$ServerErrorCopyWithImpl;
  @override
  @useResult
  $Res call({String? message, String? stackTrace});
}

/// @nodoc
class __$ServerErrorCopyWithImpl<$Res> implements _$ServerErrorCopyWith<$Res> {
  __$ServerErrorCopyWithImpl(this._self, this._then);

  final _ServerError _self;
  final $Res Function(_ServerError) _then;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_ServerError(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _self.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _BadRequest implements ApiError {
  const _BadRequest({this.message, final Map<String, dynamic>? errors})
      : _errors = errors;

  @override
  final String? message;
  final Map<String, dynamic>? _errors;
  Map<String, dynamic>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableMapView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BadRequestCopyWith<_BadRequest> get copyWith =>
      __$BadRequestCopyWithImpl<_BadRequest>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BadRequest &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_errors));

  @override
  String toString() {
    return 'ApiError.badRequest(message: $message, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class _$BadRequestCopyWith<$Res>
    implements $ApiErrorCopyWith<$Res> {
  factory _$BadRequestCopyWith(
          _BadRequest value, $Res Function(_BadRequest) _then) =
      __$BadRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String? message, Map<String, dynamic>? errors});
}

/// @nodoc
class __$BadRequestCopyWithImpl<$Res> implements _$BadRequestCopyWith<$Res> {
  __$BadRequestCopyWithImpl(this._self, this._then);

  final _BadRequest _self;
  final $Res Function(_BadRequest) _then;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? errors = freezed,
  }) {
    return _then(_BadRequest(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      errors: freezed == errors
          ? _self._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _Forbidden implements ApiError {
  const _Forbidden({this.message, this.reason});

  @override
  final String? message;
  final String? reason;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ForbiddenCopyWith<_Forbidden> get copyWith =>
      __$ForbiddenCopyWithImpl<_Forbidden>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Forbidden &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, reason);

  @override
  String toString() {
    return 'ApiError.forbidden(message: $message, reason: $reason)';
  }
}

/// @nodoc
abstract mixin class _$ForbiddenCopyWith<$Res>
    implements $ApiErrorCopyWith<$Res> {
  factory _$ForbiddenCopyWith(
          _Forbidden value, $Res Function(_Forbidden) _then) =
      __$ForbiddenCopyWithImpl;
  @override
  @useResult
  $Res call({String? message, String? reason});
}

/// @nodoc
class __$ForbiddenCopyWithImpl<$Res> implements _$ForbiddenCopyWith<$Res> {
  __$ForbiddenCopyWithImpl(this._self, this._then);

  final _Forbidden _self;
  final $Res Function(_Forbidden) _then;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? reason = freezed,
  }) {
    return _then(_Forbidden(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _Unexpected implements ApiError {
  const _Unexpected({this.message, this.error});

  @override
  final String? message;
  final dynamic error;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UnexpectedCopyWith<_Unexpected> get copyWith =>
      __$UnexpectedCopyWithImpl<_Unexpected>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Unexpected &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(error));

  @override
  String toString() {
    return 'ApiError.unexpected(message: $message, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$UnexpectedCopyWith<$Res>
    implements $ApiErrorCopyWith<$Res> {
  factory _$UnexpectedCopyWith(
          _Unexpected value, $Res Function(_Unexpected) _then) =
      __$UnexpectedCopyWithImpl;
  @override
  @useResult
  $Res call({String? message, dynamic error});
}

/// @nodoc
class __$UnexpectedCopyWithImpl<$Res> implements _$UnexpectedCopyWith<$Res> {
  __$UnexpectedCopyWithImpl(this._self, this._then);

  final _Unexpected _self;
  final $Res Function(_Unexpected) _then;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? error = freezed,
  }) {
    return _then(_Unexpected(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

// dart format on
