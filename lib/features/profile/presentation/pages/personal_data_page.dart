import 'package:clean_architecture/core/extensions/context_extension.dart';
import 'package:clean_architecture/features/profile/presentation/cubits/personal_data_cubit/personal_data_cubit.dart';
import 'package:clean_architecture/features/profile/presentation/cubits/personal_data_cubit/personal_data_state.dart';
import 'package:clean_architecture/core/resources/res.dart';
import 'package:clean_architecture/widgets/ui/app_bar_title.dart';
import 'package:clean_architecture/widgets/ui/custom_circular_progress_indicator.dart';
import 'package:clean_architecture/widgets/ui/text_form_fields/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalDataPage extends StatelessWidget {
  const PersonalDataPage({super.key});

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
        create: (_) => PersonalDataCubit(),
        child: BlocBuilder<PersonalDataCubit, PersonalDataState>(
            builder: (context, state) {
          final cubit = context.read<PersonalDataCubit>();
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: AppBarTitle(
                  title: context.translate('profilePage.changePersonalInfos')),
            ),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppDimensions.paddingM),
                  child: Column(
                    children: [
                      Expanded(
                        child: Form(
                          key: state.userFormKey,
                          child: ListView(
                            children: [
                              Text(
                                context.translate('profilePage.name'),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: AppDimensions.paddingS),
                              CustomTextField(
                                controller: state.name,
                                obscureText: false,
                                textCapitalization: TextCapitalization.words,
                                validator: (value) => value?.isEmpty ?? true ? context.translate('profilePage.nameIsRequired') : null,
                              ),
                              const SizedBox(height: AppDimensions.paddingM),
                              Text(
                                context.translate('profilePage.surname'),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: AppDimensions.paddingS),
                              CustomTextField(
                                controller: state.surname,
                                obscureText: false,
                                textCapitalization: TextCapitalization.words,
                                validator: (value) => value?.isEmpty ?? true ? context.translate('profilePage.surnameIsRequired') : null,
                              ),
                              const SizedBox(
                                height: AppDimensions.paddingM,
                              ),
                              Text(
                                context.translate('profilePage.email'),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: AppDimensions.paddingS,
                              ),
                              CustomTextField(
                                controller:state.email,
                                enabled: false,
                                readOnly: true,
                                suffixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                ),
                                onTap: () {
                                  _showSnackBar(
                                    context,
                                    context.translate('profilePage.atTheMomentYouCantChangeEmail'),
                                  );
                                },
                              ),
                              const SizedBox(
                                height: AppDimensions.paddingM,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: AppDimensions.paddingM  * 2,
                                ),
                                child: ElevatedButton(
                                  style: Theme.of(context)
                                      .elevatedButtonTheme
                                      .style!
                                      .copyWith(
                                        backgroundColor:
                                            const WidgetStatePropertyAll(
                                          AppColors.tertiary,
                                        ),
                                      ),
                                  onPressed: () async =>
                                      cubit.onSaveClick(context),
                                  child: Text(context.translate('generic.save')),
                                ),
                              ),
                              const SizedBox(
                                height: AppDimensions.paddingM,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (state.showPageLoader) const CustomCircularProgressIndicator(),
              ],
            ),
          );
        }));
  }
}
