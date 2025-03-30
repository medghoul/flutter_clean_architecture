import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simeprofessional_mobileapp_flutter/core/di/dependency_injection.dart';
import 'package:simeprofessional_mobileapp_flutter/core/responsive/responsive_utils.dart';

/// Singleton class that handles screen dimensions and responsive calculations
///
/// This class provides utility methods for responsive design and uses
/// MediaQuery for screen dimensions. It centralizes
/// the access to screen dimensions and provides helper methods for scaling.
class AppScreenUtils {
  // Singleton instance
  static final AppScreenUtils _instance = AppScreenUtils._internal();
  
  /// Factory constructor that returns the singleton instance
  factory AppScreenUtils() => _instance;
  
  /// Internal constructor
  AppScreenUtils._internal();
  
  /// Get instance from dependency injection (preferred) or fallback to singleton
  static AppScreenUtils get instance => di.isRegistered<AppScreenUtils>() 
      ? di<AppScreenUtils>() 
      : _instance;

  // Default design size
  Size _designSize = const Size(375, 812);
  
  // Screen dimensions
  Size _screenSize = const Size(375, 812);
  
  // Device pixel ratio
  double _pixelRatio = 1.0;
  
  // Safe area paddings
  EdgeInsets _padding = EdgeInsets.zero;

  // Screen breakpoint definitions (from ResponsiveUtils)
  double get phoneBreakpoint => ResponsiveUtils.phoneBreakpoint;
  double get tabletBreakpoint => ResponsiveUtils.tabletBreakpoint;
  double get desktopBreakpoint => ResponsiveUtils.desktopBreakpoint;

  // Init method using MediaQuery
  void init(
    BuildContext context, {
    Size designSize = const Size(375, 812),
    Size? screenSize,
  }) {
    final mediaQuery = MediaQuery.of(context);
    _designSize = designSize;
    _screenSize = screenSize ?? mediaQuery.size;
    _pixelRatio = mediaQuery.devicePixelRatio;
    _padding = mediaQuery.padding;
  }

  // Get the screen width
  double get screenWidth => _screenSize.width;

  // Get the screen height
  double get screenHeight => _screenSize.height;

  // Get device pixel ratio
  double get pixelRatio => _pixelRatio;

  // Get safe area top padding
  double get statusBarHeight => _padding.top;

  // Get safe area bottom padding
  double get bottomBarHeight => _padding.bottom;

  // Check if device is in landscape mode
  bool get isLandscape => screenWidth > screenHeight;

  // Device type based on screen width
  DeviceType get deviceType {
    if (screenWidth < phoneBreakpoint) {
      return DeviceType.phone;
    } else if (screenWidth < tabletBreakpoint) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }

  // Base width ratio - relation between current screen width and design width
  double get _widthRatio => screenWidth / _designSize.width;

  // Base height ratio - relation between current screen height and design height
  double get _heightRatio => screenHeight / _designSize.height;

  // Calculate the width scale based on device type
  double _getWidthScale(num width) {
    switch (deviceType) {
      case DeviceType.desktop:
        return width * 1.5; // Fixed 1.5x scale for desktop
      case DeviceType.tablet:
        return width * 1.3; // Fixed 1.3x scale for tablet
      case DeviceType.phone:
        return width * _widthRatio; // Dynamic scale based on screen ratio
    }
  }

  // Calculate the height scale based on device type
  double _getHeightScale(num height) {
    switch (deviceType) {
      case DeviceType.desktop:
        return height * 1.5; // Fixed 1.5x scale for desktop
      case DeviceType.tablet:
        return height * 1.3; // Fixed 1.3x scale for tablet
      case DeviceType.phone:
        return height * _heightRatio; // Dynamic scale based on screen ratio
    }
  }

  // Calculate the font scale based on device type
  double _getFontScale(num fontSize) {
    switch (deviceType) {
      case DeviceType.desktop:
        return fontSize * 1.2; // Fixed 1.2x scale for desktop (smaller to avoid huge fonts)
      case DeviceType.tablet:
        return fontSize * 1.1; // Fixed 1.1x scale for tablet
      case DeviceType.phone:
        // Cap font scale to 1.2 for phones to avoid extreme scaling
        return fontSize * min(_widthRatio, 1.2);
    }
  }

  // Calculate the radius scale based on device type (same as width scale)
  double _getRadiusScale(num radius) => _getWidthScale(radius);

  // Public method to scale width (replacement for ScreenUtil.setWidth)
  double setWidth(num width) => _getWidthScale(width);

  // Public method to scale height (replacement for ScreenUtil.setHeight)
  double setHeight(num height) => _getHeightScale(height);

  // Public method to scale font size (replacement for ScreenUtil.setSp)
  double setSp(num fontSize) => _getFontScale(fontSize);

  // Public method to scale radius (replacement for ScreenUtil.radius)
  double radius(num radius) => _getRadiusScale(radius);

  // Calculate a percentage of screen width (replacement for ScreenUtil screenWidth * %)
  double scaleWidth(double widthPercent) => screenWidth * widthPercent / 100;

  // Calculate a percentage of screen height (replacement for ScreenUtil screenHeight * %)
  double scaleHeight(double heightPercent) => screenHeight * heightPercent / 100;

  // Calculate adaptive value based on device type
  T adaptiveValue<T>({
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    switch (deviceType) {
      case DeviceType.phone:
        return mobile;
      case DeviceType.tablet:
        return tablet ?? mobile;
      case DeviceType.desktop:
        return desktop ?? tablet ?? mobile;
    }
  }

  // Get responsive form width based on device type
  double getResponsiveFormWidth() {
    switch (deviceType) {
      case DeviceType.desktop:
        return 600; // Fixed width for desktop
      case DeviceType.tablet:
        return 500; // Medium width for tablets
      case DeviceType.phone:
        return 450; // Width for large phones
    }
  }
} 