import 'package:clean_architecture/core/responsive/index.dart';
import 'package:flutter/material.dart';

/// A widget that builds different UIs based on screen size
///
/// This widget simplifies building responsive UIs by providing:
/// - Easy conditional building based on device type
/// - Fallback mechanisms (mobile UI is used as fallback for missing builders)
/// - Single source of truth for responsive behavior
class ResponsiveBuilder extends StatelessWidget {
  /// Builder function for mobile UI (required)
  final WidgetBuilder mobileBuilder;

  /// Builder function for tablet UI (optional)
  final WidgetBuilder? tabletBuilder;

  /// Builder function for desktop UI (optional)
  final WidgetBuilder? desktopBuilder;

  /// Constructor
  const ResponsiveBuilder({
    super.key,
    required this.mobileBuilder,
    this.tabletBuilder,
    this.desktopBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final deviceType = ResponsiveUtils.getDeviceType(context);

    switch (deviceType) {
      case DeviceType.phone:
        return mobileBuilder(context);
      case DeviceType.tablet:
        return (tabletBuilder ?? mobileBuilder)(context);
      case DeviceType.desktop:
        return (desktopBuilder ?? tabletBuilder ?? mobileBuilder)(context);
    }
  }
}

/// A widget that provides different layouts for different screen orientations
class OrientationLayout extends StatelessWidget {
  /// Builder function for portrait orientation (required)
  final WidgetBuilder portrait;

  /// Builder function for landscape orientation (required)
  final WidgetBuilder landscape;

  /// Constructor
  const OrientationLayout({
    Key? key,
    required this.portrait,
    required this.landscape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveUtils.isPortrait(context)
        ? portrait(context)
        : landscape(context);
  }
}

/// A widget that wraps content with responsive sizing constraints
class ResponsiveContainer extends StatelessWidget {
  /// Child widget
  final Widget child;

  /// Maximum width for phone screens (default: 420)
  final double? mobileMaxWidth;

  /// Maximum width for tablet screens (default: 700)
  final double? tabletMaxWidth;

  /// Maximum width for desktop screens (default: 1000)
  final double? desktopMaxWidth;

  /// Whether to center the content horizontally
  final bool centerHorizontally;

  /// Whether to center the content vertically
  final bool centerVertically;

  /// Padding to apply to the container
  final EdgeInsetsGeometry? padding;

  /// Constructor
  const ResponsiveContainer({
    Key? key,
    required this.child,
    this.mobileMaxWidth,
    this.tabletMaxWidth,
    this.desktopMaxWidth,
    this.centerHorizontally = true,
    this.centerVertically = false,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceType = ResponsiveUtils.getDeviceType(context);

    // Determine max width based on device type
    double maxWidth;
    switch (deviceType) {
      case DeviceType.phone:
        maxWidth = mobileMaxWidth ??
            ResponsiveUtils.maxContentWidth[DeviceType.phone]!;
        break;
      case DeviceType.tablet:
        maxWidth = tabletMaxWidth ??
            ResponsiveUtils.maxContentWidth[DeviceType.tablet]!;
        break;
      case DeviceType.desktop:
        maxWidth = desktopMaxWidth ??
            ResponsiveUtils.maxContentWidth[DeviceType.desktop]!;
        break;
    }

    // Apply horizontal padding
    final horizontalPadding = padding ??
        EdgeInsets.symmetric(
          horizontal: ResponsiveUtils.getHorizontalPadding(context),
        );

    // Apply max width constraint
    Widget content = ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
      ),
      child: Padding(
        padding: horizontalPadding,
        child: child,
      ),
    );

    // Apply centering if requested
    if (centerHorizontally || centerVertically) {
      content = Align(
        alignment: Alignment(
          centerHorizontally ? 0 : -1,
          centerVertically ? 0 : -1,
        ),
        child: content,
      );
    }

    return content;
  }
}

/// A widget that dynamically shows or hides based on screen size
class ResponsiveVisibility extends StatelessWidget {
  /// Child widget to show or hide
  final Widget child;

  /// Whether to show on phone screens
  final bool showOnPhone;

  /// Whether to show on tablet screens
  final bool showOnTablet;

  /// Whether to show on desktop screens
  final bool showOnDesktop;

  /// Space to maintain when widget is hidden
  final bool maintainSize;

  /// Replacement widget when hidden
  final Widget? replacement;

  /// Constructor
  const ResponsiveVisibility({
    super.key,
    required this.child,
    this.showOnPhone = true,
    this.showOnTablet = true,
    this.showOnDesktop = true,
    this.maintainSize = false,
    this.replacement,
  });

  @override
  Widget build(BuildContext context) {
    final deviceType = ResponsiveUtils.getDeviceType(context);

    bool isVisible;
    switch (deviceType) {
      case DeviceType.phone:
        isVisible = showOnPhone;
        break;
      case DeviceType.tablet:
        isVisible = showOnTablet;
        break;
      case DeviceType.desktop:
        isVisible = showOnDesktop;
        break;
    }

    if (isVisible) {
      return child;
    }

    if (replacement != null) {
      return replacement!;
    }

    return maintainSize
        ? Opacity(opacity: 0, child: child)
        : const SizedBox.shrink();
  }
}
