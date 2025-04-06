import 'package:clean_architecture/core/constants/global_constants.dart';
import 'package:clean_architecture/core/extensions/string_extension.dart';
import 'package:flutter/material.dart';

/// A customized text button widget with loading state and optional icon.
///
/// This button extends the Material Design text button with additional features:
/// - Loading state with progress indicator
/// - Optional leading icon
/// - Customizable text color
/// - Auto-capitalization of label text
/// - Consistent styling with app theme
class FCATextButton extends StatelessWidget {
  /// Callback function when button is pressed
  final Function()? onPressed;

  /// Text to display on the button
  final String label;

  /// Optional custom text color. If not provided, uses theme's primary color
  final Color? textColor;

  /// Whether to show loading indicator instead of label
  final bool isLoading;

  /// Optional icon to display before the text
  final IconData? icon;

  /// Creates a [FCATextButton].
  ///
  /// Parameters:
  /// - [onPressed]: Callback function when button is pressed
  /// - [label]: Text to display on the button
  /// - [textColor]: Optional custom text color
  /// - [icon]: Optional leading icon
  /// - [isLoading]: Whether to show loading state
  const FCATextButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.textColor,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = Theme.of(context).textTheme.labelSmall;
    final primaryColor = Theme.of(context).colorScheme.primary;

    Color getTextColor() {
      return textColor ?? defaultTextStyle?.color ?? primaryColor;
    }

    Color getFocusColor() {
      final color = getTextColor();
      return color.withAlpha((255 * GlobalConstants.opacityLow).round());
    }

    final indicatorSize = defaultTextStyle?.fontSize ?? GlobalConstants.fontM;

    return TextButton.icon(
      icon: icon != null ? Icon(icon) : null,
      onPressed: isLoading ? null : onPressed,
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.focused) ||
              states.contains(WidgetState.pressed)) {
            return getFocusColor();
          }
          return null;
        }),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: GlobalConstants.paddingM,
            vertical: GlobalConstants.paddingS,
          ),
        ),
      ),
      label: isLoading
          ? SizedBox(
              height: indicatorSize,
              width: indicatorSize,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(getTextColor()),
                strokeWidth: GlobalConstants.progressIndicatorStrokeWidth,
              ),
            )
          : Text(
              label.toCapitalized(),
              style: TextStyle(
                color: getTextColor(),
                fontWeight: FontWeight.w600,
                fontSize: defaultTextStyle?.fontSize ?? GlobalConstants.fontM,
              ),
            ),
    );
  }
}
