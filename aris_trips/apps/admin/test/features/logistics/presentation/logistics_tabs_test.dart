import 'package:aris_admin/core/di/injection.dart';
import 'package:aris_admin/core/error/failure.dart';
import 'package:aris_admin/core/time/time_zones.dart';
import 'package:aris_admin/features/logistics/domain/entities/flight.dart';
import 'package:aris_admin/features/logistics/domain/entities/flight_draft.dart';
import 'package:aris_admin/features/logistics/domain/entities/itinerary_item.dart';
import 'package:aris_admin/features/logistics/domain/entities/lodging.dart';
import 'package:aris_admin/features/logistics/presentation/cubit/item_form_cubit.dart';
import 'package:aris_admin/features/logistics/presentation/cubit/items_cubit.dart';
import 'package:aris_admin/features/logistics/presentation/pages/logistics_tabs.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/logistics_fakes.dart';
import '../../../helpers/pump_app.dart';

void main() {
  late MockFlightsCubit flights;
  late MockLodgingsCubit lodgings;
  late MockItineraryCubit itinerary;

  setUpAll(() async {
    registerLogisticsFallbacks();
    TimeZones.ensureInitialized();
    await initFormatting();
  });

  setUp(() {
    flights = MockFlightsCubit();
    lodgings = MockLodgingsCubit();
    itinerary = MockItineraryCubit();
    when(() => flights.delete(any())).thenAnswer((_) async {});
    when(() => flights.refresh()).thenAnswer((_) async {});
    when(() => lodgings.suggestedZone).thenReturn('America/Cancun');
    when(() => lodgings.state)
        .thenReturn(ItemsState<Lodging>.loaded(items: [testLodging]));
  });

  tearDown(() => getIt.reset());

  Future<void> pump(WidgetTester tester, Widget tab) => pumpRouted(
    tester,
    Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<FlightsCubit>.value(value: flights),
          BlocProvider<LodgingsCubit>.value(value: lodgings),
          BlocProvider<ItineraryCubit>.value(value: itinerary),
        ],
        child: tab,
      ),
    ),
  );

  testWidgets('flights show local times of each airport and duration', (
    tester,
  ) async {
    when(() => flights.state)
        .thenReturn(ItemsState<Flight>.loaded(items: [testFlight]));
    await pump(tester, const FlightsTab(tripId: tripId));

    expect(find.text('MEX → CUN'), findsOneWidget);
    expect(find.text('AM 523 · Aeroméxico'), findsOneWidget);
    expect(find.text('08:00 GMT-6 → 11:15 GMT-5'), findsOneWidget);
    expect(find.text('Duración 2 h 15 min · Terminal T2'), findsOneWidget);
  });

  testWidgets('empty flights invite to add one', (tester) async {
    when(() => flights.state)
        .thenReturn(const ItemsState<Flight>.loaded(items: []));
    await pump(tester, const FlightsTab(tripId: tripId));

    expect(find.text('Sin vuelos'), findsOneWidget);
    expect(find.text('Agregar vuelo'), findsOneWidget);
  });

  testWidgets('load failure offers a retry', (tester) async {
    when(() => flights.state)
        .thenReturn(const ItemsState<Flight>.failure(Failure.network()));
    await pump(tester, const FlightsTab(tripId: tripId));

    await tester.tap(find.text('Reintentar'));
    verify(() => flights.refresh()).called(1);
  });

  testWidgets('deleting asks first', (tester) async {
    when(() => flights.state)
        .thenReturn(ItemsState<Flight>.loaded(items: [testFlight]));
    await pump(tester, const FlightsTab(tripId: tripId));

    await tester.tap(find.byTooltip('Opciones'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Eliminar'));
    await tester.pumpAndSettle();
    expect(find.text('¿Eliminar este vuelo?'), findsOneWidget);

    await tester.tap(find.widgetWithText(FilledButton, 'Eliminar'));
    await tester.pumpAndSettle();
    verify(() => flights.delete(testFlight)).called(1);
  });

  testWidgets('a failed delete shows a snackbar', (tester) async {
    whenListen(
      flights,
      Stream.fromIterable([
        ItemsState<Flight>.loaded(items: [testFlight], busy: true),
        ItemsState<Flight>.loaded(
          items: [testFlight],
          actionFailure: const Failure.network(),
        ),
      ]),
      initialState: ItemsState<Flight>.loaded(items: [testFlight]),
    );
    await pump(tester, const FlightsTab(tripId: tripId));
    await tester.pump();

    expect(
      find.text('Sin conexión. Revisa tu internet e inténtalo de nuevo.'),
      findsOneWidget,
    );
  });

  testWidgets('add opens the flight form and refreshes when saved', (
    tester,
  ) async {
    final form = MockFlightFormCubit();
    when(() => form.state)
        .thenReturn(const ItemFormState<Flight, FlightDraftIssue>.editing());
    getIt.registerFactory<FlightFormCubit>(() => form);
    when(() => flights.state)
        .thenReturn(const ItemsState<Flight>.loaded(items: []));
    await pump(tester, const FlightsTab(tripId: tripId));

    await tester.tap(find.text('Agregar vuelo'));
    await tester.pumpAndSettle();
    expect(find.text('Nuevo vuelo'), findsOneWidget);
    verify(() => form.configure(tripId: tripId)).called(1);
  });

  testWidgets('lodging shows check-in and check-out in its zone', (
    tester,
  ) async {
    await pump(tester, const LodgingsTab(tripId: tripId));

    expect(find.text('Hotel Laguna Azul'), findsOneWidget);
    expect(find.text('Check-in: 20 mar 2027, 15:00'), findsOneWidget);
    expect(find.text('Check-out: 25 mar 2027, 12:00'), findsOneWidget);
    expect(find.text('Cancun (America) · GMT-5'), findsOneWidget);
  });

  testWidgets('itinerary groups by local day', (tester) async {
    final evening = ItineraryItem(
      id: 'i2',
      tripId: tripId,
      // 23:30 on the 21st in Cancún is already the 22nd in UTC.
      startsAt: DateTime.utc(2027, 3, 22, 4, 30),
      timezone: 'America/Cancun',
      title: 'Cena',
    );
    when(
      () => itinerary.state,
    ).thenReturn(ItemsState<ItineraryItem>.loaded(items: [testItem, evening]));
    await pump(tester, const ItineraryTab(tripId: tripId));

    expect(find.textContaining('21 mar 2027'), findsOneWidget);
    expect(find.textContaining('22 mar'), findsNothing);
    expect(find.text('09:00–17:00 GMT-5'), findsOneWidget);
    expect(find.text('23:30 GMT-5'), findsOneWidget);
  });
}
