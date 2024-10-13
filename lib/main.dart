import 'dart:io';

import 'package:clean_architecture/core/config/firebase_config.dart';
import 'package:clean_architecture/core/shared_preferences/shared_pref.dart';
import 'package:clean_architecture/core/theme/app_theme.dart';
import 'package:clean_architecture/i18n/app_localizations_setup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture/features/home_page/domain/usecases/home_page_usecase.dart';
import 'package:clean_architecture/features/home_page/presentation/cubits/home_page_cubit.dart';
import 'package:clean_architecture/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref().instantiatePreferences();

  await FirebaseConfig.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomePageCubit({} as HomePageUseCase)),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter.router,
        localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
        supportedLocales: AppLocalizationsSetup.supportedLocales,
        localeResolutionCallback:
            AppLocalizationsSetup.localeResolutionCallback,
        title: 'Ideal Architecture',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
      ),
    );
  }
}
