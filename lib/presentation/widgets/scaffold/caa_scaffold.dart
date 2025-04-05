import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:clean_architecture/core/responsive/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Main scaffold widget for Clean Architecture App
///
/// This scaffold implements responsive design principles and provides
/// consistent UI elements across the app, including:
/// - Responsive layout management
/// - AppBar customization
/// - Optional footer
/// - Progress indicators
/// - Navigation controls
class CAAScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final List<Widget>? appBarActions;
  final bool implyLeading;
  final bool useScrollView;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool extendBodyBehindAppBar;
  final bool resizeToAvoidBottomInset;

  final bool centerContent;
  final bool canPop;
  final bool showFooter;
  final bool showProgress;
  final double progressValue;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final double? maxContentWidth;

  final Function(bool, dynamic)? onPopInvokedWithResult;

  /// Main constructor for CAAScaffold
  const CAAScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.appBarActions,
    this.implyLeading = true,
    this.useScrollView = false,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.extendBodyBehindAppBar = false,
    this.resizeToAvoidBottomInset = true,
    this.centerContent = false,
    this.canPop = true,
    this.showFooter = true,
    this.showProgress = false,
    this.progressValue = 0,
    this.backgroundColor,
    this.padding,
    this.maxContentWidth,
    this.onPopInvokedWithResult,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: onPopInvokedWithResult,
      child: Scaffold(
        backgroundColor: backgroundColor ?? AppColors.grey800,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: appBar ?? _buildDefaultAppBar(context),
        body: SafeArea(
          child: _buildBody(context),
        ),
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
      ),
    );
  }

  /// Builds the responsive body with appropriate constraints
  Widget _buildBody(BuildContext context) {
    final content = useScrollView
        ? SingleChildScrollView(
            child: _buildBodyContent(context),
          )
        : _buildBodyContent(context);

    return Center(
      child: content,
    );
  }

  /// Builds the body content with appropriate padding and constraints
  Widget _buildBodyContent(BuildContext context) {
    // Use ResponsiveContainer which handles the device-specific sizing
    return ResponsiveContainer(
      mobileMaxWidth:
          maxContentWidth ?? ResponsiveUtils.maxContentWidth[DeviceType.phone],
      tabletMaxWidth:
          maxContentWidth ?? ResponsiveUtils.maxContentWidth[DeviceType.tablet],
      desktopMaxWidth: maxContentWidth ??
          ResponsiveUtils.maxContentWidth[DeviceType.desktop],
      centerHorizontally: true,
      centerVertically: centerContent,
      padding: padding,
      child: Column(
        mainAxisAlignment:
            centerContent ? MainAxisAlignment.center : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: body),
        ],
      ),
    );
  }

  /// Builds a default app bar if none is provided
  PreferredSizeWidget _buildDefaultAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: implyLeading,
      actions: appBarActions,
    );
  }
}

/// Specialized scaffold for standard screens
class CAAScreenScaffold extends CAAScaffold {
  const CAAScreenScaffold({
    super.key,
    required super.body,
    super.appBarActions,
    super.centerContent,
    super.useScrollView = true,
    super.showProgress,
    super.progressValue,
    super.floatingActionButton,
    super.floatingActionButtonLocation,
    super.onPopInvokedWithResult,
    super.canPop,
    super.backgroundColor,
    super.maxContentWidth,
  });
}

/// Specialized scaffold for dialog screens
class CAADialogScaffold<B extends Cubit<S>, S> extends CAAScaffold {
  CAADialogScaffold({
    super.key,
    required super.body,
    required String title,
    super.useScrollView = true,
    super.centerContent,
    super.showProgress,
    super.progressValue,
    super.floatingActionButton,
    super.floatingActionButtonLocation,
    String? actionText,
    VoidCallback? onActionPressed,
    B? bloc,
    bool Function(S)? isLoadingFunction,
    bool closeButton = true,
    super.canPop,
    super.onPopInvokedWithResult,
    super.backgroundColor,
    super.maxContentWidth,
  }) : super(
          appBar: AppBar(
            title: Text(title),
            automaticallyImplyLeading: closeButton,
            actions: [
              if (actionText != null && onActionPressed != null)
                TextButton(
                  onPressed: onActionPressed,
                  child: Text(
                    actionText,
                    style: const TextStyle(color: AppColors.primary),
                  ),
                ),
            ],
          ),
        );
}

/// Specialized scaffold for loading screens
class CAALoadingScreenScaffold extends CAAScaffold {
  const CAALoadingScreenScaffold({
    super.key,
    required super.body,
    super.showProgress = true,
    super.progressValue,
    super.onPopInvokedWithResult,
    super.backgroundColor,
    super.maxContentWidth,
  }) : super(
          showFooter: false,
          centerContent: true,
          canPop: false,
        );
}
