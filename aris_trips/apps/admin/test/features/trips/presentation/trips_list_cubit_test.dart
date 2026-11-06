import 'dart:async';

import 'package:aris_admin/core/error/failure.dart';
import 'package:aris_admin/features/trips/domain/entities/trip.dart';
import 'package:aris_admin/features/trips/domain/entities/trip_status.dart';
import 'package:aris_admin/features/trips/domain/entities/trips_query.dart';
import 'package:aris_admin/features/trips/presentation/cubit/trips_list_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/trips_fakes.dart';

void main() {
  late MockGetTrips getTrips;

  setUpAll(registerTripsFallbacks);
  setUp(() => getTrips = MockGetTrips());

  void stub(Either<Failure, List<Trip>> result) =>
      when(() => getTrips(any())).thenReturn(TaskEither.fromEither(result));

  const all = TripsQuery();

  blocTest<TripsListCubit, TripsListState>(
    'load emits the trips',
    setUp: () => stub(right([testTrip, otherTrip])),
    build: () => TripsListCubit(getTrips),
    act: (cubit) => cubit.load(),
    expect: () => [
      const TripsListState.loading(query: all),
      TripsListState.loaded(query: all, trips: [testTrip, otherTrip]),
    ],
  );

  blocTest<TripsListCubit, TripsListState>(
    'load without trips is empty and not filtered',
    setUp: () => stub(right(const [])),
    build: () => TripsListCubit(getTrips),
    act: (cubit) => cubit.load(),
    expect: () => [
      const TripsListState.loading(query: all),
      const TripsListState.empty(query: all),
    ],
    verify: (cubit) => expect(cubit.state.isFiltered, isFalse),
  );

  blocTest<TripsListCubit, TripsListState>(
    'load failure',
    setUp: () => stub(left(const Failure.network())),
    build: () => TripsListCubit(getTrips),
    act: (cubit) => cubit.load(),
    expect: () => [
      const TripsListState.loading(query: all),
      const TripsListState.failure(query: all, failure: Failure.network()),
    ],
  );

  blocTest<TripsListCubit, TripsListState>(
    'setStatus filters and keeps the search',
    setUp: () => stub(right(const [])),
    build: () => TripsListCubit(getTrips),
    seed: () => const TripsListState.empty(query: TripsQuery(search: 'mx')),
    act: (cubit) => cubit.setStatus(TripStatus.archived),
    expect: () => [
      const TripsListState.loading(
        query: TripsQuery(status: TripStatus.archived, search: 'mx'),
      ),
      const TripsListState.empty(
        query: TripsQuery(status: TripStatus.archived, search: 'mx'),
      ),
    ],
    verify: (cubit) => expect(cubit.state.isFiltered, isTrue),
  );

  blocTest<TripsListCubit, TripsListState>(
    'search is debounced: only the last text is requested',
    setUp: () => stub(right([testTrip])),
    build: () => TripsListCubit(getTrips),
    act: (cubit) {
      cubit
        ..search('c')
        ..search('ca')
        ..search('can');
    },
    wait: TripsListCubit.searchDebounce + const Duration(milliseconds: 50),
    expect: () => [
      const TripsListState.loading(query: TripsQuery(search: 'can')),
      TripsListState.loaded(
        query: const TripsQuery(search: 'can'),
        trips: [testTrip],
      ),
    ],
    verify: (_) => verify(() => getTrips(any())).called(1),
  );

  blocTest<TripsListCubit, TripsListState>(
    'a slow older response is ignored',
    setUp: () {
      final slow = Completer<Either<Failure, List<Trip>>>();
      when(() => getTrips(const TripsQuery()))
          .thenReturn(TaskEither(() => slow.future));
      when(() => getTrips(const TripsQuery(status: TripStatus.draft)))
          .thenReturn(TaskEither.right([otherTrip]));
      addTearDown(() => slow.complete(right([testTrip])));
    },
    build: () => TripsListCubit(getTrips),
    act: (cubit) async {
      unawaited(cubit.load());
      await cubit.setStatus(TripStatus.draft);
    },
    expect: () => [
      const TripsListState.loading(query: all),
      const TripsListState.loading(query: TripsQuery(status: TripStatus.draft)),
      TripsListState.loaded(
        query: const TripsQuery(status: TripStatus.draft),
        trips: [otherTrip],
      ),
    ],
  );
}
