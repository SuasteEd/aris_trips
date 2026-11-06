import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/format/zoned_formats.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/time/time_zones.dart';
import '../../../../core/time/zoned_time.dart';
import '../../domain/entities/flight.dart';
import '../../domain/entities/flight_draft.dart';
import '../../domain/entities/itinerary_draft.dart';
import '../../domain/entities/itinerary_item.dart';
import '../../domain/entities/lodging.dart';
import '../../domain/entities/lodging_draft.dart';
import '../cubit/item_form_cubit.dart';
import '../cubit/items_cubit.dart';
import '../widgets/items_tab.dart';
import 'flight_form_page.dart';
import 'itinerary_form_page.dart';
import 'lodging_form_page.dart';

/// Opens a form for an item of [tripId] and refreshes [cubit] when saved.
Future<void> _openForm<C extends ItemFormCubit<Object?, Object?, Object?>>(
  BuildContext context, {
  required ItemsCubit<Object?> cubit,
  required String tripId,
  required String? itemId,
  required Widget page,
}) async {
  final saved = await Navigator.of(context).push<bool>(
    MaterialPageRoute(
      fullscreenDialog: true,
      builder: (_) => BlocProvider<C>(
        create: (_) => getIt<C>()..configure(tripId: tripId, itemId: itemId),
        child: page,
      ),
    ),
  );
  if (saved ?? false) await cubit.refresh();
}

/// Zone suggested for new lodging and itinerary items.
String _suggestedZone(BuildContext context) =>
    context.read<LodgingsCubit>().suggestedZone ?? TimeZones.defaultZone;

class FlightsTab extends StatelessWidget {
  const FlightsTab({super.key, required this.tripId});

  final String tripId;

  Future<void> _open(BuildContext context, [Flight? flight]) =>
      _openForm<FlightFormCubit>(
        context,
        cubit: context.read<FlightsCubit>(),
        tripId: tripId,
        itemId: flight?.id,
        page: FlightFormPage(original: flight, initial: const FlightDraft()),
      );

  @override
  Widget build(BuildContext context) {
    return ItemsTab<Flight, FlightsCubit>(
      addLabel: 'Agregar vuelo',
      emptyIcon: Icons.flight_outlined,
      emptyTitle: 'Sin vuelos',
      emptyMessage: 'Agrega los vuelos de ida y regreso del grupo.',
      deleteTitle: '¿Eliminar este vuelo?',
      deleteMessage: 'También se quitará de los pasajeros asignados.',
      onAdd: () => _open(context),
      itemsBuilder: (context, flights, onDelete) => [
        for (final flight in flights)
          _FlightCard(
            flight: flight,
            onEdit: () => _open(context, flight),
            onDelete: () => onDelete(flight),
          ),
      ],
    );
  }
}

class _FlightCard extends StatelessWidget {
  const _FlightCard({
    required this.flight,
    required this.onEdit,
    required this.onDelete,
  });

  final Flight flight;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final muted = theme.textTheme.bodyMedium?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );
    final terminal = flight.terminal;
    return _ItemCard(
      onEdit: onEdit,
      onDelete: onDelete,
      children: [
        Text(
          '${flight.origin} → ${flight.destination}',
          style: theme.textTheme.titleMedium,
        ),
        Text('${flight.flightNumber} · ${flight.airline}', style: muted),
        const SizedBox(height: AppSpacing.xs),
        Text(
          ZonedFormats.date(flight.departsAt, flight.departureTz),
          style: theme.textTheme.labelLarge,
        ),
        Text(
          '${ZonedFormats.timeWithOffset(flight.departsAt, flight.departureTz)}'
          ' → '
          '${ZonedFormats.timeWithOffset(flight.arrivesAt, flight.arrivalTz)}',
          style: theme.textTheme.bodyLarge,
        ),
        Text(
          [
            'Duración ${ZonedFormats.duration(flight.duration)}',
            if (terminal != null) 'Terminal $terminal',
          ].join(' · '),
          style: muted,
        ),
      ],
    );
  }
}

class LodgingsTab extends StatelessWidget {
  const LodgingsTab({super.key, required this.tripId});

  final String tripId;

  Future<void> _open(BuildContext context, [Lodging? lodging]) =>
      _openForm<LodgingFormCubit>(
        context,
        cubit: context.read<LodgingsCubit>(),
        tripId: tripId,
        itemId: lodging?.id,
        page: LodgingFormPage(
          original: lodging,
          initial: LodgingDraft(timezone: _suggestedZone(context)),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ItemsTab<Lodging, LodgingsCubit>(
      addLabel: 'Agregar hospedaje',
      emptyIcon: Icons.hotel_outlined,
      emptyTitle: 'Sin hospedaje',
      emptyMessage: 'Agrega el hotel o los hoteles del viaje.',
      deleteTitle: '¿Eliminar este hospedaje?',
      deleteMessage: 'También se quitará de los pasajeros asignados.',
      onAdd: () => _open(context),
      itemsBuilder: (context, lodgings, onDelete) => [
        for (final lodging in lodgings)
          _LodgingCard(
            lodging: lodging,
            onEdit: () => _open(context, lodging),
            onDelete: () => onDelete(lodging),
          ),
      ],
    );
  }
}

class _LodgingCard extends StatelessWidget {
  const _LodgingCard({
    required this.lodging,
    required this.onEdit,
    required this.onDelete,
  });

  final Lodging lodging;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final muted = theme.textTheme.bodyMedium?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );
    final address = lodging.address;
    final zone = lodging.timezone;
    return _ItemCard(
      onEdit: onEdit,
      onDelete: onDelete,
      children: [
        Text(lodging.name, style: theme.textTheme.titleMedium),
        if (address != null) Text(address, style: muted),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Check-in: ${ZonedFormats.dateTime(lodging.checkInAt, zone)}',
          style: theme.textTheme.bodyLarge,
        ),
        Text(
          'Check-out: ${ZonedFormats.dateTime(lodging.checkOutAt, zone)}',
          style: theme.textTheme.bodyLarge,
        ),
        Text(
          '${ZonedFormats.zoneName(zone)} · '
          '${ZonedTime.offsetLabel(lodging.checkInAt, zone)}',
          style: muted,
        ),
      ],
    );
  }
}

class ItineraryTab extends StatelessWidget {
  const ItineraryTab({super.key, required this.tripId});

  final String tripId;

  Future<void> _open(BuildContext context, [ItineraryItem? item]) =>
      _openForm<ItineraryFormCubit>(
        context,
        cubit: context.read<ItineraryCubit>(),
        tripId: tripId,
        itemId: item?.id,
        page: ItineraryFormPage(
          original: item,
          initial: ItineraryDraft(timezone: _suggestedZone(context)),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ItemsTab<ItineraryItem, ItineraryCubit>(
      addLabel: 'Agregar actividad',
      emptyIcon: Icons.event_note_outlined,
      emptyTitle: 'Sin actividades',
      emptyMessage: 'Agrega las actividades del grupo, día por día.',
      deleteTitle: '¿Eliminar esta actividad?',
      deleteMessage: 'Se quitará del itinerario del grupo.',
      onAdd: () => _open(context),
      itemsBuilder: (context, items, onDelete) {
        final theme = Theme.of(context);
        final widgets = <Widget>[];
        String? currentDay;
        for (final item in items) {
          // Group by the day at the place of the activity.
          final day = ZonedFormats.weekdayDate(item.startsAt, item.timezone);
          if (day != currentDay) {
            currentDay = day;
            widgets.add(
              Padding(
                padding: const EdgeInsets.only(
                  top: AppSpacing.md,
                  bottom: AppSpacing.xs,
                ),
                child: Text(day, style: theme.textTheme.titleMedium),
              ),
            );
          }
          widgets.add(
            _ItineraryCard(
              item: item,
              onEdit: () => _open(context, item),
              onDelete: () => onDelete(item),
            ),
          );
        }
        return widgets;
      },
    );
  }
}

class _ItineraryCard extends StatelessWidget {
  const _ItineraryCard({
    required this.item,
    required this.onEdit,
    required this.onDelete,
  });

  final ItineraryItem item;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final muted = theme.textTheme.bodyMedium?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );
    final zone = item.timezone;
    final ends = item.endsAt;
    final location = item.location;
    final description = item.description;
    final time = ends == null
        ? ZonedFormats.time(item.startsAt, zone)
        : '${ZonedFormats.time(item.startsAt, zone)}–'
              '${ZonedFormats.time(ends, zone)}';
    return _ItemCard(
      onEdit: onEdit,
      onDelete: onDelete,
      children: [
        Text(
          '$time ${ZonedTime.offsetLabel(item.startsAt, zone)}',
          style: theme.textTheme.labelLarge,
        ),
        Text(item.title, style: theme.textTheme.titleMedium),
        if (location != null) Text(location, style: muted),
        if (description != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(description, style: theme.textTheme.bodyMedium),
        ],
      ],
    );
  }
}

class _ItemCard extends StatelessWidget {
  const _ItemCard({
    required this.children,
    required this.onEdit,
    required this.onDelete,
  });

  final List<Widget> children;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.sm,
            0,
            AppSpacing.md,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.xs),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children,
                  ),
                ),
              ),
              ItemMenu(onEdit: onEdit, onDelete: onDelete),
            ],
          ),
        ),
      ),
    );
  }
}
