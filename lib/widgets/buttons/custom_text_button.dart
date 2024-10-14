import 'package:clean_architecture/core/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final Function()? onPressed;
  final String label;
  final Color? textColor;
  final bool isLoading;
  final IconData? icon;

  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.textColor,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = Theme.of(context).textTheme.labelMedium;
    final primaryColor = Theme.of(context).colorScheme.primary;

    Color getTextColor() {
      return textColor ?? defaultTextStyle?.color ?? primaryColor;
    }

    Color getFocusColor() {
      final color = getTextColor();
      return color.withOpacity(0.2);
    }

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
      ),
      label: isLoading
          ? SizedBox(
              height: defaultTextStyle?.fontSize ?? 16,
              width: defaultTextStyle?.fontSize ?? 16,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(getTextColor()),
                strokeWidth: 2,
              ),
            )
          : Text(
              label.capitalize(),
              style: TextStyle(
                color: getTextColor(),
                fontWeight: FontWeight.w600,
                fontSize: defaultTextStyle?.fontSize ?? 16,
              ),
            ),
    );
  }
}
