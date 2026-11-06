import 'package:aris_admin/core/error/failure.dart';
import 'package:aris_admin/core/time/time_zones.dart';
import 'package:aris_admin/features/logistics/domain/entities/flight.dart';
import 'package:aris_admin/features/logistics/domain/entities/itinerary_item.dart';
import 'package:aris_admin/features/logistics/domain/entities/lodging.dart';
import 'package:aris_admin/features/logistics/presentation/cubit/items_cubit.dart';
import 'package:aris_admin/features/passengers/domain/entities/booking.dart';
import 'package:aris_admin/features/passengers/presentation/cubit/bookings_cubit.dart';
import 'package:aris_admin/features/trips/domain/entities/trip_status.dart';
import 'package:aris_admin/features/trips/presentation/cubit/trip_detail_cubit.dart';
import 'package:aris_admin/features/trips/presentation/pages/trip_detail_page.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/logistics_fakes.dart';
import '../../../helpers/passengers_fakes.dart';
import '../../../helpers/pump_app.dart';
import '../../../helpers/trips_fakes.dart';

void main() {
  late MockTripDetailCubit cubit;

  setUpAll(() async {
    registerTripsFallbacks();
    TimeZones.ensureInitialized();
    await initFormatting();
  });

  setUp(() {
    cubit = MockTripDetailCubit();
    when(() => cubit.load(any())).thenAnswer((_) async {});
    when(() => cubit.changeStatus(any())).thenAnswer((_) async {});
    when(() => cubit.pickCover()).thenAnswer((_) async {});
  });

  Future<void> pump(WidgetTester tester) {
    final flights = MockFlightsCubit();
    when(() => flights.state)
        .thenReturn(ItemsState<Flight>.loaded(items: [testFlight]));
    final lodgings = MockLodgingsCubit();
    when(() => lodgings.state)
        .thenReturn(const ItemsState<Lodging>.loaded(items: []));
    final itinerary = MockItineraryCubit();
    when(() => itinerary.state)
        .thenReturn(const ItemsState<ItineraryItem>.loaded(items: []));
    final bookings = MockBookingsCubit();
    when(() => bookings.state).thenReturn(
      const ItemsState<Booking>.loaded(items: [anaBooking, luisBooking]),
    );
    when(() => bookings.bookings).thenReturn(const [anaBooking, luisBooking]);
    when(() => bookings.audience).thenReturn({'b1': 'Ana López'});
    return pumpRouted(
      tester,
      MultiBlocProvider(
        providers: [
          BlocProvider<TripDetailCubit>.value(value: cubit),
          BlocProvider<FlightsCubit>.value(value: flights),
          BlocProvider<LodgingsCubit>.value(value: lodgings),
          BlocProvider<ItineraryCubit>.value(value: itinerary),
          BlocProvider<BookingsCubit>.value(value: bookings),
        ],
        child: TripDetailPage(tripId: testTrip.id),
      ),
    );
  }

  testWidgets('shows the trip', (tester) async {
    when(() => cubit.state).thenReturn(TripDetailState.loaded(trip: testTrip));
    await pump(tester);

    expect(find.text('Cancún Primavera 2027'), findsOneWidget);
    expect(find.text('Cancún, Quintana Roo'), findsOneWidget);
    expect(find.text('20–25 mar 2027'), findsOneWidget);
    expect(find.text('Cinco noches con traslados.'), findsOneWidget);
    expect(find.text('Publicado'), findsOneWidget);
    expect(find.text('Agregar portada'), findsOneWidget);
  });

  testWidgets('tabs show the trip logistics', (tester) async {
    when(() => cubit.state).thenReturn(TripDetailState.loaded(trip: testTrip));
    await pump(tester);

    await tester.tap(find.text('Vuelos'));
    await tester.pumpAndSettle();
    expect(find.text('MEX → CUN'), findsOneWidget);

    await tester.tap(find.text('Hospedaje'));
    await tester.pumpAndSettle();
    expect(find.text('Sin hospedaje'), findsOneWidget);

    await tester.tap(find.text('Itinerario'));
    await tester.pumpAndSettle();
    expect(find.text('Sin actividades'), findsOneWidget);

    await tester.tap(find.text('Pasajeros'));
    await tester.pumpAndSettle();
    expect(find.text('Ana López'), findsOneWidget);
    expect(find.text('2 pasajeros'), findsOneWidget);
  });

  testWidgets('cover button picks a cover', (tester) async {
    when(() => cubit.state).thenReturn(TripDetailState.loaded(trip: testTrip));
    await pump(tester);

    await tester.tap(find.byKey(const Key('change_cover')));
    verify(() => cubit.pickCover()).called(1);
  });

  testWidgets('status menu hides the current status and publishes', (
    tester,
  ) async {
    when(() => cubit.state).thenReturn(TripDetailState.loaded(trip: otherTrip));
    await pump(tester);

    await tester.tap(find.byKey(const Key('trip_status_menu')));
    await tester.pumpAndSettle();
    expect(find.text('Pasar a borrador'), findsNothing);

    await tester.tap(find.text('Publicar'));
    await tester.pumpAndSettle();
    verify(() => cubit.changeStatus(TripStatus.published)).called(1);
  });

  testWidgets('archiving asks for confirmation', (tester) async {
    when(() => cubit.state).thenReturn(TripDetailState.loaded(trip: testTrip));
    await pump(tester);

    await tester.tap(find.byKey(const Key('trip_status_menu')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Archivar'));
    await tester.pumpAndSettle();
    expect(find.text('¿Archivar este viaje?'), findsOneWidget);

    await tester.tap(find.text('Cancelar'));
    await tester.pumpAndSettle();
    verifyNever(() => cubit.changeStatus(any()));

    await tester.tap(find.byKey(const Key('trip_status_menu')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Archivar'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Archivar'));
    await tester.pumpAndSettle();
    verify(() => cubit.changeStatus(TripStatus.archived)).called(1);
  });

  testWidgets('a failed action shows a snackbar', (tester) async {
    whenListen(
      cubit,
      Stream.fromIterable([
        TripDetailState.loaded(trip: testTrip, busy: true),
        TripDetailState.loaded(
          trip: testTrip,
          actionFailure: const Failure.network(),
        ),
      ]),
      initialState: TripDetailState.loaded(trip: testTrip),
    );
    await pump(tester);
    await tester.pump();

    expect(
      find.text('Sin conexión. Revisa tu internet e inténtalo de nuevo.'),
      findsOneWidget,
    );
  });

  testWidgets('edit opens the form', (tester) async {
    when(() => cubit.state).thenReturn(TripDetailState.loaded(trip: testTrip));
    await pump(tester);

    await tester.tap(find.byKey(const Key('edit_trip')));
    await tester.pumpAndSettle();
    expect(find.text('route:/trips/${testTrip.id}/edit'), findsOneWidget);
  });

  testWidgets('load failure offers a retry', (tester) async {
    when(() => cubit.state)
        .thenReturn(const TripDetailState.failure(Failure.notFound()));
    await pump(tester);

    expect(find.text('No encontramos lo que buscas.'), findsOneWidget);
    await tester.tap(find.text('Reintentar'));
    verify(() => cubit.load(testTrip.id)).called(1);
  });
}
