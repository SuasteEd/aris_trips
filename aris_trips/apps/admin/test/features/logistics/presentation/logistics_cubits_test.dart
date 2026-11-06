import 'package:aris_admin/core/error/failure.dart';
import 'package:aris_admin/features/logistics/domain/entities/flight.dart';
import 'package:aris_admin/features/logistics/domain/entities/flight_draft.dart';
import 'package:aris_admin/features/logistics/domain/entities/lodging.dart';
import 'package:aris_admin/features/logistics/presentation/cubit/item_form_cubit.dart';
import 'package:aris_admin/features/logistics/presentation/cubit/items_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/logistics_fakes.dart';

void main() {
  setUpAll(registerLogisticsFallbacks);

  group('FlightsCubit', () {
    late MockGetFlights getFlights;
    late MockDeleteFlight deleteFlight;

    setUp(() {
      getFlights = MockGetFlights();
      deleteFlight = MockDeleteFlight();
    });

    FlightsCubit build() => FlightsCubit(getFlights, deleteFlight);

    final second = testFlight.copyWith(id: 'f2');

    blocTest<FlightsCubit, ItemsState<Flight>>(
      'load emits the flights',
      setUp: () =>
          when(() => getFlights(any()))
              .thenReturn(TaskEither.right([testFlight])),
      build: build,
      act: (cubit) => cubit.load(tripId),
      expect: () => [
        const ItemsState<Flight>.loading(),
        ItemsState<Flight>.loaded(items: [testFlight]),
      ],
      verify: (cubit) => expect(cubit.tripId, tripId),
    );

    blocTest<FlightsCubit, ItemsState<Flight>>(
      'load failure',
      setUp: () =>
          when(() => getFlights(any()))
              .thenReturn(TaskEither.left(const Failure.network())),
      build: build,
      act: (cubit) => cubit.load(tripId),
      expect: () => [
        const ItemsState<Flight>.loading(),
        const ItemsState<Flight>.failure(Failure.network()),
      ],
    );

    blocTest<FlightsCubit, ItemsState<Flight>>(
      'refresh reloads without the loading state',
      setUp: () {
        final responses = [
          [testFlight],
          [testFlight, second],
        ];
        when(() => getFlights(any()))
            .thenAnswer((_) => TaskEither.right(responses.removeAt(0)));
      },
      build: build,
      act: (cubit) async {
        await cubit.load(tripId);
        await cubit.refresh();
      },
      expect: () => [
        const ItemsState<Flight>.loading(),
        ItemsState<Flight>.loaded(items: [testFlight]),
        ItemsState<Flight>.loaded(items: [testFlight, second]),
      ],
    );

    blocTest<FlightsCubit, ItemsState<Flight>>(
      'delete removes the item',
      setUp: () =>
          when(() => deleteFlight(any())).thenReturn(TaskEither.right(unit)),
      build: build,
      seed: () => ItemsState<Flight>.loaded(items: [testFlight, second]),
      act: (cubit) => cubit.delete(testFlight),
      expect: () => [
        ItemsState<Flight>.loaded(items: [testFlight, second], busy: true),
        ItemsState<Flight>.loaded(items: [second]),
      ],
      verify: (_) => verify(() => deleteFlight('f1')).called(1),
    );

    blocTest<FlightsCubit, ItemsState<Flight>>(
      'delete failure keeps the list and reports',
      setUp: () =>
          when(() => deleteFlight(any()))
              .thenReturn(TaskEither.left(const Failure.network())),
      build: build,
      seed: () => ItemsState<Flight>.loaded(items: [testFlight]),
      act: (cubit) => cubit.delete(testFlight),
      expect: () => [
        ItemsState<Flight>.loaded(items: [testFlight], busy: true),
        ItemsState<Flight>.loaded(
          items: [testFlight],
          actionFailure: const Failure.network(),
        ),
      ],
    );
  });

  group('LodgingsCubit', () {
    test('suggests the zone of the latest lodging', () {
      final cubit = LodgingsCubit(MockGetLodgings(), MockDeleteLodging());
      expect(cubit.suggestedZone, isNull);
      cubit.emit(
        ItemsState<Lodging>.loaded(
          items: [
            testLodging.copyWith(timezone: 'America/Merida'),
            testLodging,
          ],
        ),
      );
      expect(cubit.suggestedZone, 'America/Cancun');
    });
  });

  group('FlightFormCubit', () {
    late MockSaveFlight saveFlight;

    setUp(() => saveFlight = MockSaveFlight());

    FlightFormCubit build({String? itemId}) =>
        FlightFormCubit(saveFlight)..configure(tripId: tripId, itemId: itemId);

    blocTest<FlightFormCubit, ItemFormState<Flight, FlightDraftIssue>>(
      'invalid drafts highlight fields without saving',
      build: build,
      act: (cubit) => cubit.submit(const FlightDraft(airline: 'X')),
      expect: () => [
        isA<ItemFormEditing<Flight, FlightDraftIssue>>().having(
          (s) => s.issues,
          'issues',
          contains(FlightDraftIssue.departureRequired),
        ),
      ],
      verify: (_) => verifyZeroInteractions(saveFlight),
    );

    blocTest<FlightFormCubit, ItemFormState<Flight, FlightDraftIssue>>(
      'saves an edit with the item id',
      setUp: () => when(
        () => saveFlight(
          tripId: any(named: 'tripId'),
          draft: any(named: 'draft'),
          id: any(named: 'id'),
        ),
      ).thenReturn(TaskEither.right(testFlight)),
      build: () => build(itemId: 'f1'),
      act: (cubit) => cubit.submit(validFlightDraft),
      expect: () => [
        const ItemFormState<Flight, FlightDraftIssue>.editing(submitting: true),
        ItemFormState<Flight, FlightDraftIssue>.saved(testFlight),
      ],
      verify: (_) => verify(
        () => saveFlight(tripId: tripId, draft: validFlightDraft, id: 'f1'),
      ).called(1),
    );

    blocTest<FlightFormCubit, ItemFormState<Flight, FlightDraftIssue>>(
      'a save failure keeps the form',
      setUp: () => when(
        () => saveFlight(
          tripId: any(named: 'tripId'),
          draft: any(named: 'draft'),
          id: any(named: 'id'),
        ),
      ).thenReturn(TaskEither.left(const Failure.network())),
      build: build,
      act: (cubit) => cubit.submit(validFlightDraft),
      expect: () => [
        const ItemFormState<Flight, FlightDraftIssue>.editing(submitting: true),
        const ItemFormState<Flight, FlightDraftIssue>.editing(
          failure: Failure.network(),
        ),
      ],
    );
  });
}
