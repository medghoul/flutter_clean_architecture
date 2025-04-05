import 'package:clean_architecture/core/constants/global_constants.dart';
import 'package:clean_architecture/core/responsive/index.dart';
import 'package:flutter/material.dart';

/// A utility class that provides responsive design functionality
///
/// This class centralizes all responsive-related logic and provides:
/// - Device type detection (phone, tablet, desktop)
/// - Screen size queries
/// - Orientation detection
/// - Adaptive sizing methods
/// - Responsive value selection based on device type
class ResponsiveUtils {
  /// Singleton instance
  static final ResponsiveUtils _instance = ResponsiveUtils._internal();

  /// Factory constructor
  factory ResponsiveUtils() => _instance;

  /// Internal constructor
  ResponsiveUtils._internal();

  /// Screen breakpoint definitions
  static const double phoneBreakpoint = GlobalConstants.mobileMaxWidth; // 600
  static const double tabletBreakpoint = GlobalConstants.tabletMaxWidth; // 900
  static const double desktopBreakpoint =
      GlobalConstants.desktopMaxWidth; // 1200

  /// Default padding by device type
  static const Map<DeviceType, double> defaultHorizontalPadding = {
    DeviceType.phone: GlobalConstants.paddingL, // 24
    DeviceType.tablet: GlobalConstants.paddingXL, // 32
    DeviceType.desktop: GlobalConstants.paddingXXL // 48
  };

  /// Default content width constraints by device type
  static const Map<DeviceType, double> maxContentWidth = {
    DeviceType.phone: 420,
    DeviceType.tablet: 700,
    DeviceType.desktop: 1000
  };

  /// Determine the current device type based on screen width
  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < phoneBreakpoint) {
      return DeviceType.phone;
    } else if (width < tabletBreakpoint) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }

  /// Get screen width
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Get screen height
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Check if the device is in landscape orientation
  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  /// Check if the device is in portrait orientation
  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  /// Get horizontal padding based on device type
  static double getHorizontalPadding(BuildContext context) {
    final deviceType = getDeviceType(context);
    return defaultHorizontalPadding[deviceType]!;
  }

  /// Get max content width based on device type
  static double getMaxContentWidth(BuildContext context) {
    final deviceType = getDeviceType(context);
    return maxContentWidth[deviceType]!;
  }

  /// Returns adaptive value based on device type
  static T adaptiveValue<T>({
    required BuildContext context,
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    final deviceType = getDeviceType(context);

    switch (deviceType) {
      case DeviceType.phone:
        return mobile;
      case DeviceType.tablet:
        return tablet ?? mobile;
      case DeviceType.desktop:
        return desktop ?? tablet ?? mobile;
    }
  }

  /// Responsive width value that adapts to screen width
  static double responsiveWidth(double width, {BuildContext? context}) {
    // Use our custom AppScreenUtils implementation
    return AppScreenUtils.instance.setWidth(width);
  }

  /// Responsive height value that adapts to screen height
  static double responsiveHeight(double height, {BuildContext? context}) {
    // Use our custom AppScreenUtils implementation
    return AppScreenUtils.instance.setHeight(height);
  }

  /// Responsive font size value
  static double responsiveFontSize(double size, {BuildContext? context}) {
    // Use our custom AppScreenUtils implementation
    return AppScreenUtils.instance.setSp(size);
  }

  /// Responsive radius value
  static double responsiveRadius(double radius, {BuildContext? context}) {
    // Use our custom AppScreenUtils implementation
    return AppScreenUtils.instance.radius(radius);
  }

  /// Returns a responsive form width based on the screen size
  static double getResponsiveFormWidth(BuildContext context) {
    return AppScreenUtils.instance.getResponsiveFormWidth();
  }
}

/// Enum representing different device types
enum DeviceType { phone, tablet, desktop }
