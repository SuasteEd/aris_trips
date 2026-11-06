import 'package:aris_admin/core/error/failure.dart';
import 'package:aris_admin/core/theme/app_theme.dart';
import 'package:aris_admin/features/auth/presentation/cubit/login_cubit.dart';
import 'package:aris_admin/features/auth/presentation/cubit/session_cubit.dart';
import 'package:aris_admin/features/auth/presentation/pages/login_page.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/auth_fakes.dart';

void main() {
  late MockLoginCubit login;
  late MockSessionCubit session;

  setUp(() {
    login = MockLoginCubit();
    session = MockSessionCubit();
    when(() => login.state).thenReturn(const LoginState.initial());
    when(() => session.state).thenReturn(const SessionState.unauthenticated());
    when(
      () => login.submit(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async {});
  });

  Future<void> pump(WidgetTester tester) => tester.pumpWidget(
    MaterialApp(
      theme: AppTheme.light,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<LoginCubit>.value(value: login),
          BlocProvider<SessionCubit>.value(value: session),
        ],
        child: const LoginPage(),
      ),
    ),
  );

  testWidgets('validates fields before submitting', (tester) async {
    await pump(tester);

    await tester.tap(find.byKey(const Key('login_submit')));
    await tester.pump();

    expect(find.text('Escribe tu correo.'), findsOneWidget);
    expect(find.text('Escribe tu contraseña.'), findsOneWidget);
    verifyNever(
      () => login.submit(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    );
  });

  testWidgets('submits email and password', (tester) async {
    await pump(tester);

    await tester.enterText(
      find.byKey(const Key('login_email')),
      'ana@aristrips.dev',
    );
    await tester.enterText(find.byKey(const Key('login_password')), 'secreto');
    await tester.tap(find.byKey(const Key('login_submit')));
    await tester.pump();

    verify(() => login.submit(email: 'ana@aristrips.dev', password: 'secreto'))
        .called(1);
  });

  testWidgets('shows the failure message', (tester) async {
    when(() => login.state)
        .thenReturn(const LoginState.failure(Failure.notAdmin()));
    await pump(tester);

    expect(
      find.text('Esta cuenta no tiene acceso de administrador.'),
      findsOneWidget,
    );
  });

  testWidgets('disables the button while submitting', (tester) async {
    when(() => login.state).thenReturn(const LoginState.submitting());
    await pump(tester);

    final button = tester.widget<FilledButton>(
      find.byKey(const Key('login_submit')),
    );
    expect(button.onPressed, isNull);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('hands the admin to the session on success', (tester) async {
    whenListen(
      login,
      Stream.value(const LoginState.success(testAdmin)),
      initialState: const LoginState.initial(),
    );
    await pump(tester);
    await tester.pump();

    verify(() => session.signedIn(testAdmin)).called(1);
  });
}
