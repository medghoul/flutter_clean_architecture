import 'package:clean_architecture/core/extensions/context_extension.dart';
import 'package:clean_architecture/features/profile/presentation/cubits/change_pwd_cubit/change_pwd_cubit.dart';
import 'package:clean_architecture/core/resources/res.dart';
import 'package:clean_architecture/widgets/ui/app_bar_title.dart';
import 'package:clean_architecture/widgets/ui/text_form_fields/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChangePwdPage extends StatelessWidget {
  const ChangePwdPage({super.key});

  void _showSnackBar(BuildContext context, String message) {
    if (message.isNotEmpty) {
      final snackBar =
          SnackBar(content: Text(message), behavior: SnackBarBehavior.floating);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChangePwdCubit(),
      child: BlocBuilder<ChangePwdCubit, void>(
        builder: (context, state) {
          final cubit = context.read<ChangePwdCubit>();

          return PopScope(
            onPopInvoked: (bool value) async {
              cubit.resetPasswordFields();
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: AppBarTitle(title: context.translate('profilePage.editPassword')),
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ),
              body: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppDimensions.paddingM),
                    child: Form(
                      key: cubit.state.formKey,
                      child: ListView(
                        children: [
                          const SizedBox(height: AppDimensions.paddingM),
                          CustomTextField(
                            controller: cubit.state.oldPwd,
                            obscureText: cubit.state.showOldPassword,
                            suffixIcon: IconButton(
                              icon: Icon(
                                cubit.state.showOldPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: cubit.onShowOldPasswordPressed,
                            ),
                          ),
                          const SizedBox(height: AppDimensions.paddingM),
                          CustomTextField(
                            controller: cubit.state.newPwd,
                            obscureText: cubit.state.showNewPassword,
                            hintText: context.translate('textFormFieldHints.insertNewPassword'),
                            suffixIcon: IconButton(
                              icon: Icon(
                                cubit.state.showNewPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: cubit.onShowNewPasswordPressed,
                            ),
                          ),
                          const SizedBox(height: AppDimensions.paddingM),
                          CustomTextField(
                            controller: cubit.state.confirmNewPwd,
                            obscureText: cubit.state.showConfirmNewPassword,
                            suffixIcon: IconButton(
                              icon: Icon(
                                cubit.state.showConfirmNewPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: cubit.onShowConfirmNewPasswordPressed,
                            ),
                          ),
                          const SizedBox(height: AppDimensions.paddingM),
                          ElevatedButton(
                            onPressed: () async {
                              await cubit.pwdReset(context);
                            },
                            child: Text(context.translate('generic.save')),
                          ),
                          const SizedBox(height: AppDimensions.paddingM),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
