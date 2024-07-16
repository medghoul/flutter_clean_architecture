import 'package:clean_architecture/features/login/presentation/pages/login_page.dart';
import 'package:clean_architecture/features/start/presentation/pages/access_page.dart';
import 'package:clean_architecture/features/start/presentation/pages/onboarding_page.dart';
import 'package:clean_architecture/widgets/layout/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:clean_architecture/features/home_page/presentation/pages/home_page.dart';
import 'package:clean_architecture/features/start/presentation/pages/start_page.dart';
import 'package:clean_architecture/routing/app_routes.dart';
import 'package:clean_architecture/routing/ui/not_found_screen.dart';

class AppRouter {
  final GoRouter router;

  AppRouter() : router = _createRouter();

  static GoRouter _createRouter() {
    final GlobalKey<NavigatorState> rootNavigatorKey =
        GlobalKey<NavigatorState>(debugLabel: 'root');
    final GlobalKey<NavigatorState> shellNavigatorKey =
        GlobalKey<NavigatorState>(debugLabel: 'shell');

    return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: AppRoute.home.path,
      debugLogDiagnostics: true,
      routes: <RouteBase>[
        GoRoute(
          path: AppRoute.intro.path,
          name: AppRoute.intro.name,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const MaterialPage(
              key: ValueKey('StartPage'),
              child: StartPage(),
            );
          },
          routes: [
            GoRoute(
              path: AppRoute.onboarding.path,
              name: AppRoute.onboarding.name,
              pageBuilder: (BuildContext context, GoRouterState state) {
                return const MaterialPage(
                  key: ValueKey('OnboardingPage'),
                  child: OnboardingPage(),
                );
              },
            ),
            GoRoute(
              path: AppRoute.access.path,
              name: AppRoute.access.name,
              pageBuilder: (BuildContext context, GoRouterState state) {
                return const MaterialPage(
                  key: ValueKey('AccessPage'),
                  child: AccessPage(),
                );
              },
              routes: <RouteBase>[
                GoRoute(
                  path: AppRoute.signIn.path,
                  name: AppRoute.signIn.name,
                  pageBuilder: (BuildContext context, GoRouterState state) {
                    return const MaterialPage(
                      key: ValueKey('LoginPage'),
                      child: LoginPage(),
                    );
                  },
                ),
               /* GoRoute(
                  path: AppRoute.signUp.path,
                  name: AppRoute.signUp.name,
                  pageBuilder: (BuildContext context, GoRouterState state) {
                    return MaterialPage(
                      key: const ValueKey('SignupPage'),
                      child: SignupPageNavigator(
                        onMainPop: () {},
                      ),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: AppRoute.signUpConfirmation.path,
                      name: AppRoute.signUpConfirmation.name,
                      pageBuilder: (BuildContext context, GoRouterState state) {
                        return const MaterialPage(
                          key: ValueKey('SignupConfirmPage'),
                          child: SignupConfirmPage(),
                        );
                      },
                    ),
                  ],
                ),
                GoRoute(
                  path: AppRoute.forgotPassword.path,
                  name: AppRoute.forgotPassword.name,
                  pageBuilder: (BuildContext context, GoRouterState state) {
                    return const MaterialPage(
                      key: ValueKey('SignupPage'),
                      child: SignupPage(),
                    );
                  },
                ),*/
              ],
            ),
          ],
        ),
        ShellRoute(
          navigatorKey: shellNavigatorKey,
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return CustomScaffold(
              body: child,
              //TODO to create a custom app bar
              appBarBody: Container(),
            );
          },
          routes: <RouteBase>[
            GoRoute(
              path: AppRoute.home.path,
              name: AppRoute.home.name,
              builder: (BuildContext context, GoRouterState state) {
                return const HomePage();
              },
              /*routes: <RouteBase>[
                GoRoute(
                  path: AppRoute.cardDetail.path,
                  name: AppRoute.cardDetail.name,
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    if (state.extra != null && state.extra is CardResponseModel) {
                      return CardDetailPage(
                        card: state.extra! as CardResponseModel,
                      );
                    } else {
                      return NotFoundScreen(
                        uri: state.extra as String? ?? '',
                      );
                    }
                  },
                ),
              ],*/
            ),
            /*GoRoute(
              path: AppRoute.profile.path,
              name: AppRoute.profile.name,
              builder: (BuildContext context, GoRouterState state) {
                return const ProfilePage();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: AppRoute.editProfile.path,
                  name: AppRoute.editProfile.name,
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return const PersonalDataPage();
                  },
                ),
                GoRoute(
                  path: AppRoute.changePassword.path,
                  name: AppRoute.changePassword.name,
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return const ChangePwdPage();
                  },
                ),
                GoRoute(
                  path: AppRoute.settings.path,
                  name: AppRoute.settings.name,
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return const SettingsPage();
                  },
                ),
                GoRoute(
                  path: AppRoute.support.path,
                  name: AppRoute.support.name,
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return const SupportPage();
                  },
                ),
                GoRoute(
                  path: AppRoute.supportSuccess.path,
                  name: AppRoute.supportSuccess.name,
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return const SupportSuccessPage();
                  },
                ),
              ],
            ),*/
          ],
        ),
        GoRoute(
          path: AppRoute.notFoundScreen.path,
          name: AppRoute.notFoundScreen.name,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage(
              key: state.pageKey,
              child: NotFoundScreen(uri: state.extra as String? ?? ''),
            );
          },
        ),
        /*   GoRoute(
          path: AppRoute.logger.path,
          name: AppRoute.logger.name,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const MaterialPage(
              key: ValueKey('LoggerPage'),
              child: LoggerPage(),
            );
          },
        ),
        GoRoute(
          path: AppRoute.bluetooth.path,
          name: AppRoute.bluetooth.name,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const MaterialPage(
              key: ValueKey('BluetoothPage'),
              child: BluetoothPage(),
            );
          },
        ),*/
      ],
      // observers: [GoRouterObserver(analytics: FirebaseAnalytics.instance)],
      redirect: (context, state) {
        const isAuthenticated = false; // Implement your authentication logic
        final isOnAccess = state.uri.toString().startsWith(AppRoute.intro.path);
        if (isAuthenticated && isOnAccess) {
          if (state.uri.toString().contains(AppRoute.signUpConfirmation.name)) {
            return null;
          }
          return AppRoute.home.path;
        }
        if (!isAuthenticated && !isOnAccess) {
          return AppRoute.intro.path;
        }
        return null;
      },
    );
  }
}
