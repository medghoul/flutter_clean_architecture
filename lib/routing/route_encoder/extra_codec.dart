import 'dart:convert';

/// A type-safe codec for handling route parameters and extra data.
///
/// This codec provides a type-safe implementation for encoding and decoding
/// route parameters. It's designed to work with go_router's parameter handling system
/// and preserves object types during navigation.
///
/// Features:
/// - Type-safe encoding and decoding
/// - Preserves null values
/// - Maintains object references
/// - Compatible with go_router's parameter system
/// - Implements standard Dart codec interface
///
/// Example:
/// ```dart
/// final codec = ExtraCodec<User>();
/// final encoded = codec.encode(user);
/// final decoded = codec.decode(encoded) as User;
/// ```
class ExtraCodec<T> implements Codec<T?, Object?> {
  /// Creates a constant [ExtraCodec].
  const ExtraCodec();

  /// Returns the decoder for converting route parameters.
  @override
  Converter<Object?, T?> get decoder => _ExtraDecoder<T>();

  /// Returns the encoder for converting route parameters.
  @override
  Converter<T?, Object?> get encoder => _ExtraEncoder<T>();

  /// Decodes a route parameter with type safety.
  ///
  /// Throws [TypeError] if the type doesn't match T.
  @override
  T? decode(Object? encoded) => decoder.convert(encoded);

  /// Encodes a route parameter with type safety.
  @override
  Object? encode(T? message) => encoder.convert(message);

  /// Not implemented as fusion is not needed for this codec.
  @override
  Codec<T?, S> fuse<S>(Codec<Object?, S> other) =>
      throw UnimplementedError();

  /// Not implemented as inversion is not needed for this codec.
  @override
  Codec<Object?, T?> get inverted => throw UnimplementedError();
}

/// Type-safe encoder for the [ExtraCodec].
class _ExtraEncoder<T> extends Converter<T?, Object?> {
  /// Creates a constant [_ExtraEncoder].
  const _ExtraEncoder();

  /// Converts the input object with type checking.
  ///
  /// Returns the original object if it matches type T.
  /// Returns null if input is null.
  @override
  Object? convert(T? input) {
    if (input == null) return null;
    return input;
  }
}

/// Type-safe decoder for the [ExtraCodec].
class _ExtraDecoder<T> extends Converter<Object?, T?> {
  /// Creates a constant [_ExtraDecoder].
  const _ExtraDecoder();

  /// Converts the input object with type checking.
  ///
  /// Returns the original object if it matches type T.
  /// Returns null if input is null.
  /// Throws [TypeError] if the type doesn't match T.
  @override
  T? convert(Object? input) {
    if (input == null) return null;
    return input as T;
  }
}
