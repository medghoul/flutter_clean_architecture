import 'package:clean_architecture/extensions/string_extensions.dart';
import 'package:clean_architecture/resources/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final bool expand;
  final bool isLoading;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.expand = false,
    this.isLoading = false,
  });

  @override
  _CustomOutlinedButtonState createState() => _CustomOutlinedButtonState();
}

class _CustomOutlinedButtonState extends State<CustomOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.expand ? double.infinity : 170.0,
      height: 55,
      child: OutlinedButton(
        onPressed: widget.isLoading ? null : widget.onPressed,
        style: OutlinedButton.styleFrom(
            disabledBackgroundColor: AppColors.lightGrey,
            foregroundColor: widget.textColor ?? AppColors.white,
            backgroundColor: widget.backgroundColor ?? AppColors.tertiary,
            side: const BorderSide(style: BorderStyle.none),
            elevation: 0),
        child: SizedBox(
          height: 35.0, // Fixed height to accommodate CircularProgressIndicator
          child: Center(
            child: widget.isLoading
                ? const SizedBox(
                    width: 25.0,
                    height: 25.0, 
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.darkGrey,
                      ),
                    ),
                  )
                : Text(
                    widget.text.capitalize(),
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: AppColors.white),
                  ),
          ),
        ),
      ),
    );
  }
}
