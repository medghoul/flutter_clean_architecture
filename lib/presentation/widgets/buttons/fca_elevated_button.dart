import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:clean_architecture/core/constants/global_constants.dart';
import 'package:clean_architecture/core/extensions/string_extension.dart';
import 'package:clean_architecture/core/structures/enums.dart';
import 'package:flutter/material.dart';

/// A customized elevated button widget with loading state and size variants.
///
/// This button extends the Material Design elevated button with additional features:
/// - Loading state with progress indicator
/// - Size variants (normal and small)
/// - Customizable background and text colors
/// - Optional width expansion
/// - Auto-capitalization of text
/// - Consistent styling with app theme
class FCAElevatedButton extends StatefulWidget {
  /// Text to display on the button
  final String text;

  /// Callback function when button is pressed
  final VoidCallback? onPressed;

  /// Optional custom background color
  final Color? backgroundColor;

  /// Optional custom text color
  final Color? textColor;

  /// Whether to expand button to full width
  final bool expand;

  /// Whether to show loading indicator instead of text
  final bool isLoading;

  /// Size variant of the button (normal or small)
  final ButtonSize size;

  /// Creates a [FCAElevatedButton].
  ///
  /// Parameters:
  /// - [text]: Text to display on the button
  /// - [onPressed]: Callback function when button is pressed
  /// - [backgroundColor]: Optional custom background color
  /// - [textColor]: Optional custom text color
  /// - [expand]: Whether to expand button to full width
  /// - [isLoading]: Whether to show loading state
  /// - [size]: Size variant of the button
  const FCAElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.expand = false,
    this.isLoading = false,
    this.size = ButtonSize.normal,
  });

  @override
  State<FCAElevatedButton> createState() => _FCAElevatedButtonState();
}

class _FCAElevatedButtonState extends State<FCAElevatedButton> {
  /// Height of the button based on size variant
  double get _height => widget.size == ButtonSize.normal
      ? GlobalConstants.buttonNormalHeight
      : GlobalConstants.buttonSmallHeight;

  /// Size of the progress indicator based on button size
  double get _progressIndicatorSize =>
      _height * GlobalConstants.buttonProgressIndicatorRatio;

  /// Font size of the button text based on size variant
  double get _textFontSize => widget.size == ButtonSize.normal
      ? Theme.of(context).textTheme.labelLarge?.fontSize ??
          GlobalConstants.fontM
      : (Theme.of(context).textTheme.labelLarge?.fontSize ??
              GlobalConstants.fontM) *
          GlobalConstants.buttonTextSizeRatio;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: widget.size == ButtonSize.normal
            ? GlobalConstants.buttonNormalMinWidth
            : GlobalConstants.buttonSmallMinWidth,
        maxWidth:
            widget.expand ? double.infinity : GlobalConstants.buttonMaxWidth,
      ),
      child: SizedBox(
        height: _height,
        child: ElevatedButton(
          onPressed: widget.isLoading ? null : widget.onPressed,
          style: ElevatedButton.styleFrom(
            disabledBackgroundColor: AppColors.grey200,
            foregroundColor: widget.textColor ?? AppColors.white,
            backgroundColor: widget.backgroundColor ?? AppColors.primary,
            elevation: 0,
            padding: EdgeInsets.symmetric(
              horizontal: widget.size == ButtonSize.normal
                  ? GlobalConstants.paddingL
                  : GlobalConstants.paddingM,
            ),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(GlobalConstants.buttonBorderRadius),
            ),
          ),
          child: SizedBox(
            height: _height * 0.7,
            child: Center(
              child: widget.isLoading
                  ? SizedBox(
                      width: _progressIndicatorSize,
                      height: _progressIndicatorSize,
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColors.grey700),
                        strokeWidth:
                            GlobalConstants.progressIndicatorStrokeWidth,
                      ),
                    )
                  : Text(
                      widget.text.toCapitalized(),
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: widget.textColor ?? AppColors.white,
                            fontSize: _textFontSize,
                          ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
