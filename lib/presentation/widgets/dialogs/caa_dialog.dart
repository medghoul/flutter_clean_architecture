import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:clean_architecture/core/constants/global_constants.dart';
import 'package:clean_architecture/core/extensions/string_extension.dart';
import 'package:clean_architecture/core/structures/enums.dart';
import 'package:clean_architecture/presentation/widgets/buttons/index.dart';
import 'package:flutter/material.dart';

/// A customizable dialog widget that provides a consistent look and feel across the app.
///
/// This dialog supports various features including:
/// - Custom title and subtitle
/// - Different dialog types with corresponding icons
/// - Dynamic content area
/// - Customizable action buttons
/// - Loading state
/// - Form validation
class CAADialog extends StatelessWidget {
  /// The title displayed at the top of the dialog.
  final String title;

  /// Optional subtitle displayed below the title.
  final String? subtitle;

  /// The type of dialog which determines the icon and color scheme.
  final DialogType? type;

  /// Optional custom icon to override the default icon based on type.
  final IconData? customIcon;

  /// List of widgets to be displayed in the content area of the dialog.
  final List<Widget>? dynamicContent;

  /// Form key used for validation if the dialog contains form fields.
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Callback function executed when the confirm button is pressed.
  final VoidCallback? onConfirm;

  /// Callback function executed when the close button is pressed.
  final VoidCallback? onClose;

  /// Custom label for the confirm button.
  final String? confirmButtonLabel;

  /// Custom label for the close button.
  final String? closeButtonLabel;

  /// Optional custom confirm button widget to replace the default one.
  final Widget? customConfirmButton;

  /// Controls the visibility of the close button.
  final bool closeButtonVisible;

  /// Indicates whether the dialog is in a loading state.
  final bool isLoading;

  /// Creates a [CAADialog].
  ///
  /// The [title] parameter is required.
  /// All other parameters are optional and will use default values if not provided.
  CAADialog({
    super.key,
    required this.title,
    this.subtitle,
    this.type,
    this.customIcon,
    this.dynamicContent,
    this.onConfirm,
    this.onClose,
    this.confirmButtonLabel,
    this.closeButtonLabel,
    this.customConfirmButton,
    this.closeButtonVisible = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ModalRoute.of(context)!.animation!,
      builder: (context, child) {
        return Transform.scale(
          scale: ModalRoute.of(context)!.animation!.value,
          child: Opacity(
            opacity: ModalRoute.of(context)!.animation!.value,
            child: AlertDialog(
              elevation: 0,
              title: Text(
                title.toCapitalized(),
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headlineLarge
              ),
              titlePadding: EdgeInsets.all(GlobalConstants.paddingXL),
              contentPadding: EdgeInsets.only(
                left: GlobalConstants.paddingXL,
                right: GlobalConstants.paddingXL,
                bottom: GlobalConstants.paddingM,
              ),
              insetPadding: EdgeInsets.all(GlobalConstants.paddingM),
              content: SizedBox(
                width: 400,
                child: _buildContent(context),
              ),
              actions: _buildActionButtons(context),
              scrollable: true,
            ),
          ),
        );
      },
    );
  }

  /// Builds the content section of the dialog.
  ///
  /// Includes subtitle (if provided) and dynamic content widgets.
  Widget _buildContent(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    TextStyle contentTextStyle = textTheme.bodyMedium!;

    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (subtitle != null && subtitle!.isNotEmpty) ...[
            Text(
              subtitle!,
              style: contentTextStyle,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: GlobalConstants.marginL),
          ],
          if (dynamicContent != null) ...dynamicContent!,
        ],
      ),
    );
  }

  /// Builds the action buttons for the dialog.
  ///
  /// Returns a list of widgets containing close and confirm buttons
  /// based on the dialog configuration.
  List<Widget> _buildActionButtons(BuildContext context) {
    return [
      if (closeButtonVisible)
        CAAOutlinedButton(
          onPressed: onClose ?? () => Navigator.pop(context),
          text: closeButtonLabel ?? 'Close'.toCapitalized(),
        ),
      if (customConfirmButton != null)
        customConfirmButton!
      else
        CAATextButton(
          textColor: AppColors.primary,
          isLoading: isLoading,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Navigator.pop(context);
              onConfirm?.call();
            }
          },
          label: confirmButtonLabel ?? 'Confirm'.toCapitalized(),
        ),
    ];
  }
}
