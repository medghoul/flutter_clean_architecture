import 'package:clean_architecture/core/responsive/index.dart';
import 'package:flutter/material.dart';

/// A widget that initializes our responsive system
///
/// This widget wraps the app and initializes our AppScreenUtils.
/// It uses MediaQuery directly for responsive sizing without any external dependencies.
class AppScreenInit extends StatelessWidget {
  final Widget Function(BuildContext context, Widget? child) builder;
  final Widget? child;
  final Size designSize;

  const AppScreenInit({
    super.key,
    required this.builder,
    this.child,
    this.designSize = const Size(375, 812),
  });

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
