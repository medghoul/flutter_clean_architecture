import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simeprofessional_mobileapp_flutter/cdbkr_lib/core/constants/app_colors.dart';
import 'package:simeprofessional_mobileapp_flutter/core/responsive/index.dart';

/// Main scaffold widget for SIME Professional app
/// 
/// This scaffold implements responsive design principles and provides
/// consistent UI elements across the app, including:
/// - Responsive layout management
/// - AppBar customization
/// - Optional footer
/// - Progress indicators
/// - Navigation controls
class SimeScaffold extends StatelessWidget {
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

  /// Main constructor for SimeScaffold
  const SimeScaffold({
    Key? key,
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
  }) : super(key: key);

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
      mobileMaxWidth: maxContentWidth ?? ResponsiveUtils.maxContentWidth[DeviceType.phone],
      tabletMaxWidth: maxContentWidth ?? ResponsiveUtils.maxContentWidth[DeviceType.tablet],
      desktopMaxWidth: maxContentWidth ?? ResponsiveUtils.maxContentWidth[DeviceType.desktop],
      centerHorizontally: true,
      centerVertically: centerContent,
      padding: padding,
      child: Column(
        mainAxisAlignment: centerContent ? MainAxisAlignment.center : MainAxisAlignment.start,
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
class SimeScreenScaffold extends SimeScaffold {
  const SimeScreenScaffold({
    Key? key,
    required Widget body,
    List<Widget>? appBarActions,
    bool centerContent = false,
    bool useScrollView = true,
    bool showProgress = false,
    double progressValue = 0,
    Widget? floatingActionButton,
    FloatingActionButtonLocation? floatingActionButtonLocation,
    Function(bool, dynamic)? onPopInvokedWithResult,
    bool canPop = true,
    Color? backgroundColor,
    double? maxContentWidth,
  }) : super(
          key: key,
          body: body,
          appBarActions: appBarActions,
          centerContent: centerContent,
          useScrollView: useScrollView,
          showProgress: showProgress,
          progressValue: progressValue,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          onPopInvokedWithResult: onPopInvokedWithResult,
          canPop: canPop,
          backgroundColor: backgroundColor,
          maxContentWidth: maxContentWidth,
        );
}

/// Specialized scaffold for dialog screens
class SimeDialogScaffold<B extends Cubit<S>, S> extends SimeScaffold {
  SimeDialogScaffold({
    Key? key,
    required Widget body,
    required String title,
    bool useScrollView = true,
    bool centerContent = false,
    bool showProgress = false,
    double progressValue = 0,
    Widget? floatingActionButton,
    FloatingActionButtonLocation? floatingActionButtonLocation,
    String? actionText,
    VoidCallback? onActionPressed,
    B? bloc,
    bool Function(S)? isLoadingFunction,
    bool closeButton = true,
    bool canPop = true,
    Function(bool, dynamic)? onPopInvokedWithResult,
    Color? backgroundColor,
    double? maxContentWidth,
  }) : super(
          key: key,
          body: body,
          useScrollView: useScrollView,
          centerContent: centerContent,
          showProgress: showProgress,
          progressValue: progressValue,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          canPop: canPop,
          onPopInvokedWithResult: onPopInvokedWithResult,
          backgroundColor: backgroundColor,
          maxContentWidth: maxContentWidth,
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
class SimeLoadingScreenScaffold extends SimeScaffold {
  const SimeLoadingScreenScaffold({
    Key? key,
    required Widget body,
    bool showProgress = true,
    double progressValue = 0,
    Function(bool, dynamic)? onPopInvokedWithResult,
    Color? backgroundColor,
    double? maxContentWidth,
  }) : super(
          key: key,
          body: body,
          showProgress: showProgress,
          progressValue: progressValue,
          onPopInvokedWithResult: onPopInvokedWithResult,
          showFooter: false,
          centerContent: true,
          canPop: false,
          backgroundColor: backgroundColor,
          maxContentWidth: maxContentWidth,
        );
} 
