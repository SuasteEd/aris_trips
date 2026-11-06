import 'package:aris_admin/core/theme/app_theme.dart';
import 'package:aris_admin/core/widgets/state_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrap(Widget child) => MaterialApp(
  theme: AppTheme.light,
  home: Scaffold(body: child),
);

void main() {
  testWidgets('LoadingView shows a progress indicator and message', (
    tester,
  ) async {
    await tester.pumpWidget(
      _wrap(const LoadingView(message: 'Cargando viajes')),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Cargando viajes'), findsOneWidget);
  });

  testWidgets('EmptyView shows title, message and action', (tester) async {
    await tester.pumpWidget(
      _wrap(
        EmptyView(
          title: 'Sin viajes',
          message: 'Crea tu primer viaje.',
          action: FilledButton(
            onPressed: () {},
            child: const Text('Nuevo viaje'),
          ),
        ),
      ),
    );

    expect(find.text('Sin viajes'), findsOneWidget);
    expect(find.text('Crea tu primer viaje.'), findsOneWidget);
    expect(find.text('Nuevo viaje'), findsOneWidget);
  });

  testWidgets('ErrorView calls onRetry', (tester) async {
    var retries = 0;
    await tester.pumpWidget(
      _wrap(ErrorView(message: 'Sin conexión', onRetry: () => retries++)),
    );

    expect(find.text('Algo salió mal'), findsOneWidget);
    await tester.tap(find.text('Reintentar'));
    expect(retries, 1);
  });

  testWidgets('ErrorView hides retry without a callback', (tester) async {
    await tester.pumpWidget(_wrap(const ErrorView(message: 'Error')));

    expect(find.text('Reintentar'), findsNothing);
  });
}
