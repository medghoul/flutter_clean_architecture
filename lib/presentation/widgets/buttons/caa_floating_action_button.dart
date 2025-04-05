import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:clean_architecture/core/constants/global_constants.dart';
import 'package:flutter/material.dart';

/// A customized floating action button widget.
///
/// This button extends the Material Design FAB with additional features:
/// - Customizable background color
/// - Customizable foreground color
/// - Configurable elevation
/// - Consistent styling with app theme
/// - Rounded corners with fixed radius
class CAAFloatingActionButton extends StatelessWidget {
  /// Callback function when button is pressed
  final VoidCallback onPressed;

  /// Icon to display in the FAB
  final IconData icon;

  /// Optional custom background color
  /// If not provided, uses theme's primary color
  final Color? backgroundColor;

  /// Optional custom foreground color
  /// If not provided, uses white color
  final Color? foregroundColor;

  /// Optional custom elevation
  /// If not provided, uses 1.0
  final double? elevation;

  /// Creates a [CAAFloatingActionButton].
  ///
  /// Parameters:
  /// - [onPressed]: Callback function when button is pressed
  /// - [icon]: Icon to display in the FAB
  /// - [backgroundColor]: Optional custom background color
  /// - [foregroundColor]: Optional custom foreground color
  /// - [elevation]: Optional custom elevation
  const CAAFloatingActionButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.backgroundColor = AppColors.primary,
    this.foregroundColor = AppColors.white,
    this.elevation = 1,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      elevation: elevation,
      foregroundColor: foregroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(GlobalConstants.fabSize / 2),
      ),
      child: Icon(icon),
    );
  }
}
