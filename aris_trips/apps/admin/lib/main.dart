import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';
import 'core/config/env.dart';
import 'core/di/injection.dart';
import 'core/router/app_router.dart';
import 'features/auth/presentation/cubit/login_cubit.dart';
import 'features/auth/presentation/cubit/session_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final env = Env.fromEnvironment()..validate();

  await Supabase.initialize(
    url: env.supabaseUrl,
    publishableKey: env.supabaseAnonKey,
  );

  getIt.registerSingleton<Env>(env);
  configureDependencies();

  final session = getIt<SessionCubit>();
  unawaited(session.check());

  runApp(
    AdminApp(
      session: session,
      router: createRouter(
        session: session,
        loginCubitFactory: () => getIt<LoginCubit>(),
      ),
    ),
  );
}
