import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/state_views.dart';

abstract final class AppRoutes {
  static const String home = '/';
}

/// App routes. Session-based redirection arrives with authentication.
GoRouter createRouter() {
  return GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const _PlaceholderHomePage(),
      ),
    ],
    errorBuilder: (context, state) => const Scaffold(
      body: ErrorView(
        title: 'Página no encontrada',
        message: 'La ruta que buscas no existe.',
      ),
    ),
  );
}

class _PlaceholderHomePage extends StatelessWidget {
  const _PlaceholderHomePage();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: EmptyView(
        icon: Icons.flight_takeoff,
        title: 'Aris Admin',
        message: 'La base está lista.',
      ),
    );
  }
}
