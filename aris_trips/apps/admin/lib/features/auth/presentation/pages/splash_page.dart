import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure_message.dart';
import '../../../../core/widgets/state_views.dart';
import '../cubit/session_cubit.dart';

/// Shown while the stored session is verified, or when that check failed.
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SessionCubit, SessionState>(
        builder: (context, state) => switch (state) {
          SessionFailure(:final failure) => ErrorView(
            title: 'No pudimos verificar tu sesión',
            message: failure.message,
            onRetry: () => context.read<SessionCubit>().check(),
          ),
          _ => const LoadingView(),
        },
      ),
    );
  }
}
