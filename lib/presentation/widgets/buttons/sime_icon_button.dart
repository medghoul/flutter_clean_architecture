import 'package:flutter/material.dart';
import 'package:simeprofessional_mobileapp_flutter/cdbkr_lib/core/constants/app_colors.dart';
import 'package:simeprofessional_mobileapp_flutter/cdbkr_lib/core/constants/global_constants.dart';

/// A customized icon button widget with loading state.
///
/// This button extends the Material Design icon button with additional features:
/// - Loading state with progress indicator
/// - Customizable icon color
/// - Consistent styling with app theme
/// - Automatic color inheritance from IconTheme
class SimeIconButton extends StatelessWidget {
  /// Callback function when button is pressed
  final VoidCallback onPressed;

  /// Icon to display in the button
  final IconData icon;

  /// Whether to show loading indicator instead of icon
  final bool isLoading;

  /// Optional custom icon color
  /// If not provided, inherits from IconTheme
  final Color? color;

  /// Creates a [SimeIconButton].
  ///
  /// Parameters:
  /// - [onPressed]: Callback function when button is pressed
  /// - [icon]: Icon to display in the button
  /// - [isLoading]: Whether to show loading state
  /// - [color]: Optional custom icon color
  SimeIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.isLoading = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? IconTheme.of(context).color;
    return IconButton(
      onPressed: isLoading ? null : onPressed,
      icon: isLoading
          ? SizedBox(
              width: GlobalConstants.iconM,
              height: GlobalConstants.iconM,
              child: CircularProgressIndicator(
                strokeWidth: GlobalConstants.progressIndicatorStrokeWidth,
              ),
            )
          : Icon(icon),
      color: effectiveColor ?? AppColors.primary,
    );
  }
}
