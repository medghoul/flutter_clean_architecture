import 'package:clean_architecture/core/services/shared_preferences/shared_prefs_service.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:go_router/go_router.dart';

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
  di.registerSingleton<LocaleProvider>(LocaleProvider(di<SharedPreferencesService>()));

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
  // Locale Configuration
  final locale = await di<LocaleProvider>().getCurrentLocale();
  LocaleSettings.setLocale(locale.toAppLocale());
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
  di.registerLazySingleton<RouteGuard>(
    () => RouteGuard(di<SharedPreferencesService>())
  );
  
  di.registerLazySingleton<GoRouter>(
    () => RouterFactory(di<RouteGuard>()).create()
  );
}
