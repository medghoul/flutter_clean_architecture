import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:clean_architecture/core/constants/global_constants.dart';
import 'package:clean_architecture/core/extensions/color_extension.dart';
import 'package:clean_architecture/core/responsive/index.dart';
import 'package:flutter/material.dart';

class CAADropdownField<T> extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData prefixIcon;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final AutovalidateMode autovalidateMode;
  final bool enabled;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry contentPadding;

  const CAADropdownField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    required this.items,
    this.value,
    this.onChanged,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.enabled = true,
    this.focusNode,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      onChanged: enabled ? onChanged : null,
      validator: validator,
      autovalidateMode: autovalidateMode,
      focusNode: focusNode,
      icon: Icon(
        Icons.arrow_drop_down,
        color: AppColors.grey400,
        size: GlobalConstants.iconM.w,
      ),
      dropdownColor: AppColors.grey700,
      style: TextStyle(
        color: AppColors.white,
        fontSize: GlobalConstants.fontM.sp,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(
          prefixIcon,
          color: AppColors.grey400,
          size: GlobalConstants.iconM.w,
        ),
        filled: true,
        fillColor: AppColors.white.withOpacityValue(GlobalConstants.opacityLow),
        labelStyle: TextStyle(
            color: AppColors.grey300, fontSize: GlobalConstants.fontS.sp),
        hintStyle: TextStyle(
            color: AppColors.grey500, fontSize: GlobalConstants.fontS.sp),
        contentPadding: contentPadding is EdgeInsets
            ? EdgeInsets.symmetric(
                horizontal: GlobalConstants.paddingM.w,
                vertical: GlobalConstants.paddingXS.h,
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
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GlobalConstants.radiusL.r),
          borderSide: BorderSide.none,
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
  }
}
