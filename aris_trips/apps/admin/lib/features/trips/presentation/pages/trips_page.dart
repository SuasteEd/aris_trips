import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/error/failure_message.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/widgets/state_views.dart';
import '../../../auth/presentation/cubit/session_cubit.dart';
import '../../domain/entities/trip.dart';
import '../../domain/entities/trip_status.dart';
import '../cubit/trips_list_cubit.dart';
import '../widgets/trip_card.dart';
import '../widgets/trip_status_ui.dart';

/// Trips list with status filter and search. Expects a [TripsListCubit].
class TripsPage extends StatefulWidget {
  const TripsPage({super.key});

  @override
  State<TripsPage> createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _open(String location) async {
    final cubit = context.read<TripsListCubit>();
    await context.push<void>(location);
    if (mounted) await cubit.load();
  }

  void _clearSearch() {
    _searchController.clear();
    context.read<TripsListCubit>().search('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Viajes'),
        actions: [
          IconButton(
            key: const Key('sign_out'),
            tooltip: 'Cerrar sesión',
            icon: const Icon(Icons.logout),
            onPressed: () => context.read<SessionCubit>().signOut(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        key: const Key('new_trip'),
        onPressed: () => _open(AppRoutes.tripNew),
        icon: const Icon(Icons.add),
        label: const Text('Nuevo viaje'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.sm,
              AppSpacing.md,
              0,
            ),
            child: ValueListenableBuilder(
              valueListenable: _searchController,
              builder: (context, value, _) => TextField(
                key: const Key('trips_search'),
                controller: _searchController,
                textInputAction: TextInputAction.search,
                onChanged: context.read<TripsListCubit>().search,
                decoration: InputDecoration(
                  hintText: 'Buscar por nombre o destino',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: value.text.isEmpty
                      ? null
                      : IconButton(
                          tooltip: 'Borrar búsqueda',
                          icon: const Icon(Icons.close),
                          onPressed: _clearSearch,
                        ),
                ),
              ),
            ),
          ),
          const _StatusFilter(),
          Expanded(
            child: BlocBuilder<TripsListCubit, TripsListState>(
              builder: (context, state) => switch (state) {
                TripsListLoading() => const LoadingView(),
                TripsListFailure(:final failure) => ErrorView(
                  message: failure.message,
                  onRetry: context.read<TripsListCubit>().load,
                ),
                TripsListEmpty() when state.isFiltered => const EmptyView(
                  icon: Icons.search_off,
                  title: 'Sin resultados',
                  message: 'Prueba con otro filtro o búsqueda.',
                ),
                TripsListEmpty() => EmptyView(
                  icon: Icons.flight_takeoff,
                  title: 'Aún no hay viajes',
                  message: 'Crea el primero para empezar.',
                  action: FilledButton.icon(
                    onPressed: () => _open(AppRoutes.tripNew),
                    icon: const Icon(Icons.add),
                    label: const Text('Nuevo viaje'),
                  ),
                ),
                TripsListLoaded(:final trips) => _TripsList(
                  trips: trips,
                  onOpen: (trip) => _open(AppRoutes.tripDetail(trip.id)),
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusFilter extends StatelessWidget {
  const _StatusFilter();

  @override
  Widget build(BuildContext context) {
    final selected = context.select(
      (TripsListCubit cubit) => cubit.state.query.status,
    );
    final options = <(TripStatus?, String)>[
      (null, 'Todos'),
      for (final status in TripStatus.values) (status, status.filterLabel),
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        children: [
          for (final (status, label) in options)
            Padding(
              padding: const EdgeInsets.only(right: AppSpacing.sm),
              child: ChoiceChip(
                key: Key('filter_${status?.value ?? 'all'}'),
                label: Text(label),
                selected: selected == status,
                onSelected: (_) =>
                    context.read<TripsListCubit>().setStatus(status),
              ),
            ),
        ],
      ),
    );
  }
}

class _TripsList extends StatelessWidget {
  const _TripsList({required this.trips, required this.onOpen});

  final List<Trip> trips;
  final ValueChanged<Trip> onOpen;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: context.read<TripsListCubit>().load,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          0,
          AppSpacing.md,
          // Room for the floating button.
          AppSpacing.xxl * 2,
        ),
        itemCount: trips.length,
        separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
        itemBuilder: (context, index) {
          final trip = trips[index];
          return TripCard(trip: trip, onTap: () => onOpen(trip));
        },
      ),
    );
  }
}
