import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/error/failure_message.dart';
import '../../../../core/format/date_formats.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/widgets/state_views.dart';
import '../../../logistics/presentation/cubit/items_cubit.dart';
import '../../../logistics/presentation/pages/logistics_tabs.dart';
import '../../../passengers/domain/entities/booking.dart';
import '../../../passengers/presentation/cubit/bookings_cubit.dart';
import '../../../passengers/presentation/pages/passengers_tab.dart';
import '../../domain/entities/trip.dart';
import '../../domain/entities/trip_status.dart';
import '../cubit/trip_detail_cubit.dart';
import '../widgets/trip_cover.dart';
import '../widgets/trip_status_chip.dart';
import '../widgets/trip_status_ui.dart';

/// Trip detail with summary and logistics tabs. Expects a [TripDetailCubit]
/// and, for the tabs, [FlightsCubit], [LodgingsCubit], [ItineraryCubit] and
/// [BookingsCubit].
class TripDetailPage extends StatelessWidget {
  const TripDetailPage({super.key, required this.tripId});

  final String tripId;

  Future<void> _edit(BuildContext context) async {
    final cubit = context.read<TripDetailCubit>();
    final changed = await context.push<bool>(AppRoutes.tripEdit(tripId));
    if (changed ?? false) await cubit.load(tripId);
  }

  Future<void> _changeStatus(BuildContext context, TripStatus status) async {
    final cubit = context.read<TripDetailCubit>();
    if (status == TripStatus.archived) {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('¿Archivar este viaje?'),
          content: const Text(
            'Dejará de aparecer entre los viajes activos. '
            'Podrás pasarlo a borrador cuando quieras.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Archivar'),
            ),
          ],
        ),
      );
      if (!(confirmed ?? false)) return;
    }
    await cubit.changeStatus(status);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripDetailCubit, TripDetailState>(
      listenWhen: (previous, current) =>
          current is TripDetailLoaded &&
          current.actionFailure != null &&
          (previous is! TripDetailLoaded ||
              previous.actionFailure != current.actionFailure ||
              previous.busy),
      listener: (context, state) {
        if (state case TripDetailLoaded(:final actionFailure?)) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(actionFailure.message)));
        }
      },
      builder: (context, state) {
        final loaded = state is TripDetailLoaded ? state : null;
        return DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Detalle del viaje'),
              bottom: loaded == null
                  ? null
                  : const TabBar(
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      tabs: [
                        Tab(text: 'Resumen'),
                        Tab(text: 'Vuelos'),
                        Tab(text: 'Hospedaje'),
                        Tab(text: 'Itinerario'),
                        Tab(text: 'Pasajeros'),
                      ],
                    ),
              actions: [
                if (loaded != null) ...[
                  IconButton(
                    key: const Key('edit_trip'),
                    tooltip: 'Editar',
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: loaded.busy ? null : () => _edit(context),
                  ),
                  PopupMenuButton<TripStatus>(
                    key: const Key('trip_status_menu'),
                    tooltip: 'Cambiar estado',
                    enabled: !loaded.busy,
                    onSelected: (status) => _changeStatus(context, status),
                    itemBuilder: (_) => [
                      for (final status in TripStatus.values)
                        if (status != loaded.trip.status)
                          PopupMenuItem(
                            value: status,
                            child: ListTile(
                              leading: Icon(status.icon),
                              title: Text(status.actionLabel),
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                    ],
                  ),
                ],
              ],
            ),
            body: switch (state) {
              TripDetailLoading() => const LoadingView(),
              TripDetailFailure(:final failure) => ErrorView(
                message: failure.message,
                onRetry: () => context.read<TripDetailCubit>().load(tripId),
              ),
              TripDetailLoaded(:final trip, :final busy) => TabBarView(
                children: [
                  _TripDetailBody(trip: trip, busy: busy),
                  FlightsTab(tripId: tripId),
                  LodgingsTab(tripId: tripId),
                  // Rebuilt when bookings load so items can target a
                  // passenger.
                  BlocBuilder<BookingsCubit, ItemsState<Booking>>(
                    builder: (context, _) => ItineraryTab(
                      tripId: tripId,
                      audience: context.read<BookingsCubit>().audience,
                    ),
                  ),
                  PassengersTab(tripId: tripId),
                ],
              ),
            },
          ),
        );
      },
    );
  }
}

class _TripDetailBody extends StatelessWidget {
  const _TripDetailBody({required this.trip, required this.busy});

  final Trip trip;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final description = trip.description;

    return ListView(
      children: [
        Stack(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: TripCover(url: trip.coverUrl, iconSize: AppSpacing.xxl),
            ),
            Positioned(
              right: AppSpacing.md,
              bottom: AppSpacing.md,
              child: FilledButton.tonalIcon(
                key: const Key('change_cover'),
                onPressed: busy
                    ? null
                    : context.read<TripDetailCubit>().pickCover,
                icon: const Icon(Icons.photo_library_outlined),
                label: Text(
                  trip.coverUrl == null ? 'Agregar portada' : 'Cambiar portada',
                ),
              ),
            ),
          ],
        ),
        if (busy) const LinearProgressIndicator(),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      trip.name,
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  TripStatusChip(status: trip.status),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              _InfoRow(icon: Icons.place_outlined, text: trip.destination),
              const SizedBox(height: AppSpacing.sm),
              _InfoRow(
                icon: Icons.calendar_today_outlined,
                text: DateFormats.range(trip.startDate, trip.endDate),
              ),
              if (description != null) ...[
                const SizedBox(height: AppSpacing.lg),
                Text('Descripción', style: theme.textTheme.titleMedium),
                const SizedBox(height: AppSpacing.xs),
                Text(description, style: theme.textTheme.bodyLarge),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(
          icon,
          size: AppSpacing.md + AppSpacing.xs,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(child: Text(text, style: theme.textTheme.bodyLarge)),
      ],
    );
  }
}
