import 'package:clean_architecture/core/services/navigation/navigation.dart';
import 'package:clean_architecture/core/services/shared_preferences/shared_prefs_service.dart';
import 'package:clean_architecture/core/structures/enums.dart';
import 'package:clean_architecture/i18n/app_localizations.dart';
import 'package:clean_architecture/routing/app_router.dart';
import 'package:clean_architecture/routing/guards/route_guard.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

final di = GetIt.instance;

Future<void> setupDependencies() async {
  await _initServices();
  await _initProviders();
  await _initRepositories();
  await _initLocalization();
  await _initBusinessLogic();
  await _initConfig();
  await _initRouter();
}

Future<void> _initServices() async {
  di.registerSingleton<Logger>(Logger());

  // TODO: Implement permission service
  // di.registerLazySingleton<PermissionService>(() => PermissionService());

  di.registerLazySingletonAsync<SharedPreferencesService>(() async {
    final prefs = SharedPreferencesService();
    await prefs.init();
    return prefs;
  });

  di.registerLazySingleton<NavigationService>(() => NavigationService());
}

Future<void> _initProviders() async {
  // TODO: Implement API client and provider
  // String baseUrl = const String.fromEnvironment('API_URL');
  // String apiVersion = const String.fromEnvironment('API_VERSION');

  // final dio = DioClient.create('$baseUrl/$apiVersion');
  // di.registerLazySingleton<CustomHttpClient>(() => DioHttpClient(dio));
  // di.registerLazySingleton<ApiProvider>(() => ApiProvider(di<CustomHttpClient>()));
}

Future<void> _initRepositories() async {
  // TODO: Implement API repository
  // di.registerLazySingleton<ApiRepository>(
  //     () => ApiRepositoryImpl(di<ApiProvider>()));
}

Future<void> _initLocalization() async {
  // Register AppLocalizations
  di.registerLazySingleton<AppLocalizations>(() {
    // Get current locale from SharedPreferences or default to English
    final String langCode = di<SharedPreferencesService>().getValue<String>(
          PrefsKeys.locale,
        ) ??
        'en';

    final appLocalizations = AppLocalizations(Locale(langCode));
    // Load the translations
    appLocalizations.load();
    return appLocalizations;
  });
}

Future<void> _initBusinessLogic() async {
  // TODO: Implement business logic
  // di
  //   ..registerFactory(() => ThemeBloc(ThemeState(
  //       themeType: di<SharedPreferencesService>().getThemeData())))
  //   ..registerFactory(() => SplashBloc())
  //   ..registerFactory(() => LoginBloc(
  //         apiRepository: di<ApiRepository>(),
  //       ))
  //   ..registerFactory(() => ExampleBloc(
  //         apiRepository: di<ApiRepository>(),
  //       ));
}

Future<void> _initConfig() async {
  // TODO: Implement config (ex. Firebase, etc.)
}

Future<void> _initRouter() async {
  // Registra RouteGuard prima di usarlo
  di.registerLazySingleton<RouteGuard>(() => RouteGuard(
        di<SharedPreferencesService>(),
      ));

  final GoRouter goRouter = AppRouter.createRouter(
    routeGuard: di<RouteGuard>(),
  );
  di.registerLazySingleton<GoRouter>(() => goRouter);
  
  di.registerLazySingleton<AppRouter>(() => AppRouter(router: goRouter));
}
