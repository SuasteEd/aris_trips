import 'package:aris_admin/core/format/date_formats.dart';
import 'package:aris_admin/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> initFormatting() => initializeDateFormatting(DateFormats.locale);

/// Pumps [page] at `/` inside a router so `context.push`/`pop` work.
/// Other locations render a stub with the path as text.
Future<GoRouter> pumpRouted(WidgetTester tester, Widget page) async {
  final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (_, _) => page),
      GoRoute(
        path: '/:rest(.*)',
        builder: (_, state) => Scaffold(body: Text('route:${state.uri}')),
      ),
    ],
  );
  await tester.pumpWidget(
    MaterialApp.router(
      theme: AppTheme.light,
      routerConfig: router,
      locale: const Locale('es', 'MX'),
      supportedLocales: const [Locale('es', 'MX')],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
    ),
  );
  await tester.pump();
  return router;
}
