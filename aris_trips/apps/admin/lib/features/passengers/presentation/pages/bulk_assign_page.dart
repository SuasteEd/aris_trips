import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure_message.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/widgets/state_views.dart';
import '../../domain/usecases/assignment_usecases.dart';
import '../cubit/bulk_assign_cubit.dart';
import '../widgets/passenger_ui.dart';
import 'booking_page.dart';

/// Assigns one flight or lodging to many passengers. Expects a loading
/// [BulkAssignCubit].
class BulkAssignPage extends StatelessWidget {
  const BulkAssignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BulkAssignCubit, BulkAssignState>(
      listenWhen: (previous, current) =>
          current is BulkAssignReady &&
          ((current.added != null &&
                  (previous is! BulkAssignReady || previous.submitting)) ||
              (current.failure != null &&
                  previous is BulkAssignReady &&
                  previous.submitting)),
      listener: (context, state) {
        if (state is! BulkAssignReady) return;
        final added = state.added;
        final message = switch ((added, state.failure)) {
          (_, final failure?) => failure.message,
          (0, _) => 'Nadie nuevo que asignar.',
          (1, _) => 'Asignado a 1 pasajero.',
          (final count?, _) => 'Asignado a $count pasajeros.',
          _ => null,
        };
        if (message == null) return;
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(message)));
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: const Text('Asignar en bloque')),
        body: switch (state) {
          BulkAssignLoading() => const LoadingView(),
          BulkAssignFailure(:final failure) => ErrorView(
            message: failure.message,
          ),
          final BulkAssignReady ready => _BulkAssignBody(state: ready),
        },
      ),
    );
  }
}

class _BulkAssignBody extends StatelessWidget {
  const _BulkAssignBody({required this.state});

  final BulkAssignReady state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BulkAssignCubit>();
    final theme = Theme.of(context);
    final isFlight = state.target == BulkTarget.flight;
    final options = isFlight
        ? {for (final f in state.flights) f.id: flightLabel(f)}
        : {for (final l in state.lodgings) l.id: lodgingLabel(l)};
    final selectable = state.selectable;
    final allSelected =
        selectable.isNotEmpty &&
        selectable.every((b) => state.selected.contains(b.id));

    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              SegmentedButton<BulkTarget>(
                segments: const [
                  ButtonSegment(
                    value: BulkTarget.flight,
                    icon: Icon(Icons.flight_outlined),
                    label: Text('Vuelo'),
                  ),
                  ButtonSegment(
                    value: BulkTarget.lodging,
                    icon: Icon(Icons.hotel_outlined),
                    label: Text('Hospedaje'),
                  ),
                ],
                selected: {state.target},
                onSelectionChanged: state.submitting
                    ? null
                    : (value) => cubit.setTarget(value.first),
              ),
              const SizedBox(height: AppSpacing.md),
              if (options.isEmpty)
                Text(
                  isFlight
                      ? 'El viaje aún no tiene vuelos.'
                      : 'El viaje aún no tiene hospedaje.',
                  style: theme.textTheme.bodyMedium,
                )
              else
                DropdownButtonFormField<String>(
                  key: ValueKey('bulk_target_${state.target.name}'),
                  initialValue: state.targetId,
                  isExpanded: true,
                  decoration: InputDecoration(
                    labelText: isFlight ? 'Vuelo' : 'Hospedaje',
                  ),
                  items: [
                    for (final MapEntry(key: id, value: label)
                        in options.entries)
                      DropdownMenuItem(
                        value: id,
                        child: Text(label, overflow: TextOverflow.ellipsis),
                      ),
                  ],
                  onChanged: state.submitting
                      ? null
                      : (id) => id == null ? null : cubit.chooseTarget(id),
                ),
              if (state.targetId != null) ...[
                const SizedBox(height: AppSpacing.md),
                CheckboxListTile(
                  key: const Key('select_all'),
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Seleccionar todos'),
                  value: allSelected,
                  onChanged: selectable.isEmpty || state.submitting
                      ? null
                      : (value) => cubit.selectAll(value ?? false),
                ),
                const Divider(),
                for (final booking in state.bookings)
                  if (state.alreadyAssigned(booking))
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      value: true,
                      onChanged: null,
                      title: Text(booking.passenger.fullName),
                      subtitle: const Text('Ya asignado'),
                    )
                  else
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      value: state.selected.contains(booking.id),
                      onChanged: state.submitting
                          ? null
                          : (_) => cubit.toggle(booking.id),
                      title: Text(booking.passenger.fullName),
                      subtitle: Text(booking.status.label),
                    ),
              ],
            ],
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                key: const Key('bulk_submit'),
                onPressed: state.canSubmit ? cubit.submit : null,
                child: state.submitting
                    ? const SizedBox.square(
                        dimension: AppSpacing.lg,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(
                        state.selected.isEmpty
                            ? 'Asignar'
                            : 'Asignar a ${state.selected.length}',
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
