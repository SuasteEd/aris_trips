import 'dart:async';

import 'package:aris_admin/app.dart';
import 'package:aris_admin/core/error/failure.dart';
import 'package:aris_admin/core/router/app_router.dart';
import 'package:aris_admin/features/auth/presentation/cubit/login_cubit.dart';
import 'package:aris_admin/features/auth/presentation/cubit/session_cubit.dart';
import 'package:aris_admin/features/trips/domain/entities/trips_query.dart';
import 'package:aris_admin/features/trips/presentation/cubit/trips_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/auth_fakes.dart';
import '../../helpers/pump_app.dart';
import '../../helpers/trips_fakes.dart';

void main() {
  setUpAll(initFormatting);

  group('sessionRedirect', () {
    const authenticated = SessionState.authenticated(testAdmin);

    test('unknown and failure go to splash', () {
      expect(
        sessionRedirect(const SessionState.unknown(), '/trips'),
        '/splash',
      );
      expect(
        sessionRedirect(
          const SessionState.failure(Failure.network()),
          '/login',
        ),
        '/splash',
      );
      expect(sessionRedirect(const SessionState.unknown(), '/splash'), isNull);
    });

    test('unauthenticated goes to login from anywhere', () {
      for (final location in ['/', '/trips', '/trips/abc/edit', '/splash']) {
        expect(
          sessionRedirect(const SessionState.unauthenticated(), location),
          '/login',
        );
      }
      expect(
        sessionRedirect(const SessionState.unauthenticated(), '/login'),
        isNull,
      );
    });

    test('authenticated lands on trips and keeps deep links', () {
      expect(sessionRedirect(authenticated, '/login'), '/trips');
      expect(sessionRedirect(authenticated, '/splash'), '/trips');
      expect(sessionRedirect(authenticated, '/'), '/trips');
      expect(sessionRedirect(authenticated, '/trips'), isNull);
      expect(sessionRedirect(authenticated, '/trips/abc'), isNull);
    });
  });

  group('router', () {
    late MockSessionCubit session;
    late StreamController<SessionState> states;
    late GetIt locator;

    setUp(() {
      session = MockSessionCubit();
      states = StreamController<SessionState>.broadcast();
      when(() => session.stream).thenAnswer((_) => states.stream);

      final login = MockLoginCubit();
      when(() => login.state).thenReturn(const LoginState.initial());
      final trips = MockTripsListCubit();
      when(() => trips.state).thenReturn(
        TripsListState.loaded(query: const TripsQuery(), trips: [testTrip]),
      );
      when(() => trips.load()).thenAnswer((_) async {});

      locator = GetIt.asNewInstance()
        ..registerFactory<LoginCubit>(() => login)
        ..registerFactory<TripsListCubit>(() => trips);
    });

    tearDown(() async {
      await states.close();
      await locator.reset();
    });

    void setState(SessionState state) {
      when(() => session.state).thenReturn(state);
      states.add(state);
    }

    Future<void> pumpApp(WidgetTester tester) async {
      await tester.pumpWidget(
        AdminApp(
          session: session,
          router: createRouter(session: session, locator: locator),
        ),
      );
      await tester.pump();
    }

    testWidgets('follows the session from splash to login to trips', (
      tester,
    ) async {
      when(() => session.state).thenReturn(const SessionState.unknown());
      await pumpApp(tester);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      setState(const SessionState.unauthenticated());
      await tester.pumpAndSettle();
      expect(find.text('Iniciar sesión'), findsOneWidget);

      setState(const SessionState.authenticated(testAdmin));
      await tester.pumpAndSettle();
      expect(find.text('Viajes'), findsOneWidget);
      expect(find.text('Cancún Primavera 2027'), findsOneWidget);
      final context = tester.element(find.text('Viajes'));
      expect(Localizations.localeOf(context).toString(), 'es_MX');
    });

    testWidgets('signing out from trips returns to login', (tester) async {
      when(() => session.signOut()).thenAnswer((_) async {
        setState(const SessionState.unauthenticated());
      });
      when(() => session.state)
          .thenReturn(const SessionState.authenticated(testAdmin));
      await pumpApp(tester);
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('sign_out')));
      await tester.pumpAndSettle();
      expect(find.text('Iniciar sesión'), findsOneWidget);
    });

    testWidgets('a failed session check offers a retry', (tester) async {
      when(() => session.check()).thenAnswer((_) async {});
      when(() => session.state)
          .thenReturn(const SessionState.failure(Failure.network()));
      await pumpApp(tester);
      await tester.pumpAndSettle();

      expect(find.text('No pudimos verificar tu sesión'), findsOneWidget);
      await tester.tap(find.text('Reintentar'));
      verify(() => session.check()).called(1);
    });
  });
}
