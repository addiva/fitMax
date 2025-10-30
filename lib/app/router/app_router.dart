import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/programs/programs_page.dart';
import '../../features/session/session_page.dart';
import '../../features/session/start_session_page.dart';
import '../../features/statistics/statistics_page.dart';
import '../../l10n/app_localizations.dart';

/// The routes in the application.
enum AppRoute {
  /// The programs route.
  programs('/programs'),

  /// The statistics route.
  statistics('/statistics'),

  /// The session route.
  session('/session'),

  /// The start session route.
  sessionStart('start');

  /// Creates a new app route.
  const AppRoute(this.path);

  /// The path of the route.
  final String path;
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey(
  debugLabel: 'root',
);

/// The provider for the GoRouter.
final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoute.programs.path,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            _AppShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRoute.programs.name,
                path: AppRoute.programs.path,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ProgramsPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRoute.statistics.name,
                path: AppRoute.statistics.path,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: StatisticsPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRoute.session.name,
                path: AppRoute.session.path,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: SessionPage()),
                routes: [
                  GoRoute(
                    name: AppRoute.sessionStart.name,
                    path: AppRoute.sessionStart.path,
                    builder: (context, state) => const StartSessionPage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
});

class _AppShell extends StatefulWidget {
  const _AppShell({required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<_AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<_AppShell> {
  int get _currentIndex => widget.navigationShell.currentIndex;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          widget.navigationShell.goBranch(
            index,
            initialLocation: index == _currentIndex,
          );
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.view_list_outlined),
            selectedIcon: Icon(Icons.view_list),
            label: l10n.tabPrograms,
          ),
          NavigationDestination(
            icon: Icon(Icons.auto_graph_outlined),
            selectedIcon: Icon(Icons.auto_graph),
            label: l10n.tabStatistics,
          ),
          NavigationDestination(
            icon: Icon(Icons.fitness_center_outlined),
            selectedIcon: Icon(Icons.fitness_center),
            label: l10n.tabSession,
          ),
        ],
      ),
    );
  }
}
