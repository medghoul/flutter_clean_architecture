import 'package:flutter/material.dart';

class ProfilePageState {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool showPageLoader;
  final String name;
  final String surname;
  final String email;

  ProfilePageState({
    required this.scaffoldKey,
    this.showPageLoader = false,
    this.name = '',
    this.surname = '',
    this.email = '',
  });

  ProfilePageState copyWith({
    GlobalKey<ScaffoldState>? scaffoldKey,
    bool? showPageLoader,
    String? name,
    String? surname,
    String? email,
  }) {
    return ProfilePageState(
      scaffoldKey: scaffoldKey ?? this.scaffoldKey,
      showPageLoader: showPageLoader ?? this.showPageLoader,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
    );
  }
}
