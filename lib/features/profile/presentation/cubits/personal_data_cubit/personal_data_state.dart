import 'package:flutter/material.dart';

class PersonalDataState {
  final GlobalKey<FormState> userFormKey;
  final bool showPageLoader;
  final TextEditingController? name;
  final TextEditingController? surname;
  final TextEditingController? email;

  PersonalDataState({
    required this.userFormKey,
    this.showPageLoader = false,
    this.name,
    this.surname,
    this.email,
  });

  PersonalDataState copyWith({
    GlobalKey<FormState>? userFormKey,
    bool? showPageLoader,
    TextEditingController? name,
    TextEditingController? surname,
    TextEditingController? email,
  }) {
    return PersonalDataState(
      userFormKey: userFormKey ?? this.userFormKey,
      showPageLoader: showPageLoader ?? this.showPageLoader,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
    );
  }
}
