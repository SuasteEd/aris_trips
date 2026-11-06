import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/cubit/login_cubit.dart';
import '../../features/auth/presentation/cubit/session_cubit.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/trips/presentation/cubit/trip_detail_cubit.dart';
import '../../features/trips/presentation/cubit/trip_form_cubit.dart';
import '../../features/trips/presentation/cubit/trips_list_cubit.dart';
import '../../features/trips/presentation/pages/trip_detail_page.dart';
import '../../features/trips/presentation/pages/trip_form_page.dart';
import '../../features/trips/presentation/pages/trips_page.dart';
import '../di/injection.dart';
import '../widgets/state_views.dart';
import 'app_routes.dart';
import 'stream_listenable.dart';

export 'app_routes.dart';

/// Where [location] must go for the current session, or null to stay.
String? sessionRedirect(SessionState state, String location) {
  final target = switch (state) {
    SessionUnknown() || SessionFailure() => AppRoutes.splash,
    SessionUnauthenticated() => AppRoutes.login,
    SessionAuthenticated() =>
      location == AppRoutes.login ||
              location == AppRoutes.splash ||
              location == '/'
          ? AppRoutes.home
          : null,
  };
  return target == location ? null : target;
}

/// [locator] provides the page cubits; tests pass their own instance.
GoRouter createRouter({required SessionCubit session, GetIt? locator}) {
  final get = locator ?? getIt;

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
          create: (_) => get<LoginCubit>(),
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.trips,
        builder: (context, state) => BlocProvider(
          create: (_) => get<TripsListCubit>()..load(),
          child: const TripsPage(),
        ),
        routes: [
          // Declared before ':id' so "new" is not taken as an id.
          GoRoute(
            path: 'new',
            builder: (context, state) => BlocProvider(
              create: (_) => get<TripFormCubit>()..start(),
              child: const TripFormPage(),
            ),
          ),
          GoRoute(
            path: ':id',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return BlocProvider(
                create: (_) => get<TripDetailCubit>()..load(id),
                child: TripDetailPage(tripId: id),
              );
            },
            routes: [
              GoRoute(
                path: 'edit',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return BlocProvider(
                    create: (_) => get<TripFormCubit>()..start(tripId: id),
                    child: TripFormPage(tripId: id),
                  );
                },
              ),
            ],
          ),
        ],
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
