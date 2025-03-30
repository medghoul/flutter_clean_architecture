import 'package:flutter/material.dart';
import 'package:simeprofessional_mobileapp_flutter/core/responsive/index.dart';

/// A responsive body widget for the SIME Professional app
///
/// This widget handles:
/// - Scrollable or fixed content
/// - Content centering
/// - Content width constraints for responsiveness
class SimeBody extends StatelessWidget {
  final Widget child;
  final bool useScrollView;
  final bool centerContent;
  final EdgeInsetsGeometry? padding;
  final double? mobileMaxWidth;
  final double? tabletMaxWidth;
  final double? desktopMaxWidth;

  const SimeBody({
    Key? key,
    required this.child,
    this.useScrollView = false,
    this.centerContent = false,
    this.padding,
    this.mobileMaxWidth,
    this.tabletMaxWidth,
    this.desktopMaxWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create the responsive container with appropriate constraints
    final content = ResponsiveContainer(
      mobileMaxWidth: mobileMaxWidth,
      tabletMaxWidth: tabletMaxWidth,
      desktopMaxWidth: desktopMaxWidth,
      centerHorizontally: true,
      centerVertically: centerContent,
      padding: padding,
      child: child,
    );

    // Apply scrolling if needed
    return useScrollView
        ? SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: content,
          )
        : content;
  }
} 
