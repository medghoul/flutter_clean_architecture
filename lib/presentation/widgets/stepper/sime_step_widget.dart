import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simeprofessional_mobileapp_flutter/cdbkr_lib/core/constants/app_colors.dart';
import 'package:simeprofessional_mobileapp_flutter/cdbkr_lib/core/constants/global_constants.dart';
import 'package:simeprofessional_mobileapp_flutter/cdbkr_lib/core/extensions/color_extension.dart';
import 'package:simeprofessional_mobileapp_flutter/presentation/widgets/stepper/cubit/sime_stepper_cubit.dart';
import 'package:simeprofessional_mobileapp_flutter/presentation/widgets/stepper/models/sime_step.dart';

class SimeStepWidget extends StatelessWidget {
  final SimeStep step;
  final bool isActive;
  final bool isLast;
  final int stepNumber;
  final VoidCallback? onNext;

  const SimeStepWidget({
    super.key,
    required this.step,
    required this.isActive,
    required this.isLast,
    required this.stepNumber,
    this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: GlobalConstants.marginL),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildIconColumn(context),
            const SizedBox(width: GlobalConstants.marginL),
            Expanded(child: _buildContentColumn(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildIconColumn(BuildContext context) {
    return Column(
      children: [
        _buildStepIcon(context),
        if (!isLast)
          Expanded(
            child: VerticalDivider(
              thickness: GlobalConstants.stepperLineThickness,
              indent: GlobalConstants.stepperLineIndent,
            ),
          ),
      ],
    );
  }

  Widget _buildContentColumn(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: GlobalConstants.stepperMinHeight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(context),
          const SizedBox(height: GlobalConstants.marginL),
          if (step.subtitle != null && isActive) _buildSubtitle(context),
          if (step.content != null && (isActive || step.isCompleted))
            _buildContent(),
          if (isActive) _buildNextButton(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      step.title,
      style: theme.textTheme.headlineMedium!.copyWith(
        color: isActive || step.isCompleted
            ? theme.colorScheme.onSurface
            : theme.colorScheme.onSurface.withOpacityValue(GlobalConstants.opacityMedium),
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: GlobalConstants.marginS),
      child: Text(
        step.subtitle!,
        style: theme.textTheme.bodyMedium!.copyWith(
          color: theme.colorScheme.onSurface.withOpacityValue(GlobalConstants.opacityHigh),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.only(
        top: GlobalConstants.marginS, 
        bottom: GlobalConstants.marginM
      ),
      child: SizedBox(
        width: double.infinity,
        child: step.content!,
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(top: GlobalConstants.marginM),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: GlobalConstants.buttonMaxWidth),
          child: ElevatedButton(
            onPressed: () {
              if (onNext != null) {
                onNext!();
              } else {
                // Use the cubit to navigate to next step
                final cubit = context.read<SimeStepperCubit>();
                if (isLast) {
                  // Handle last step completion
                  cubit.completeRegistration();
                } else {
                  cubit.goToNextStep();
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: GlobalConstants.paddingL, 
                vertical: GlobalConstants.paddingS
              ),
              minimumSize: Size(GlobalConstants.buttonMinWidth, GlobalConstants.buttonHeight),
            ),
            child: Text(
              isLast ? 'Submit' : 'Next',
              overflow: TextOverflow.ellipsis, // Handle text overflow
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepIcon(BuildContext context) {
    final theme = Theme.of(context);
    if (step.isCompleted) {
      return _buildIconContainer(
        color: AppColors.success,
        icon: Icons.check_outlined,
        context: context,
      );
    } else if (isLast) {
      return _buildIconContainer(
        color: isActive
            ? AppColors.success
            : theme.colorScheme.onSurface.withOpacityValue(GlobalConstants.opacityMedium),
        icon: Icons.sports_score_outlined,
        context: context,
      );
    } else if (step.inProgress) {
      return _buildNumberContainer(context);
    } else if (step.inError) {
      return _buildIconContainer(
        color: AppColors.error,
        icon: Icons.priority_high_outlined,
        context: context,
      );
    } else {
      return _buildNumberContainer(context);
    }
  }

  Widget _buildIconContainer({
    required Color color,
    required IconData icon,
    required BuildContext context,
  }) {
    return Container(
      width: GlobalConstants.stepperIconSize,
      height: GlobalConstants.stepperIconSize,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: AppColors.white,
      ),
    );
  }

  Widget _buildNumberContainer(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: GlobalConstants.stepperIconSize,
      height: GlobalConstants.stepperIconSize,
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.primary
            : theme.colorScheme.onSurface.withOpacityValue(GlobalConstants.opacityMedium),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '$stepNumber',
          style: theme.textTheme.headlineSmall!.copyWith(
            color: theme.colorScheme.surface,
          ),
        ),
      ),
    );
  }
}
