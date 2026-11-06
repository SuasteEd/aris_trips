import 'package:aris_admin/core/time/time_zones.dart';
import 'package:aris_admin/features/logistics/domain/entities/flight.dart';
import 'package:aris_admin/features/logistics/domain/entities/flight_draft.dart';
import 'package:aris_admin/features/logistics/domain/entities/itinerary_draft.dart';
import 'package:aris_admin/features/logistics/domain/entities/itinerary_item.dart';
import 'package:aris_admin/features/logistics/domain/entities/lodging.dart';
import 'package:aris_admin/features/logistics/domain/entities/lodging_draft.dart';
import 'package:aris_admin/features/logistics/presentation/cubit/item_form_cubit.dart';
import 'package:aris_admin/features/logistics/presentation/pages/flight_form_page.dart';
import 'package:aris_admin/features/logistics/presentation/pages/itinerary_form_page.dart';
import 'package:aris_admin/features/logistics/presentation/pages/lodging_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/logistics_fakes.dart';
import '../../../helpers/pump_app.dart';

void main() {
  setUpAll(() async {
    registerLogisticsFallbacks();
    TimeZones.ensureInitialized();
    await initFormatting();
  });

  group('FlightFormPage', () {
    late MockFlightFormCubit cubit;

    setUp(() {
      cubit = MockFlightFormCubit();
      when(() => cubit.submit(any())).thenAnswer((_) async {});
    });

    Future<void> pump(WidgetTester tester, {Flight? original}) => pumpRouted(
      tester,
      BlocProvider<FlightFormCubit>.value(
        value: cubit,
        child: FlightFormPage(original: original),
      ),
    );

    testWidgets('editing shows local times and the duration', (tester) async {
      when(() => cubit.state)
          .thenReturn(const ItemFormState<Flight, FlightDraftIssue>.editing());
      await pump(tester, original: testFlight);

      expect(find.text('Editar vuelo'), findsOneWidget);
      expect(find.text('20 mar 2027, 08:00'), findsOneWidget);
      expect(find.text('20 mar 2027, 11:15'), findsOneWidget);
      expect(find.text('Mexico City (America)'), findsOneWidget);
      expect(find.text('Cancun (America)'), findsOneWidget);
      expect(find.text('Duración: 2 h 15 min'), findsOneWidget);
    });

    testWidgets('submits the typed draft', (tester) async {
      when(() => cubit.state)
          .thenReturn(const ItemFormState<Flight, FlightDraftIssue>.editing());
      await pump(tester, original: testFlight);

      await tester.enterText(find.byKey(const Key('flight_terminal')), 'T1');
      await tester.ensureVisible(find.byKey(const Key('save_item')));
      await tester.tap(find.byKey(const Key('save_item')));

      final draft =
          verify(() => cubit.submit(captureAny())).captured.single
              as FlightDraft;
      expect(draft.terminal, 'T1');
      expect(draft.departsAt, testFlight.departsAt);
    });

    testWidgets('shows the issues', (tester) async {
      when(() => cubit.state).thenReturn(
        const ItemFormState<Flight, FlightDraftIssue>.editing(
          issues: {
            FlightDraftIssue.airlineRequired,
            FlightDraftIssue.arrivalNotAfterDeparture,
          },
        ),
      );
      await pump(tester);

      expect(find.text('Escribe la aerolínea.'), findsOneWidget);
      expect(
        find.text(
          'La llegada debe ser después de la salida (revisa las zonas).',
        ),
        findsOneWidget,
      );
    });

    testWidgets('the zone field opens a searchable list', (tester) async {
      when(() => cubit.state)
          .thenReturn(const ItemFormState<Flight, FlightDraftIssue>.editing());
      await pump(tester);

      await tester.tap(find.byKey(const Key('flight_arrival_tz')));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(const Key('time_zone_search')), 'tiju');
      await tester.pumpAndSettle();
      await tester.tap(find.text('America/Tijuana'));
      await tester.pumpAndSettle();

      expect(find.text('Tijuana (America)'), findsOneWidget);
    });
  });

  group('LodgingFormPage', () {
    testWidgets('submits coordinates as typed', (tester) async {
      final cubit = MockLodgingFormCubit();
      when(
        () => cubit.state,
      ).thenReturn(const ItemFormState<Lodging, LodgingDraftIssue>.editing());
      when(() => cubit.submit(any())).thenAnswer((_) async {});
      await pumpRouted(
        tester,
        BlocProvider<LodgingFormCubit>.value(
          value: cubit,
          child: const LodgingFormPage(
            initial: LodgingDraft(timezone: 'America/Cancun'),
          ),
        ),
      );

      expect(find.text('Cancun (America)'), findsOneWidget);
      await tester.enterText(find.byKey(const Key('lodging_name')), 'Hotel');
      await tester.enterText(find.byKey(const Key('lodging_latitude')), '21,1');
      await tester.ensureVisible(find.byKey(const Key('save_item')));
      await tester.tap(find.byKey(const Key('save_item')));

      final draft =
          verify(() => cubit.submit(captureAny())).captured.single
              as LodgingDraft;
      expect(draft.name, 'Hotel');
      expect(draft.latitude, '21,1');
      expect(draft.timezone, 'America/Cancun');
    });
  });

  group('ItineraryFormPage', () {
    testWidgets('the optional end can be cleared', (tester) async {
      final cubit = MockItineraryFormCubit();
      when(() => cubit.state).thenReturn(
        const ItemFormState<ItineraryItem, ItineraryDraftIssue>.editing(),
      );
      when(() => cubit.submit(any())).thenAnswer((_) async {});
      await pumpRouted(
        tester,
        BlocProvider<ItineraryFormCubit>.value(
          value: cubit,
          child: ItineraryFormPage(original: testItem),
        ),
      );

      expect(find.text('21 mar 2027, 17:00'), findsOneWidget);
      await tester.tap(find.byTooltip('Quitar'));
      await tester.pump();
      expect(find.text('21 mar 2027, 17:00'), findsNothing);

      await tester.ensureVisible(find.byKey(const Key('save_item')));
      await tester.tap(find.byKey(const Key('save_item')));
      final draft =
          verify(() => cubit.submit(captureAny())).captured.single
              as ItineraryDraft;
      expect(draft.endsLocal, isNull);
      expect(draft.startsLocal, DateTime(2027, 3, 21, 9));
    });
  });
}
