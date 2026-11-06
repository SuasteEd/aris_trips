import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';
import 'core/config/env.dart';
import 'core/di/injection.dart';
import 'core/router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final env = Env.fromEnvironment()..validate();

  await Supabase.initialize(
    url: env.supabaseUrl,
    publishableKey: env.supabaseAnonKey,
  );

  getIt.registerSingleton<Env>(env);
  configureDependencies();

  runApp(AdminApp(router: createRouter()));
}
