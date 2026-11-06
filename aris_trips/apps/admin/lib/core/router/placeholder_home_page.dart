import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/cubit/session_cubit.dart';
import '../widgets/state_views.dart';

/// Temporary home until the trips list exists.
class PlaceholderHomePage extends StatelessWidget {
  const PlaceholderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final session = context.watch<SessionCubit>().state;
    final name = switch (session) {
      SessionAuthenticated(:final admin) => admin.fullName,
      _ => '',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aris Admin'),
        actions: [
          IconButton(
            key: const Key('sign_out'),
            tooltip: 'Cerrar sesión',
            icon: const Icon(Icons.logout),
            onPressed: () => context.read<SessionCubit>().signOut(),
          ),
        ],
      ),
      body: EmptyView(
        icon: Icons.flight_takeoff,
        title: name.isEmpty ? 'Bienvenido' : 'Hola, $name',
        message: 'Aquí aparecerán tus viajes.',
      ),
    );
  }
}
