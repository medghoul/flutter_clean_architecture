import 'package:bloc/bloc.dart';
import 'package:clean_architecture/features/profile/presentation/cubits/personal_data_cubit/personal_data_state.dart';
import 'package:flutter/material.dart';

class PersonalDataCubit extends Cubit<PersonalDataState> {
  PersonalDataCubit()
      : super(PersonalDataState(
    userFormKey: GlobalKey<FormState>(),
  ));

  void setName(TextEditingController name) {
    emit(state.copyWith(name: name));
  }

  void setSurname(TextEditingController surname) {
    emit(state.copyWith(surname: surname));
  }

  void setEmail(TextEditingController email) {
    emit(state.copyWith(email: email));
  }

  void toggleLoader() {
    emit(state.copyWith(showPageLoader: !state.showPageLoader));
  }

  void resetFormFields() {
    emit(state.copyWith(name: null, surname: null, email: null));
  }

  Future<void> onSaveClick(BuildContext context) async {
    if (state.userFormKey.currentState?.validate() ?? false) {
      toggleLoader();
      await Future.delayed(const Duration(seconds: 2));
      toggleLoader();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data saved successfully')),
      );
    }
  }
}
