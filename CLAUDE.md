# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
flutter pub get          # Install dependencies
flutter run              # Run the app
flutter analyze          # Lint (uses flutter_lints via analysis_options.yaml)
flutter test             # Run all tests
flutter test test/widget_test.dart  # Run a single test file
```

## Architecture

This is a **feature-first clean architecture** Flutter project. Each feature under `lib/features/<feature>/` is self-contained with three layers:

```
features/<feature>/
  data/
    models/          # JSON serialization; extend domain entities
    repositories/    # Concrete implementations of domain repository interfaces
  domain/
    entities/        # Pure Dart classes, no framework dependencies
    repositories/    # Abstract interfaces (contracts)
    usecases/        # One-action classes; call repository methods
  presentation/
    cubits/          # State management (flutter_bloc Cubits)
    pages/           # Full-screen widgets; one per route
    widgets/         # Page-specific UI components
```

Current features: `start`, `login`, `home_page`, `profile`, `logger`.

The **dependency rule** flows inward: `data` → `domain` ← `presentation`. Use cases are injected into Cubits; repository implementations are injected into use cases.

## State Management

Cubits from `flutter_bloc` manage all feature state. States use a plain class with a `copyWith` pattern (not `Equatable`). States may hold `TextEditingController` and `GlobalKey<FormState>` directly (see `LoginPageState`). Emit new state via `emit(state.copyWith(...))`.

Global Cubits are provided at the `MaterialApp` level in `main.dart` via `MultiBlocProvider`. Feature-scoped Cubits should be provided at the page level.

## Navigation

Routing uses `go_router` via `AppRouter` (`lib/routing/app_router.dart`). All route paths and names are defined in the `AppRoute` enum (`lib/routing/app_routes.dart`). Always use `AppRoute.<name>.path` and `AppRoute.<name>.name` — never hardcode path strings.

A `ShellRoute` wraps authenticated pages with `CustomScaffold` (shared app bar/scaffold). Unauthenticated pages (intro, onboarding, login) are top-level `GoRoute`s. The redirect logic in `AppRouter` currently stubs authentication as `const isAuthenticated = false` — this must be replaced with real auth state.

Many routes are commented out in `app_router.dart` (profile, settings, logger, etc.) — they exist in `AppRoute` but are not yet wired.

## Localization

Translation strings are JSON files in `assets/locales/` (`en.json`, `it.json`). Keys are defined as constants in `lib/i18n/lang_keys.dart` (marked auto-generated — regenerate by running `generate_lang_keys_file.py` when locale files change, though the script is currently a placeholder).

Access translations in widgets via the `ContextExtension`:
```dart
context.translate(LangKeys.someKey)
```

`AppLocalizationsSetup` in `lib/i18n/` wires the delegates for `MaterialApp`. Supported locales: `en`, `it`.

## HTTP & API

`ApiConsumer` (`lib/core/services/api/api_consumer.dart`) is the abstract HTTP interface. `DioConsumer` is the concrete Dio-based implementation. The base URL and endpoint segments live in `EndPoints` and `ApiKey` classes in `lib/core/services/api/end_points.dart`.

Dio exceptions are mapped to typed exception classes (e.g., `UnauthorizedException`, `NotFoundException`) via `handleDioException()` in `lib/core/errors/exceptions.dart`. Repository implementations should catch `ServerException` and convert to `Failure`.

## Core Utilities

- **`SharedPref`** (`lib/core/shared_preferences/shared_pref.dart`) — singleton wrapping `SharedPreferences`, initialized in `main()` before `runApp`.
- **`NetworkInfo`** — abstracts connectivity checks via `data_connection_checker_tv`.
- **`AppColors`**, **`AppDimensions`** — all design tokens; import via `package:clean_architecture/core/resources/res.dart` (barrel export).
- **`ContextExtension`** — adds `.translate()`, `.theme`, `.textTheme`, `.colorScheme`, `.router`, `.navigator` to `BuildContext`.
- **`Validators`** — form validators that require a `BuildContext` for localized error messages.
- **`responsive_layout_kit`** — adaptive scaling and device-type utilities. `AppScreenInit` (design size: 375×812) wraps the app root in `main.dart`. Use `ResponsiveBuilder` for per-device layouts, `.w`/`.h`/`.sp`/`.r` extensions for scaled sizes, `context.isPhone`/`context.isTablet`/`context.isDesktop` for device checks, and `context.adaptiveValue(mobile:, tablet:, desktop:)` for inline value switching. `ResponsiveSpacing` provides named spacing constants with `.allPadding`, `.verticalPadding`, `.horizontalPadding`, `.vGap`, `.hGap`, and `.radius` helpers. `lib/core/resources/utils/responsive_layout.dart` and `responsive_value.dart` re-export the package symbols.

## Theme

Two theme classes exist; `AppTheme` (`lib/core/theme/app_theme.dart`) is the one wired into `MaterialApp`. `MyAppTheme` (`lib/widgets/ui/base_theme.dart`) is a secondary definition using Material 3 and the Jost font — it is not yet wired to the app. The primary font family is **Jost** (all weights bundled in `assets/fonts/jost/`).

Firebase is initialized in `FirebaseConfig.initialize()` with platform-specific options for Android; iOS uses `GoogleService-Info.plist`.
