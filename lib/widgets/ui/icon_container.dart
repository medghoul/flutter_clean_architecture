import 'package:clean_architecture/core/resources/res.dart';
import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({
    required this.icon,
    super.key,
    this.size = 35,
    this.showShadow = true,
  });
  final IconData icon;
  final double size;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.paddingS),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(
          AppDimensions.borderRadiusS,
        ),
        boxShadow: showShadow
            ? [
                const BoxShadow(
                  color: Colors.black26,
                  blurRadius: AppDimensions.containerShadowBlurRadius,
                  offset: Offset(
                    AppDimensions.containerShadowOffsetX,
                    AppDimensions.containerShadowOffsetY,
                  ),
                ),
              ]
            : [],
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: size,
      ),
    );
  }
}
