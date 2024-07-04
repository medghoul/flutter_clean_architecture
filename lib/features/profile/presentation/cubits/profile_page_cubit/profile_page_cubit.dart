import 'package:bloc/bloc.dart';
import 'package:clean_architecture/features/profile/presentation/cubits/profile_page_cubit/profile_page_state.dart';
import 'package:flutter/material.dart';

class ProfilePageCubit extends Cubit<ProfilePageState> {
  ProfilePageCubit()
      : super(ProfilePageState(
    scaffoldKey: GlobalKey<ScaffoldState>(),
  ));

  void setName(String name) {
    emit(state.copyWith(name: name));
  }

  void setSurname(String surname) {
    emit(state.copyWith(surname: surname));
  }

  void setEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void toggleLoader() {
    emit(state.copyWith(showPageLoader: !state.showPageLoader));
  }

  void resetFormFields() {
    emit(state.copyWith(name: '', surname: '', email: ''));
  }

  Future<void> logout(BuildContext context) async {
    // Perform logout logic
    emit(state.copyWith(showPageLoader: true));
    await Future.delayed(const Duration(seconds: 2)); // Simulate a network call
    emit(state.copyWith(showPageLoader: false));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Logged out successfully')),
    );
  }
}
