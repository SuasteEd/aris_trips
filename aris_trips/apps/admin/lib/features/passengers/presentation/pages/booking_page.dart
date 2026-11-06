import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/error/failure_message.dart';
import '../../../../core/format/zoned_formats.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/widgets/confirm_dialog.dart';
import '../../../../core/widgets/state_views.dart';
import '../../../logistics/domain/entities/flight.dart';
import '../../../logistics/domain/entities/lodging.dart';
import '../../domain/entities/booking.dart';
import '../cubit/booking_cubit.dart';
import '../widgets/booking_dialogs.dart';
import '../widgets/passenger_ui.dart';

String flightLabel(Flight flight) =>
    '${flight.origin} → ${flight.destination} · ${flight.flightNumber} · '
    '${ZonedFormats.dateTime(flight.departsAt, flight.departureTz)}';

String lodgingLabel(Lodging lodging) =>
    '${lodging.name} · ${ZonedFormats.date(lodging.checkInAt, lodging.timezone)}';

/// A passenger on a trip with their own assignments. Expects a loading
/// [BookingCubit]. Pops when the passenger is removed from the trip.
class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingCubit, BookingState>(
      listenWhen: (previous, current) =>
          current is BookingRemoved ||
          (current is BookingLoaded &&
              current.actionFailure != null &&
              (previous is! BookingLoaded || previous.busy)),
      listener: (context, state) {
        switch (state) {
          case BookingRemoved():
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Pasajero quitado del viaje.')),
            );
            context.pop();
          case BookingLoaded(:final actionFailure?):
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(actionFailure.message)));
          default:
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: const Text('Pasajero')),
        body: switch (state) {
          BookingLoading() || BookingRemoved() => const LoadingView(),
          BookingFailure(:final failure) => ErrorView(message: failure.message),
          BookingLoaded(:final details, :final busy) => _BookingBody(
            details: details,
            busy: busy,
          ),
        },
      ),
    );
  }
}

class _BookingBody extends StatelessWidget {
  const _BookingBody({required this.details, required this.busy});

  final BookingDetails details;
  final bool busy;

  Future<void> _editPassenger(BuildContext context) async {
    final cubit = context.read<BookingCubit>();
    final draft = await showPassengerDialog(
      context,
      details.booking.passenger.toDraft(),
    );
    if (draft != null) await cubit.updatePassenger(draft);
  }

  Future<void> _editBooking(BuildContext context) async {
    final cubit = context.read<BookingCubit>();
    final result = await showBookingDialog(context, details.booking);
    if (result != null) {
      await cubit.updateBooking(status: result.$1, notes: result.$2);
    }
  }

  Future<void> _flight(BuildContext context, [FlightAssignment? edit]) async {
    final cubit = context.read<BookingCubit>();
    final options = edit == null
        ? {for (final f in details.unassignedFlights) f.id: flightLabel(f)}
        : {
            edit.flightId: switch (details.flight(edit.flightId)) {
              final flight? => flightLabel(flight),
              null => 'Vuelo',
            },
          };
    final input = await showAssignmentDialog(
      context,
      title: edit == null ? 'Asignar vuelo' : 'Editar vuelo asignado',
      options: options,
      selected: edit?.flightId,
      firstLabel: 'Asiento (opcional)',
      secondLabel: 'Localizador (opcional)',
      initialFirst: edit?.seat ?? '',
      initialSecond: edit?.recordLocator ?? '',
    );
    if (input == null) return;
    await cubit.saveFlightAssignment(
      flightId: input.targetId,
      assignmentId: edit?.id,
      seat: input.first,
      recordLocator: input.second,
    );
  }

  Future<void> _lodging(BuildContext context, [LodgingAssignment? edit]) async {
    final cubit = context.read<BookingCubit>();
    final options = edit == null
        ? {for (final l in details.unassignedLodgings) l.id: lodgingLabel(l)}
        : {
            edit.lodgingId: switch (details.lodging(edit.lodgingId)) {
              final lodging? => lodgingLabel(lodging),
              null => 'Hospedaje',
            },
          };
    final input = await showAssignmentDialog(
      context,
      title: edit == null ? 'Asignar hospedaje' : 'Editar hospedaje asignado',
      options: options,
      selected: edit?.lodgingId,
      firstLabel: 'Habitación (opcional)',
      secondLabel: 'Número de confirmación (opcional)',
      initialFirst: edit?.room ?? '',
      initialSecond: edit?.confirmationNumber ?? '',
    );
    if (input == null) return;
    await cubit.saveLodgingAssignment(
      lodgingId: input.targetId,
      assignmentId: edit?.id,
      room: input.first,
      confirmationNumber: input.second,
    );
  }

  Future<void> _removeFromTrip(BuildContext context) async {
    final cubit = context.read<BookingCubit>();
    final confirmed = await confirmAction(
      context,
      title: '¿Quitar del viaje?',
      message:
          'Se borrarán su reservación, sus asignaciones y sus actividades '
          'propias. El pasajero seguirá disponible para otros viajes.',
      confirmLabel: 'Quitar',
    );
    if (confirmed) await cubit.removeFromTrip();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final booking = details.booking;
    final passenger = booking.passenger;
    final muted = theme.textTheme.bodyMedium?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );
    final cubit = context.read<BookingCubit>();

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        if (busy) const LinearProgressIndicator(),
        _Section(
          title: passenger.fullName,
          titleStyle: theme.textTheme.headlineSmall,
          action: IconButton(
            key: const Key('edit_passenger'),
            tooltip: 'Editar pasajero',
            icon: const Icon(Icons.edit_outlined),
            onPressed: busy ? null : () => _editPassenger(context),
          ),
          children: [
            Text(passenger.email ?? 'Sin correo', style: muted),
            Text(passenger.phone ?? 'Sin teléfono', style: muted),
          ],
        ),
        _Section(
          title: 'Reservación',
          action: IconButton(
            key: const Key('edit_booking'),
            tooltip: 'Editar estado y notas',
            icon: const Icon(Icons.edit_note),
            onPressed: busy ? null : () => _editBooking(context),
          ),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: BookingStatusChip(status: booking.status),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              booking.notes ?? 'Sin notas',
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
        _Section(
          title: 'Vuelos',
          action: TextButton.icon(
            key: const Key('assign_flight'),
            onPressed: busy || details.unassignedFlights.isEmpty
                ? null
                : () => _flight(context),
            icon: const Icon(Icons.add),
            label: const Text('Asignar'),
          ),
          children: [
            if (details.flights.isEmpty)
              Text('El viaje aún no tiene vuelos.', style: muted)
            else if (booking.flightAssignments.isEmpty)
              Text('Sin vuelos asignados.', style: muted),
            for (final assignment in booking.flightAssignments)
              _AssignmentTile(
                title: switch (details.flight(assignment.flightId)) {
                  final flight? => flightLabel(flight),
                  null => 'Vuelo',
                },
                details: [
                  if (assignment.seat case final seat?) 'Asiento $seat',
                  if (assignment.recordLocator case final locator?)
                    'Localizador $locator',
                ],
                enabled: !busy,
                onEdit: () => _flight(context, assignment),
                onRemove: () => cubit.removeFlightAssignment(assignment),
              ),
          ],
        ),
        _Section(
          title: 'Hospedaje',
          action: TextButton.icon(
            key: const Key('assign_lodging'),
            onPressed: busy || details.unassignedLodgings.isEmpty
                ? null
                : () => _lodging(context),
            icon: const Icon(Icons.add),
            label: const Text('Asignar'),
          ),
          children: [
            if (details.lodgings.isEmpty)
              Text('El viaje aún no tiene hospedaje.', style: muted)
            else if (booking.lodgingAssignments.isEmpty)
              Text('Sin hospedaje asignado.', style: muted),
            for (final assignment in booking.lodgingAssignments)
              _AssignmentTile(
                title: switch (details.lodging(assignment.lodgingId)) {
                  final lodging? => lodgingLabel(lodging),
                  null => 'Hospedaje',
                },
                details: [
                  if (assignment.room case final room?) 'Habitación $room',
                  if (assignment.confirmationNumber case final number?)
                    'Confirmación $number',
                ],
                enabled: !busy,
                onEdit: () => _lodging(context, assignment),
                onRemove: () => cubit.removeLodgingAssignment(assignment),
              ),
          ],
        ),
        _Section(
          title: 'Actividades propias',
          children: [
            if (details.activities.isEmpty)
              Text(
                'Sin actividades propias. Agrégalas en la pestaña Itinerario '
                'eligiendo a este pasajero.',
                style: muted,
              ),
            for (final item in details.activities)
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(item.title),
                subtitle: Text(
                  ZonedFormats.dateTime(item.startsAt, item.timezone),
                ),
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        OutlinedButton.icon(
          key: const Key('remove_from_trip'),
          style: OutlinedButton.styleFrom(
            foregroundColor: theme.colorScheme.error,
          ),
          onPressed: busy ? null : () => _removeFromTrip(context),
          icon: const Icon(Icons.person_remove_outlined),
          label: const Text('Quitar del viaje'),
        ),
      ],
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({
    required this.title,
    required this.children,
    this.action,
    this.titleStyle,
  });

  final String title;
  final List<Widget> children;
  final Widget? action;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: titleStyle ?? Theme.of(context).textTheme.titleMedium,
                ),
              ),
              ?action,
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          ...children,
        ],
      ),
    );
  }
}

class _AssignmentTile extends StatelessWidget {
  const _AssignmentTile({
    required this.title,
    required this.details,
    required this.enabled,
    required this.onEdit,
    required this.onRemove,
  });

  final String title;
  final List<String> details;
  final bool enabled;
  final VoidCallback onEdit;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(details.isEmpty ? 'Sin detalles' : details.join(' · ')),
        trailing: PopupMenuButton<bool>(
          tooltip: 'Opciones',
          enabled: enabled,
          onSelected: (edit) => edit ? onEdit() : onRemove(),
          itemBuilder: (_) => const [
            PopupMenuItem(value: true, child: Text('Editar')),
            PopupMenuItem(value: false, child: Text('Quitar')),
          ],
        ),
      ),
    );
  }
}
