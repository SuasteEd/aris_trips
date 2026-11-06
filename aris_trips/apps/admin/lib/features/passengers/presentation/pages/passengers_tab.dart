import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/error/failure_message.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/widgets/state_views.dart';
import '../../domain/entities/booking.dart';
import '../cubit/bookings_cubit.dart';
import '../widgets/passenger_ui.dart';

/// Passengers (bookings) of a trip. Expects a loaded [BookingsCubit].
class PassengersTab extends StatefulWidget {
  const PassengersTab({super.key, required this.tripId});

  final String tripId;

  @override
  State<PassengersTab> createState() => _PassengersTabState();
}

class _PassengersTabState extends State<PassengersTab> {
  String _query = '';

  Future<void> _open(String location, {Object? extra}) async {
    final cubit = context.read<BookingsCubit>();
    await context.push<void>(location, extra: extra);
    if (mounted) await cubit.refresh();
  }

  Future<void> _add() => _open(
    AppRoutes.passengerNew(widget.tripId),
    extra: {
      for (final b in context.read<BookingsCubit>().bookings) b.passenger.id,
    },
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingsCubit, ItemsState<Booking>>(
      builder: (context, state) => switch (state) {
        ItemsLoading() => const LoadingView(),
        ItemsFailure(:final failure) => ErrorView(
          message: failure.message,
          onRetry: context.read<BookingsCubit>().refresh,
        ),
        ItemsLoaded(:final items) when items.isEmpty => EmptyView(
          icon: Icons.groups_outlined,
          title: 'Sin pasajeros',
          message: 'Agrégalos uno por uno o impórtalos desde un CSV.',
          action: Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            alignment: WrapAlignment.center,
            children: [
              FilledButton.icon(
                onPressed: _add,
                icon: const Icon(Icons.person_add_alt),
                label: const Text('Agregar pasajero'),
              ),
              OutlinedButton.icon(
                onPressed: () =>
                    _open(AppRoutes.passengersImport(widget.tripId)),
                icon: const Icon(Icons.upload_file),
                label: const Text('Importar CSV'),
              ),
            ],
          ),
        ),
        ItemsLoaded(:final items) => _BookingsList(
          bookings: [
            for (final booking in items)
              if (booking.matches(_query)) booking,
          ],
          total: items.length,
          onSearch: (text) => setState(() => _query = text),
          onAdd: _add,
          onImport: () => _open(AppRoutes.passengersImport(widget.tripId)),
          onAssign: () => _open(AppRoutes.passengersAssign(widget.tripId)),
          onOpen: (booking) =>
              _open(AppRoutes.booking(widget.tripId, booking.id)),
        ),
      },
    );
  }
}

class _BookingsList extends StatelessWidget {
  const _BookingsList({
    required this.bookings,
    required this.total,
    required this.onSearch,
    required this.onAdd,
    required this.onImport,
    required this.onAssign,
    required this.onOpen,
  });

  final List<Booking> bookings;
  final int total;
  final ValueChanged<String> onSearch;
  final VoidCallback onAdd;
  final VoidCallback onImport;
  final VoidCallback onAssign;
  final ValueChanged<Booking> onOpen;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RefreshIndicator(
      onRefresh: context.read<BookingsCubit>().refresh,
      child: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              OutlinedButton.icon(
                key: const Key('add_passenger'),
                onPressed: onAdd,
                icon: const Icon(Icons.person_add_alt),
                label: const Text('Agregar'),
              ),
              OutlinedButton.icon(
                key: const Key('import_passengers'),
                onPressed: onImport,
                icon: const Icon(Icons.upload_file),
                label: const Text('Importar CSV'),
              ),
              OutlinedButton.icon(
                key: const Key('bulk_assign'),
                onPressed: onAssign,
                icon: const Icon(Icons.playlist_add_check),
                label: const Text('Asignar en bloque'),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          TextField(
            key: const Key('passengers_search'),
            onChanged: onSearch,
            decoration: const InputDecoration(
              hintText: 'Buscar por nombre o correo',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            total == 1 ? '1 pasajero' : '$total pasajeros',
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          if (bookings.isEmpty)
            const Padding(
              padding: EdgeInsets.only(top: AppSpacing.xl),
              child: EmptyView(
                icon: Icons.search_off,
                title: 'Sin resultados',
                message: 'Prueba con otro nombre o correo.',
              ),
            ),
          for (final booking in bookings)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Card(
                child: ListTile(
                  onTap: () => onOpen(booking),
                  title: Text(booking.passenger.fullName),
                  subtitle: Text(assignmentSummary(booking)),
                  trailing: BookingStatusChip(status: booking.status),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
