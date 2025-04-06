import 'package:connectivity_plus/connectivity_plus.dart';

/// Service for monitoring network connectivity status.
///
/// Provides methods to:
/// - Check current connection status
/// - Stream connectivity changes
/// - Get connection type
class NetworkInfo {
  final Connectivity _connectivity;

  NetworkInfo(this._connectivity);

  /// Checks if device has an active internet connection
  Future<bool> get isConnected async {
    final result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }

  /// Returns the current connection type
  Future<List<ConnectivityResult>> get connectionType async {
    return await _connectivity.checkConnectivity();
  }

  /// Streams connectivity changes
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      _connectivity.onConnectivityChanged;

  /// Checks if current connection is WiFi
  Future<bool> get isWifi async {
    final result = await _connectivity.checkConnectivity();
    return result == ConnectivityResult.wifi;
  }

  /// Checks if current connection is mobile data
  Future<bool> get isMobile async {
    final result = await _connectivity.checkConnectivity();
    return result == ConnectivityResult.mobile;
  }
}