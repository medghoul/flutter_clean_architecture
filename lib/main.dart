import 'package:clean_architecture/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture/core/databases/cache/cache_helper.dart';
import 'package:clean_architecture/features/home_page/domain/usecases/home_page_usecase.dart';
import 'package:clean_architecture/features/home_page/presentation/cubits/home_page_cubit.dart';
import 'package:clean_architecture/features/user/presentation/cubit/user_cubit.dart';
import 'package:clean_architecture/routing/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(),
        ),
        BlocProvider(create: (context) => HomePageCubit({} as HomePageUseCase)),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter.router,
        localizationsDelegates: const [
          DefaultWidgetsLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale.fromSubtags(languageCode: 'it'), // generic italian
          Locale.fromSubtags(languageCode: 'en'), // generic english
        ],
        title: 'Ideal Architecture',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
      ),
    );
  }
}
