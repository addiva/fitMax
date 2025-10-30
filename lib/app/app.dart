import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../l10n/app_localizations.dart';
import '../core/providers/notification_tap_provider.dart';
import 'router/app_router.dart';
import 'settings/app_settings_controller.dart';
import 'theme/app_theme.dart';

class FitmaxApp extends ConsumerWidget {
  const FitmaxApp({super.key});

  static const defaultAccent = Color(0xFF27AE60);

  static const supportedLocales = [
    Locale('en'),
    Locale('it'),
    Locale('de'),
    Locale('sq'),
    Locale('he'),
    Locale('ar'),
    Locale('fr'),
    Locale('es'),
    Locale('ru'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(appSettingsControllerProvider);
    ref.listen(notificationTapStreamProvider, (previous, next) {
      next.whenData((_) {
        final router = ref.read(goRouterProvider);
        router.goNamed(AppRoute.sessionStart.name);
      });
    });

    return settings.when(
      data: (state) => MaterialApp.router(
        title: 'FitMax',
        theme: AppTheme.light(state.accentColor),
        darkTheme: AppTheme.dark(state.accentColor),
        themeMode: state.themeMode,
        locale: state.locale,
        supportedLocales: supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        routerConfig: ref.watch(goRouterProvider),
      ),
      loading: () => MaterialApp(
        title: 'FitMax',
        theme: AppTheme.light(defaultAccent),
        darkTheme: AppTheme.dark(defaultAccent),
        supportedLocales: supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: const Scaffold(body: Center(child: CircularProgressIndicator())),
      ),
      error: (error, stackTrace) => MaterialApp(
        title: 'FitMax',
        theme: AppTheme.light(defaultAccent),
        darkTheme: AppTheme.dark(defaultAccent),
        supportedLocales: supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                'Errore durante il caricamento delle impostazioni.\n$error',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
