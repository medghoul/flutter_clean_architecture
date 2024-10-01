import 'package:clean_architecture/core/enums/device_type.dart';
import 'package:flutter/material.dart';
import 'responsive_layout.dart';

class ResponsiveValue<T> {
  final T mobile;
  final T? tablet;
  final T? desktop;

  const ResponsiveValue({required this.mobile, this.tablet, this.desktop});

  T get(BuildContext context) {
    final deviceType = ResponsiveLayout.getDeviceType(context);
    switch (deviceType) {
      case DeviceType.desktop:
        return desktop ?? tablet ?? mobile;
      case DeviceType.tablet:
        return tablet ?? mobile;
      case DeviceType.mobile:
        return mobile;
    }
  }
}