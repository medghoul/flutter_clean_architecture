import 'dart:io';
import 'package:clean_architecture/core/app/bloc_observer.dart';
import 'package:clean_architecture/core/config/firebase_config.dart';
import 'package:clean_architecture/core/dependency_injection/dependency_injection.dart';
import 'package:clean_architecture/core/responsive/index.dart';
import 'package:clean_architecture/core/services/logger/logging.dart';
import 'package:clean_architecture/core/theme/app_theme.dart';
import 'package:clean_architecture/routing/app_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Preserve splash screen only for mobile platforms
  if (!kIsWeb) {
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  }

  // Set up bloc observer
  Bloc.observer = AppBlocObserver();

  // Initialize Firebase
  await FirebaseConfig.initialize();

  // Set up dependencies
  await setupDependencies();

  // Remove the splash screen only for mobile platforms
  if (!kIsWeb) {
    FlutterNativeSplash.remove();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    logger.i('App started');

    return AppScreenInit(
      designSize: const Size(375, 812), // Base design size (iPhone X)
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Flutter Clean Architecture APP',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          routerConfig: di<AppRouter>().router,
        );
      },
    );
  }
}
