import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:clean_architecture/core/constants/global_constants.dart';
import 'package:clean_architecture/core/structures/enums.dart';
import 'package:flutter/material.dart';

/// Shows a customized snackbar with different types and animations.
///
/// This function creates and shows a snackbar with the following features:
/// - Four types: success, error, warning, info
/// - Fade-in animation
/// - Customizable duration
/// - Title and optional message
/// - Type-specific icons and colors
/// - Rounded corners and consistent styling
/// - Floating behavior
/// - Auto-dismissal
///
/// Parameters:
/// - [context]: BuildContext for showing the snackbar
/// - [title]: Main text to display
/// - [message]: Optional secondary text
/// - [type]: Type of snackbar (success, error, warning, info)
/// - [duration]: How long the snackbar should be displayed
void FCASnackbar({
  required BuildContext context,
  required String title,
  String? message,
  required SnackType type,
  Duration duration = const Duration(seconds: 3),
}) {
  final controller = AnimationController(
    vsync: ScaffoldMessenger.of(context),
    duration: GlobalConstants.animationFast,
  );
  final animation = CurvedAnimation(
    parent: controller,
    curve: Curves.easeInCubic,
  );

  controller.forward();

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Opacity(
            opacity: animation.value,
            child: child,
          );
        },
        child: IntrinsicHeight(
          child: Container(
            constraints: BoxConstraints(
              minHeight: GlobalConstants.bottomSheetMinHeight,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _getBackgroundColor(context, type),
              borderRadius: BorderRadius.circular(GlobalConstants.radiusM),
            ),
            padding: EdgeInsets.all(GlobalConstants.paddingM),
            child: Row(
              children: [
                _getIcon(context, type),
                SizedBox(width: GlobalConstants.marginS),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        overflow: TextOverflow.fade,
                        maxLines: 2,
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: type == SnackType.info
                                    ? Theme.of(context).colorScheme.onSurface
                                    : AppColors.white),
                      ),
                      Visibility(
                        visible: message != null && message.isNotEmpty,
                        child: Text(
                          maxLines: 5,
                          message ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: type == SnackType.info
                                      ? Theme.of(context).colorScheme.onSurface
                                      : AppColors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.transparent,
      duration: duration,
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(GlobalConstants.radiusM),
      ),
      dismissDirection: DismissDirection.up,
      margin: EdgeInsets.all(GlobalConstants.marginM),
      elevation: 2,
    ),
  );

  controller.addStatusListener((status) {
    if (status == AnimationStatus.dismissed) {
      controller.dispose();
    }
  });
}

/// Gets the background color based on snackbar type
Color _getBackgroundColor(BuildContext context, SnackType type) {
  switch (type) {
    case SnackType.success:
      return AppColors.success;
    case SnackType.error:
      return AppColors.error;
    case SnackType.warning:
      return AppColors.warning;
    case SnackType.info:
      return Theme.of(context).colorScheme.surfaceContainer;
  }
}

/// Gets the appropriate icon based on snackbar type
Widget _getIcon(BuildContext context, SnackType type) {
  final iconSize = GlobalConstants.iconL;

  switch (type) {
    case SnackType.success:
      return Icon(
        Icons.check_circle_outline,
        color: AppColors.white,
        size: iconSize,
      );
    case SnackType.error:
      return Icon(
        Icons.error_outline,
        color: AppColors.white,
        size: iconSize,
      );
    case SnackType.warning:
      return Icon(
        Icons.warning_outlined,
        color: AppColors.primary,
        size: iconSize,
      );
    case SnackType.info:
      return Icon(
        Icons.info_outline,
        color: Theme.of(context).colorScheme.onSurface,
        size: iconSize,
      );
  }
}
