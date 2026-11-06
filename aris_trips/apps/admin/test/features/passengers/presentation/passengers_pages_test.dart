import 'package:aris_admin/core/error/failure.dart';
import 'package:aris_admin/core/time/time_zones.dart';
import 'package:aris_admin/features/passengers/domain/entities/booking.dart';
import 'package:aris_admin/features/passengers/domain/entities/passenger_draft.dart';
import 'package:aris_admin/features/passengers/domain/entities/passenger_import.dart';
import 'package:aris_admin/features/passengers/domain/services/import_preview_builder.dart';
import 'package:aris_admin/features/passengers/domain/usecases/assignment_usecases.dart';
import 'package:aris_admin/features/passengers/presentation/cubit/add_passenger_cubit.dart';
import 'package:aris_admin/features/passengers/presentation/cubit/booking_cubit.dart';
import 'package:aris_admin/features/passengers/presentation/cubit/bookings_cubit.dart';
import 'package:aris_admin/features/passengers/presentation/cubit/bulk_assign_cubit.dart';
import 'package:aris_admin/features/passengers/presentation/cubit/import_cubit.dart';
import 'package:aris_admin/features/passengers/presentation/pages/add_passenger_page.dart';
import 'package:aris_admin/features/passengers/presentation/pages/booking_page.dart';
import 'package:aris_admin/features/passengers/presentation/pages/bulk_assign_page.dart';
import 'package:aris_admin/features/passengers/presentation/pages/import_passengers_page.dart';
import 'package:aris_admin/features/passengers/presentation/pages/passengers_tab.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/logistics_fakes.dart';
import '../../../helpers/passengers_fakes.dart';
import '../../../helpers/pump_app.dart';

void main() {
  setUpAll(() async {
    registerPassengersFallbacks();
    registerLogisticsFallbacks();
    TimeZones.ensureInitialized();
    await initFormatting();
  });

  group('PassengersTab', () {
    late MockBookingsCubit cubit;

    setUp(() {
      cubit = MockBookingsCubit();
      when(() => cubit.refresh()).thenAnswer((_) async {});
      when(() => cubit.bookings).thenReturn(const [anaBooking, luisBooking]);
    });

    Future<void> pump(WidgetTester tester, ItemsState<Booking> state) {
      when(() => cubit.state).thenReturn(state);
      return pumpRouted(
        tester,
        Scaffold(
          body: BlocProvider<BookingsCubit>.value(
            value: cubit,
            child: const PassengersTab(tripId: tripId),
          ),
        ),
      );
    }

    testWidgets('lists passengers with status and assignments', (tester) async {
      await pump(
        tester,
        const ItemsState<Booking>.loaded(items: [anaBooking, luisBooking]),
      );

      expect(find.text('Ana López'), findsOneWidget);
      expect(find.text('1 vuelo · Hab. 1204'), findsOneWidget);
      expect(find.text('Confirmada'), findsOneWidget);
      expect(find.text('Sin asignaciones'), findsOneWidget);
      expect(find.text('Pendiente'), findsOneWidget);
    });

    testWidgets('search filters without accents', (tester) async {
      await pump(
        tester,
        const ItemsState<Booking>.loaded(items: [anaBooking, luisBooking]),
      );

      await tester.enterText(
        find.byKey(const Key('passengers_search')),
        'martinez',
      );
      await tester.pump();
      expect(find.text('Ana López'), findsNothing);
      expect(find.text('Luis Martínez'), findsOneWidget);

      await tester.enterText(find.byKey(const Key('passengers_search')), 'zzz');
      await tester.pump();
      expect(find.text('Sin resultados'), findsOneWidget);
    });

    testWidgets('empty trip offers add and import', (tester) async {
      await pump(tester, const ItemsState<Booking>.loaded(items: []));

      expect(find.text('Sin pasajeros'), findsOneWidget);
      await tester.tap(find.text('Importar CSV'));
      await tester.pumpAndSettle();
      expect(
        find.text('route:/trips/$tripId/passengers/import'),
        findsOneWidget,
      );
    });

    testWidgets('opening a passenger goes to the booking page', (tester) async {
      await pump(tester, const ItemsState<Booking>.loaded(items: [anaBooking]));

      await tester.tap(find.text('Ana López'));
      await tester.pumpAndSettle();
      expect(find.text('route:/trips/$tripId/passengers/b1'), findsOneWidget);
    });
  });

  group('AddPassengerPage', () {
    late MockAddPassengerCubit cubit;

    setUp(() {
      cubit = MockAddPassengerCubit();
      when(() => cubit.isOnTrip(ana)).thenReturn(true);
      when(() => cubit.isOnTrip(luis)).thenReturn(false);
      when(() => cubit.addNew(any())).thenAnswer((_) async {});
      when(() => cubit.addExisting(any())).thenAnswer((_) async {});
    });

    Future<void> pump(WidgetTester tester) => pumpRouted(
      tester,
      BlocProvider<AddPassengerCubit>.value(
        value: cubit,
        child: const AddPassengerPage(),
      ),
    );

    testWidgets('search results mark who is already on the trip', (
      tester,
    ) async {
      when(
        () => cubit.state,
      ).thenReturn(const AddPassengerState(query: 'a', results: [ana, luis]));
      await pump(tester);

      expect(find.text('Ya está en el viaje'), findsOneWidget);
      await tester.tap(find.widgetWithText(TextButton, 'Agregar'));
      verify(() => cubit.addExisting(luis)).called(1);
    });

    testWidgets('creates a new passenger from the form', (tester) async {
      when(() => cubit.state).thenReturn(const AddPassengerState());
      await pump(tester);

      await tester.enterText(
        find.byKey(const Key('passenger_first_name')),
        'Rita',
      );
      await tester.enterText(
        find.byKey(const Key('passenger_last_name')),
        'Lara',
      );
      await tester.ensureVisible(find.byKey(const Key('create_passenger')));
      await tester.tap(find.byKey(const Key('create_passenger')));

      verify(
        () => cubit.addNew(
          const PassengerDraft(firstName: 'Rita', lastName: 'Lara'),
        ),
      ).called(1);
    });

    testWidgets('shows field issues', (tester) async {
      when(() => cubit.state).thenReturn(
        const AddPassengerState(issues: {PassengerDraftIssue.emailInvalid}),
      );
      await pump(tester);

      expect(find.text('Escribe un correo válido.'), findsOneWidget);
    });
  });

  group('BookingPage', () {
    late MockBookingCubit cubit;

    final details = BookingDetails(
      booking: anaBooking,
      flights: [
        testFlight,
        testFlight.copyWith(
          id: 'f2',
          flightNumber: 'AM 530',
          origin: 'CUN',
          destination: 'MEX',
        ),
      ],
      lodgings: [testLodging],
      activities: [testItem.copyWith(bookingId: 'b1', title: 'Spa')],
    );

    setUp(() {
      cubit = MockBookingCubit();
      when(() => cubit.state).thenReturn(BookingState.loaded(details));
      when(
        () => cubit.saveFlightAssignment(
          flightId: any(named: 'flightId'),
          assignmentId: any(named: 'assignmentId'),
          seat: any(named: 'seat'),
          recordLocator: any(named: 'recordLocator'),
        ),
      ).thenAnswer((_) async {});
      when(() => cubit.removeFromTrip()).thenAnswer((_) async {});
      when(
        () => cubit.updateBooking(
          status: any(named: 'status'),
          notes: any(named: 'notes'),
        ),
      ).thenAnswer((_) async {});
    });

    Future<void> pump(WidgetTester tester) => pumpRouted(
      tester,
      BlocProvider<BookingCubit>.value(
        value: cubit,
        child: const BookingPage(),
      ),
    );

    testWidgets('shows passenger, booking and own assignments', (tester) async {
      await pump(tester);

      expect(find.text('Ana López'), findsOneWidget);
      expect(find.text('Vegetariana'), findsOneWidget);
      expect(find.text('Asiento 12A · Localizador QWERTY'), findsOneWidget);
      expect(find.text('Habitación 1204'), findsOneWidget);
      await tester.scrollUntilVisible(find.text('Spa'), 200);
      expect(find.text('Spa'), findsOneWidget);
    });

    testWidgets('assigning a flight offers only unassigned flights', (
      tester,
    ) async {
      await pump(tester);

      await tester.tap(find.byKey(const Key('assign_flight')));
      await tester.pumpAndSettle();
      expect(find.textContaining('AM 530'), findsOneWidget);
      await tester.enterText(find.byKey(const Key('assignment_first')), '3c');
      await tester.tap(find.byKey(const Key('save_assignment')));
      await tester.pumpAndSettle();

      verify(
        () => cubit.saveFlightAssignment(
          flightId: 'f2',
          seat: '3c',
          recordLocator: '',
        ),
      ).called(1);
    });

    testWidgets('editing status and notes', (tester) async {
      await pump(tester);

      await tester.tap(find.byKey(const Key('edit_booking')));
      await tester.pumpAndSettle();
      await tester.enterText(
        find.byKey(const Key('booking_notes')),
        'Silla de ruedas',
      );
      await tester.tap(find.byKey(const Key('save_booking')));
      await tester.pumpAndSettle();

      verify(
        () => cubit.updateBooking(
          status: BookingStatus.confirmed,
          notes: 'Silla de ruedas',
        ),
      ).called(1);
    });

    testWidgets('removing from the trip asks first', (tester) async {
      await pump(tester);

      await tester.scrollUntilVisible(
        find.byKey(const Key('remove_from_trip')),
        200,
      );
      await tester.tap(find.byKey(const Key('remove_from_trip')));
      await tester.pumpAndSettle();
      expect(find.text('¿Quitar del viaje?'), findsOneWidget);
      await tester.tap(find.widgetWithText(FilledButton, 'Quitar'));
      await tester.pumpAndSettle();

      verify(() => cubit.removeFromTrip()).called(1);
    });

    testWidgets('a failed action shows a snackbar', (tester) async {
      whenListen(
        cubit,
        Stream.fromIterable([
          BookingState.loaded(details, busy: true),
          BookingState.loaded(details, actionFailure: const Failure.network()),
        ]),
        initialState: BookingState.loaded(details),
      );
      await pump(tester);
      await tester.pump();

      expect(
        find.text('Sin conexión. Revisa tu internet e inténtalo de nuevo.'),
        findsOneWidget,
      );
    });
  });

  group('BulkAssignPage', () {
    testWidgets('shows who already has it and submits the selection', (
      tester,
    ) async {
      final cubit = MockBulkAssignCubit();
      when(() => cubit.submit()).thenAnswer((_) async {});
      when(() => cubit.state).thenReturn(
        BulkAssignState.ready(
          bookings: const [anaBooking, luisBooking],
          flights: [testFlight],
          lodgings: [testLodging],
          targetId: 'f1',
          selected: const {'b2'},
        ),
      );
      await pumpRouted(
        tester,
        BlocProvider<BulkAssignCubit>.value(
          value: cubit,
          child: const BulkAssignPage(),
        ),
      );

      expect(find.text('Ya asignado'), findsOneWidget);
      await tester.tap(find.text('Luis Martínez'));
      verify(() => cubit.toggle('b2')).called(1);
      await tester.tap(find.text('Asignar a 1'));
      verify(() => cubit.submit()).called(1);
    });

    testWidgets('switching to lodging', (tester) async {
      final cubit = MockBulkAssignCubit();
      when(() => cubit.state).thenReturn(
        BulkAssignState.ready(
          bookings: const [luisBooking],
          flights: const [],
          lodgings: [testLodging],
        ),
      );
      await pumpRouted(
        tester,
        BlocProvider<BulkAssignCubit>.value(
          value: cubit,
          child: const BulkAssignPage(),
        ),
      );

      expect(find.text('El viaje aún no tiene vuelos.'), findsOneWidget);
      await tester.tap(find.text('Hospedaje'));
      verify(() => cubit.setTarget(BulkTarget.lodging)).called(1);
    });
  });

  group('ImportPassengersPage', () {
    late MockImportCubit cubit;

    setUp(() {
      cubit = MockImportCubit();
      when(() => cubit.pickFile()).thenAnswer((_) async {});
      when(() => cubit.submit()).thenAnswer((_) async {});
    });

    Future<void> pump(WidgetTester tester, ImportState state) {
      when(() => cubit.state).thenReturn(state);
      return pumpRouted(
        tester,
        BlocProvider<ImportCubit>.value(
          value: cubit,
          child: const ImportPassengersPage(),
        ),
      );
    }

    testWidgets('explains the format and picks a file', (tester) async {
      await pump(
        tester,
        const ImportState.idle(fileError: ImportFileError.tooLarge),
      );

      expect(find.text('El archivo pesa más de 1 MB.'), findsOneWidget);
      await tester.tap(find.byKey(const Key('pick_csv')));
      verify(() => cubit.pickFile()).called(1);
    });

    testWidgets('previews valid and invalid rows', (tester) async {
      final preview = ImportPreviewBuilder.build([
        ['nombre', 'apellido', 'correo'],
        ['Rita', 'Lara', ''],
        ['', 'Sin nombre', 'mal'],
      ], existing: const []);
      await pump(tester, ImportState.preview(preview));

      expect(find.text('1 fila válida · 1 con errores'), findsOneWidget);
      expect(find.text('Rita Lara'), findsOneWidget);
      expect(
        find.text('Fila 3: Falta el nombre, Correo inválido'),
        findsOneWidget,
      );
      await tester.tap(find.text('Importar 1 pasajero'));
      verify(() => cubit.submit()).called(1);
    });

    testWidgets('missing columns are explained', (tester) async {
      await pump(
        tester,
        const ImportState.preview(
          ImportPreview(missingColumns: {ImportColumn.lastName}),
        ),
      );

      expect(find.text('Faltan columnas'), findsOneWidget);
      expect(find.text('El archivo debe tener: apellido.'), findsOneWidget);
    });

    testWidgets('done shows the totals', (tester) async {
      await pump(
        tester,
        const ImportState.done(ImportResult(created: 3, reused: 1)),
      );

      expect(find.text('4 pasajeros importados'), findsOneWidget);
      expect(find.text('1 ya existía y se reutilizó.'), findsOneWidget);
    });
  });
}
