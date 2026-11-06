import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import 'core/theme/app_theme.dart';

class AdminApp extends StatelessWidget {
  const AdminApp({super.key, required this.router});

  final GoRouter router;

  static const Locale locale = Locale('es', 'MX');

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Aris Admin',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: router,
      locale: locale,
      supportedLocales: const [locale],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
    );
  }
}
