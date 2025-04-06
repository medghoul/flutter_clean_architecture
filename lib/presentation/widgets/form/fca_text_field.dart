import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:clean_architecture/core/constants/global_constants.dart';
import 'package:clean_architecture/core/extensions/color_extension.dart';
import 'package:clean_architecture/core/responsive/index.dart';
import 'package:clean_architecture/core/services/logger/logging.dart';
import 'package:flutter/material.dart';

class FCATextField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final String hintText;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final AutovalidateMode autovalidateMode;
  final TextStyle? textStyle;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final bool enabled;
  final int? maxLines;
  final int? minLines;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry contentPadding;
  final double? maxWidth;

  const FCATextField({
    super.key,
    this.controller,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.textStyle,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.enabled = true,
    this.maxLines = 1,
    this.minLines,
    this.textInputAction,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    // Log responsive values for debugging
    final deviceType = ResponsiveUtils.getDeviceType(context);
    final screenWidth = MediaQuery.of(context).size.width;

    // Log values for debugging
    logger.d('SimeTextField - deviceType: $deviceType');
    logger.d('SimeTextField - screenWidth: $screenWidth');

    final defaultTextStyle = TextStyle(color: AppColors.white);

    // Define our default maximum width based on screen size
    final defaultMaxWidth = context.adaptiveValue(
      mobile: double.infinity,
      tablet: 400.0,
      desktop: 500.0,
    );

    logger.d('SimeTextField - defaultMaxWidth: $defaultMaxWidth');

    // Create the text field with the appropriate decoration
    Widget textField = TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      autovalidateMode: autovalidateMode,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      focusNode: focusNode,
      enabled: enabled,
      maxLines: maxLines,
      minLines: minLines,
      textInputAction: textInputAction,
      style: textStyle ??
          defaultTextStyle.copyWith(fontSize: GlobalConstants.fontM.sp),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(
          prefixIcon,
          color: AppColors.grey400,
          size: GlobalConstants.iconM.w,
        ),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColors.white.withOpacityValue(GlobalConstants.opacityLow),
        labelStyle: TextStyle(
            color: AppColors.grey300, fontSize: GlobalConstants.fontS.sp),
        hintStyle: TextStyle(
            color: AppColors.grey500, fontSize: GlobalConstants.fontS.sp),
        contentPadding: contentPadding is EdgeInsets
            ? EdgeInsets.symmetric(
                horizontal: GlobalConstants.paddingM.w,
                vertical: GlobalConstants.paddingM.h,
              )
            : contentPadding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GlobalConstants.radiusL.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GlobalConstants.radiusL.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GlobalConstants.radiusL.r),
          borderSide: BorderSide(color: AppColors.primary, width: 2.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GlobalConstants.radiusL.r),
          borderSide: BorderSide(color: AppColors.error, width: 1.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GlobalConstants.radiusL.r),
          borderSide: BorderSide(color: AppColors.error, width: 2.w),
        ),
        errorStyle: TextStyle(
            color: AppColors.error, fontSize: GlobalConstants.fontXS.sp),
      ),
    );

    // Apply maximum width constraint
    return Container(
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? defaultMaxWidth,
      ),
      child: textField,
    );
  }
}
