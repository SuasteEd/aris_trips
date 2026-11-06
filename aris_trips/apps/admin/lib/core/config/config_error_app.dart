import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/state_views.dart';

/// Shown instead of a blank screen when the app was built without env.json.
class ConfigErrorApp extends StatelessWidget {
  const ConfigErrorApp({super.key, required this.missing});

  final List<String> missing;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: Scaffold(
        body: ErrorView(
          title: 'Falta la configuración',
          message:
              'Variables vacías: ${missing.join(', ')}.\n'
              'Ejecuta la app con --dart-define-from-file=env.json.',
        ),
      ),
    );
  }
}
