import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/error/failure_message.dart';
import '../../../../core/theme/app_tokens.dart';
import '../cubit/add_passenger_cubit.dart';
import '../widgets/passenger_form.dart';

/// Expects a configured [AddPassengerCubit]. Pops when the passenger is
/// added.
class AddPassengerPage extends StatefulWidget {
  const AddPassengerPage({super.key});

  @override
  State<AddPassengerPage> createState() => _AddPassengerPageState();
}

class _AddPassengerPageState extends State<AddPassengerPage> {
  final _controllers = PassengerControllers();

  @override
  void dispose() {
    _controllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPassengerCubit, AddPassengerState>(
      listenWhen: (previous, current) => !previous.added && current.added,
      listener: (context, state) {
        final reused = (state.result?.reused ?? 0) > 0;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              reused
                  ? 'Ya existía con ese correo y nombre; se agregó al viaje.'
                  : 'Pasajero agregado al viaje.',
            ),
          ),
        );
        context.pop();
      },
      builder: (context, state) {
        final cubit = context.read<AddPassengerCubit>();
        final theme = Theme.of(context);
        final failure = state.failure;
        return Scaffold(
          appBar: AppBar(title: const Text('Agregar pasajero')),
          body: ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              Text(
                'Buscar un pasajero existente',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: AppSpacing.sm),
              TextField(
                key: const Key('existing_search'),
                enabled: !state.submitting,
                onChanged: cubit.search,
                decoration: InputDecoration(
                  hintText: 'Nombre, apellido o correo',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: state.searching
                      ? const Padding(
                          padding: EdgeInsets.all(
                            AppSpacing.sm + AppSpacing.xs,
                          ),
                          child: SizedBox.square(
                            dimension: AppSpacing.md,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        )
                      : null,
                ),
              ),
              if (state.searchFailure case final searchFailure?)
                Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.sm),
                  child: Text(
                    searchFailure.message,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.error,
                    ),
                  ),
                ),
              if (state.query.trim().length >= 2 &&
                  !state.searching &&
                  state.results.isEmpty &&
                  state.searchFailure == null)
                const Padding(
                  padding: EdgeInsets.only(top: AppSpacing.sm),
                  child: Text('No hay coincidencias. Créalo abajo.'),
                ),
              for (final passenger in state.results)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(passenger.fullName),
                  subtitle: Text(passenger.email ?? 'Sin correo'),
                  trailing: cubit.isOnTrip(passenger)
                      ? const Text('Ya está en el viaje')
                      : TextButton(
                          onPressed: state.submitting
                              ? null
                              : () => cubit.addExisting(passenger),
                          child: const Text('Agregar'),
                        ),
                ),
              const Divider(height: AppSpacing.xl),
              Text('O crear uno nuevo', style: theme.textTheme.titleMedium),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Si ya existe alguien con el mismo correo, nombre y apellido, '
                'se usa ese registro.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              PassengerFields(
                controllers: _controllers,
                issues: state.issues,
                enabled: !state.submitting,
              ),
              if (failure != null) ...[
                const SizedBox(height: AppSpacing.md),
                Text(
                  failure.message,
                  key: const Key('add_passenger_error'),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.error,
                  ),
                ),
              ],
              const SizedBox(height: AppSpacing.lg),
              FilledButton(
                key: const Key('create_passenger'),
                onPressed: state.submitting
                    ? null
                    : () => cubit.addNew(_controllers.draft),
                child: state.submitting
                    ? const SizedBox.square(
                        dimension: AppSpacing.lg,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Agregar al viaje'),
              ),
            ],
          ),
        );
      },
    );
  }
}
