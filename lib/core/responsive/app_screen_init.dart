import 'package:flutter/material.dart';
import 'package:simeprofessional_mobileapp_flutter/core/responsive/screen_utils.dart';

/// A widget that initializes our responsive system
///
/// This widget wraps the app and initializes our AppScreenUtils.
/// It uses MediaQuery directly for responsive sizing without any external dependencies.
class AppScreenInit extends StatelessWidget {
  final Widget Function(BuildContext context, Widget? child) builder;
  final Widget? child;
  final Size designSize;

  const AppScreenInit({
    Key? key,
    required this.builder,
    this.child,
    this.designSize = const Size(375, 812),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final mediaQuery = MediaQuery.of(context);
        final screenSize = mediaQuery.size;
        
        // Initialize our custom AppScreenUtils with screen dimensions
        AppScreenUtils.instance.init(
          context,
          designSize: designSize,
          screenSize: screenSize,
        );
        
        // Call the builder provided by the user
        return builder(context, child);
      },
    );
  }
} 