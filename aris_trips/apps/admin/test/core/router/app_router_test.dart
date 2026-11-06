import 'dart:async';

import 'package:aris_admin/app.dart';
import 'package:aris_admin/core/router/app_router.dart';
import 'package:aris_admin/core/error/failure.dart';
import 'package:aris_admin/features/auth/presentation/cubit/login_cubit.dart';
import 'package:aris_admin/features/auth/presentation/cubit/session_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/auth_fakes.dart';

void main() {
  group('sessionRedirect', () {
    const authenticated = SessionState.authenticated(testAdmin);

    test('unknown and failure go to splash', () {
      expect(sessionRedirect(const SessionState.unknown(), '/'), '/splash');
      expect(
        sessionRedirect(
          const SessionState.failure(Failure.network()),
          '/login',
        ),
        '/splash',
      );
      expect(sessionRedirect(const SessionState.unknown(), '/splash'), isNull);
    });

    test('unauthenticated goes to login', () {
      expect(
        sessionRedirect(const SessionState.unauthenticated(), '/'),
        '/login',
      );
      expect(
        sessionRedirect(const SessionState.unauthenticated(), '/splash'),
        '/login',
      );
      expect(
        sessionRedirect(const SessionState.unauthenticated(), '/login'),
        isNull,
      );
    });

    test('authenticated leaves login and splash for home', () {
      expect(sessionRedirect(authenticated, '/login'), '/');
      expect(sessionRedirect(authenticated, '/splash'), '/');
      expect(sessionRedirect(authenticated, '/'), isNull);
    });
  });

  group('router', () {
    late MockSessionCubit session;
    late StreamController<SessionState> states;

    setUp(() {
      session = MockSessionCubit();
      states = StreamController<SessionState>.broadcast();
      when(() => session.stream).thenAnswer((_) => states.stream);
      when(() => session.signOut()).thenAnswer((_) async {});
    });

    tearDown(() => states.close());

    void setState(SessionState state) {
      when(() => session.state).thenReturn(state);
      states.add(state);
    }

    Future<void> pumpApp(WidgetTester tester) async {
      final login = MockLoginCubit();
      when(() => login.state).thenReturn(const LoginState.initial());
      await tester.pumpWidget(
        AdminApp(
          session: session,
          router: createRouter(
            session: session,
            loginCubitFactory: () => login,
          ),
        ),
      );
      await tester.pump();
    }

    testWidgets('follows the session from splash to login to home', (
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
      expect(find.text('Hola, Ana Admin'), findsOneWidget);
      final context = tester.element(find.text('Hola, Ana Admin'));
      expect(Localizations.localeOf(context).toString(), 'es_MX');
    });

    testWidgets('sign out button asks the session to sign out', (tester) async {
      when(() => session.state)
          .thenReturn(const SessionState.authenticated(testAdmin));
      await pumpApp(tester);
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('sign_out')));
      verify(() => session.signOut()).called(1);
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
