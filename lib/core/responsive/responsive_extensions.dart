import 'package:clean_architecture/core/responsive/index.dart';
import 'package:flutter/material.dart';

/// Extensions on num (int, double) to provide responsive sizing
extension ResponsiveSizeExtensions on num {
  /// Converts this value to a responsive width based on design size
  /// Uses our custom scaling logic based on device type
  double get w => AppScreenUtils.instance.setWidth(this);

  /// Converts this value to a responsive height based on design size
  /// Uses our custom scaling logic based on device type
  double get h => AppScreenUtils.instance.setHeight(this);

  /// Converts this value to a responsive font size based on design size
  /// Uses our custom scaling logic based on device type
  double get sp => AppScreenUtils.instance.setSp(this);

  /// Converts this value to a responsive radius based on design size
  /// Uses our custom scaling logic based on device type
  double get r => AppScreenUtils.instance.radius(this);

  /// Scales this value proportionally by screen width (percentage)
  double get sw => AppScreenUtils.instance.scaleWidth(this.toDouble());

  /// Scales this value proportionally by screen height (percentage)
  double get sh => AppScreenUtils.instance.scaleHeight(this.toDouble());
}

/// Extensions on BuildContext to provide responsive utilities
extension ResponsiveContextExtensions on BuildContext {
  /// Get the current device type (phone, tablet, desktop)
  DeviceType get deviceType => ResponsiveUtils.getDeviceType(this);

  /// Check if the current device is a phone
  bool get isPhone => deviceType == DeviceType.phone;

  /// Check if the current device is a tablet
  bool get isTablet => deviceType == DeviceType.tablet;

  /// Check if the current device is a desktop
  bool get isDesktop => deviceType == DeviceType.desktop;

  /// Get the screen size
  Size get screenSize => MediaQuery.of(this).size;

  /// Get the screen width
  double get screenWidth => screenSize.width;

  /// Get the screen height
  double get screenHeight => screenSize.height;

  /// Check if the device is in landscape orientation
  bool get isLandscape => ResponsiveUtils.isLandscape(this);

  /// Check if the device is in portrait orientation
  bool get isPortrait => ResponsiveUtils.isPortrait(this);

  /// Get the appropriate horizontal padding based on device type
  double get responsivePadding => ResponsiveUtils.getHorizontalPadding(this);

  /// Get the maximum content width based on device type
  double get maxContentWidth => ResponsiveUtils.getMaxContentWidth(this);

  /// Get a value that adapts to the current device type
  T adaptiveValue<T>({
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    return ResponsiveUtils.adaptiveValue(
      context: this,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }
}

/// Extensions on Widget to provide responsive wrappers
extension ResponsiveWidgetExtensions on Widget {
  /// Wrap this widget with responsive padding
  Widget withResponsivePadding(
    BuildContext context, {
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    final horizontalPadding = ResponsiveUtils.getHorizontalPadding(context);

    return Padding(
      padding: EdgeInsets.fromLTRB(
        left ?? horizontalPadding,
        top ?? 0,
        right ?? horizontalPadding,
        bottom ?? 0,
      ),
      child: this,
    );
  }

  /// Wrap this widget with responsive container
  Widget withResponsiveContainer(
    BuildContext context, {
    double? mobileMaxWidth,
    double? tabletMaxWidth,
    double? desktopMaxWidth,
    bool centerHorizontally = true,
    bool centerVertically = false,
    EdgeInsetsGeometry? padding,
  }) {
    return ResponsiveContainer(
      mobileMaxWidth: mobileMaxWidth,
      tabletMaxWidth: tabletMaxWidth,
      desktopMaxWidth: desktopMaxWidth,
      centerHorizontally: centerHorizontally,
      centerVertically: centerVertically,
      padding: padding,
      child: this,
    );
  }

  /// Apply responsive visibility to this widget
  Widget withResponsiveVisibility({
    required BuildContext context,
    bool showOnPhone = true,
    bool showOnTablet = true,
    bool showOnDesktop = true,
    bool maintainSize = false,
    Widget? replacement,
  }) {
    return ResponsiveVisibility(
      showOnPhone: showOnPhone,
      showOnTablet: showOnTablet,
      showOnDesktop: showOnDesktop,
      maintainSize: maintainSize,
      replacement: replacement,
      child: this,
    );
  }
}

/// A mixin that provides responsive utilities to StatefulWidget states
mixin ResponsiveStateMixin<T extends StatefulWidget> on State<T> {
  /// Get the current device type (phone, tablet, desktop)
  DeviceType get deviceType => ResponsiveUtils.getDeviceType(context);

  /// Check if the current device is a phone
  bool get isPhone => deviceType == DeviceType.phone;

  /// Check if the current device is a tablet
  bool get isTablet => deviceType == DeviceType.tablet;

  /// Check if the current device is a desktop
  bool get isDesktop => deviceType == DeviceType.desktop;

  /// Check if the device is in landscape orientation
  bool get isLandscape => ResponsiveUtils.isLandscape(context);

  /// Check if the device is in portrait orientation
  bool get isPortrait => ResponsiveUtils.isPortrait(context);

  /// Get the screen size
  Size get screenSize => MediaQuery.of(context).size;

  /// Get the screen width
  double get screenWidth => screenSize.width;

  /// Get the screen height
  double get screenHeight => screenSize.height;

  /// Get the appropriate horizontal padding based on device type
  double get responsivePadding => ResponsiveUtils.getHorizontalPadding(context);

  /// Get the maximum content width based on device type
  double get maxContentWidth => ResponsiveUtils.getMaxContentWidth(context);

  /// Get a value that adapts to the current device type
  T adaptiveValue<T>({
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    return ResponsiveUtils.adaptiveValue(
      context: context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }
}
