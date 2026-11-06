import 'package:aris_admin/app.dart';
import 'package:aris_admin/core/router/app_router.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('starts on the home route in es-MX', (tester) async {
    await tester.pumpWidget(AdminApp(router: createRouter()));
    await tester.pumpAndSettle();

    expect(find.text('Aris Admin'), findsOneWidget);
    final context = tester.element(find.text('Aris Admin'));
    expect(Localizations.localeOf(context).toString(), 'es_MX');
  });

  testWidgets('unknown routes show the not-found view', (tester) async {
    final router = createRouter();
    await tester.pumpWidget(AdminApp(router: router));
    router.go('/no-existe');
    await tester.pumpAndSettle();

    expect(find.text('Página no encontrada'), findsOneWidget);
  });
}
