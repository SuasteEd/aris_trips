import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/cubit/login_cubit.dart';
import '../../features/auth/presentation/cubit/session_cubit.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../widgets/state_views.dart';
import 'placeholder_home_page.dart';
import 'stream_listenable.dart';

abstract final class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/';
}

typedef LoginCubitFactory = LoginCubit Function();

/// Where [location] must go for the current session, or null to stay.
String? sessionRedirect(SessionState state, String location) {
  final target = switch (state) {
    SessionUnknown() || SessionFailure() => AppRoutes.splash,
    SessionUnauthenticated() => AppRoutes.login,
    SessionAuthenticated() =>
      location == AppRoutes.login || location == AppRoutes.splash
          ? AppRoutes.home
          : null,
  };
  return target == location ? null : target;
}

GoRouter createRouter({
  required SessionCubit session,
  required LoginCubitFactory loginCubitFactory,
}) {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: StreamListenable(session.stream),
    redirect: (context, state) =>
        sessionRedirect(session.state, state.matchedLocation),
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => BlocProvider(
          create: (_) => loginCubitFactory(),
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const PlaceholderHomePage(),
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
