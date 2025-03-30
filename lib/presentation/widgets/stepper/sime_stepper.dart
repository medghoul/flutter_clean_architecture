import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simeprofessional_mobileapp_flutter/cdbkr_lib/core/constants/app_colors.dart';
import 'package:simeprofessional_mobileapp_flutter/cdbkr_lib/core/constants/global_constants.dart';
import 'package:simeprofessional_mobileapp_flutter/cdbkr_lib/core/extensions/color_extension.dart';
import 'package:simeprofessional_mobileapp_flutter/presentation/widgets/stepper/cubit/sime_stepper_cubit.dart';
import 'package:simeprofessional_mobileapp_flutter/presentation/widgets/stepper/cubit/sime_stepper_state.dart';

class SimeStepper extends StatelessWidget {
  final bool showStepContent;

  const SimeStepper({
    Key? key,
    this.showStepContent = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimeStepperCubit, SimeStepperState>(
      builder: (context, state) {
        return Column(
          children: [
            // Horizontal steps indicator
            _buildStepIndicators(context, state),

            // Content for the current step
            if (showStepContent)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: GlobalConstants.marginL),
                  child: SingleChildScrollView(
                    child: state.steps[state.currentStepIndex].content ??
                        const SizedBox.shrink(),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildStepIndicators(BuildContext context, SimeStepperState state) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            // Step indicators with connecting lines
            Stack(
              children: [
                // Connecting line
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: GlobalConstants.stepperLineThicknessActive,
                      color: Colors.grey.withOpacityValue(GlobalConstants.opacityLow),
                    ),
                  ),
                ),

                // Step circles
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: state.steps.asMap().entries.map((entry) {
                    final index = entry.key;
                    final step = entry.value;
                    final isActive = state.currentStepIndex == index;
                    final isCompleted = step.isCompleted;

                    return index == 0
                        ? Expanded(
                            child: Row(
                              children: [
                                _buildStepCircle(
                                    context, index + 1, isActive, isCompleted),
                                Expanded(child: Container()),
                              ],
                            ),
                          )
                        : index == state.steps.length - 1
                            ? Expanded(
                                child: Row(
                                  children: [
                                    Expanded(child: Container()),
                                    _buildStepCircle(
                                        context, index + 1, isActive, isCompleted),
                                  ],
                                ),
                              )
                            : Expanded(
                                child: Center(
                                  child: _buildStepCircle(
                                      context, index + 1, isActive, isCompleted),
                                ),
                              );
                  }).toList(),
                ),
              ],
            ),

            const SizedBox(height: GlobalConstants.marginS),

            // Step titles
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: state.steps.asMap().entries.map((entry) {
                final index = entry.key;
                final step = entry.value;
                final isActive = state.currentStepIndex == index;
                final isCompleted = step.isCompleted;
                
                // Calculate available space per step
                final itemWidth = constraints.maxWidth / state.steps.length;
                final fontSize = itemWidth < 90 ? GlobalConstants.fontXS : GlobalConstants.fontS;

                return index == 0
                    ? Expanded(
                        child: Row(
                          children: [
                            Text(
                              'Step ${index + 1}',
                              style: TextStyle(
                                color: _getStepColor(isActive, isCompleted),
                                fontWeight:
                                    isActive ? FontWeight.bold : FontWeight.normal,
                                fontSize: fontSize,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Expanded(child: Container()),
                          ],
                        ),
                      )
                    : index == state.steps.length - 1
                        ? Expanded(
                            child: Row(
                              children: [
                                Expanded(child: Container()),
                                Text(
                                  'Step ${index + 1}',
                                  style: TextStyle(
                                    color: _getStepColor(isActive, isCompleted),
                                    fontWeight: isActive
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    fontSize: fontSize,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          )
                        : Expanded(
                            child: Center(
                              child: Text(
                                'Step ${index + 1}',
                                style: TextStyle(
                                  color: _getStepColor(isActive, isCompleted),
                                  fontWeight: isActive
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: fontSize,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
              }).toList(),
            ),
          ],
        );
      }
    );
  }

  Widget _buildStepCircle(
      BuildContext context, int stepNumber, bool isActive, bool isCompleted) {
    final circleColor = _getStepColor(isActive, isCompleted);

    return Container(
      width: GlobalConstants.stepperIconSize,
      height: GlobalConstants.stepperIconSize,
      decoration: BoxDecoration(
        color: isCompleted
            ? AppColors.primary
            : (isActive ? AppColors.primary : AppColors.grey600),
        shape: BoxShape.circle,
        boxShadow: isActive
            ? [
                BoxShadow(
                    color: AppColors.primary.withOpacityValue(GlobalConstants.opacityLow),
                    blurRadius: GlobalConstants.shadowBlurRadius,
                    spreadRadius: GlobalConstants.shadowSpreadRadius)
              ]
            : null,
      ),
      child: Center(
        child: isCompleted
            ? Icon(Icons.check, color: Colors.white, size: GlobalConstants.stepperIconSmallSize)
            : Text(
                '$stepNumber',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }

  Color _getStepColor(bool isActive, bool isCompleted) {
    if (isCompleted || isActive) {
      return AppColors.primary;
    } else {
      return Colors.grey;
    }
  }
}
