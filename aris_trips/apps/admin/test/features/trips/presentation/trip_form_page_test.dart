import 'package:aris_admin/core/error/failure.dart';
import 'package:aris_admin/features/trips/domain/entities/trip_draft.dart';
import 'package:aris_admin/features/trips/domain/entities/trip_status.dart';
import 'package:aris_admin/features/trips/presentation/cubit/trip_form_cubit.dart';
import 'package:aris_admin/features/trips/presentation/pages/trip_form_page.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/pump_app.dart';
import '../../../helpers/trips_fakes.dart';

void main() {
  late MockTripFormCubit cubit;

  setUpAll(() async {
    registerTripsFallbacks();
    await initFormatting();
  });

  setUp(() {
    cubit = MockTripFormCubit();
    when(() => cubit.submit(any())).thenAnswer((_) async {});
    when(() => cubit.start(tripId: any(named: 'tripId')))
        .thenAnswer((_) async {});
  });

  Future<void> pump(WidgetTester tester, {String? tripId}) => pumpRouted(
    tester,
    BlocProvider<TripFormCubit>.value(
      value: cubit,
      child: TripFormPage(tripId: tripId),
    ),
  );

  testWidgets('submits what the admin typed', (tester) async {
    when(() => cubit.state).thenReturn(const TripFormState.editing());
    await pump(tester);

    expect(find.text('Nuevo viaje'), findsOneWidget);
    await tester.enterText(find.byKey(const Key('trip_name')), 'Mérida');
    await tester.enterText(
      find.byKey(const Key('trip_destination')),
      'Yucatán',
    );
    await tester.tap(find.byKey(const Key('save_trip')));

    final draft =
        verify(() => cubit.submit(captureAny())).captured.single as TripDraft;
    expect(draft.name, 'Mérida');
    expect(draft.destination, 'Yucatán');
    expect(draft.startDate, isNull);
    expect(draft.status, TripStatus.draft);
  });

  testWidgets('shows the issues reported by the cubit', (tester) async {
    when(() => cubit.state).thenReturn(
      const TripFormState.editing(
        issues: {TripDraftIssue.nameRequired, TripDraftIssue.endBeforeStart},
      ),
    );
    await pump(tester);

    expect(find.text('Escribe el nombre del viaje.'), findsOneWidget);
    expect(
      find.text('La fecha de fin no puede ser antes del inicio.'),
      findsOneWidget,
    );
  });

  testWidgets('the date field opens the date picker', (tester) async {
    when(() => cubit.state).thenReturn(const TripFormState.editing());
    await pump(tester);

    await tester.tap(find.byKey(const Key('trip_start_date')));
    await tester.pumpAndSettle();
    expect(find.byType(DatePickerDialog), findsOneWidget);
  });

  testWidgets('editing prefills the fields', (tester) async {
    when(() => cubit.state)
        .thenReturn(TripFormState.editing(original: testTrip));
    await pump(tester, tripId: testTrip.id);

    expect(find.text('Editar viaje'), findsOneWidget);
    expect(find.text('Cancún Primavera 2027'), findsOneWidget);
    expect(find.text('20 mar 2027'), findsOneWidget);
    expect(find.text('25 mar 2027'), findsOneWidget);
  });

  testWidgets('a save failure is shown and the button is enabled again', (
    tester,
  ) async {
    when(() => cubit.state)
        .thenReturn(const TripFormState.editing(failure: Failure.network()));
    await pump(tester);

    expect(find.byKey(const Key('trip_form_error')), findsOneWidget);
    final button = tester.widget<FilledButton>(
      find.byKey(const Key('save_trip')),
    );
    expect(button.onPressed, isNotNull);
  });

  testWidgets('a created trip replaces the form with its detail', (
    tester,
  ) async {
    whenListen(
      cubit,
      Stream.value(TripFormState.saved(testTrip, created: true)),
      initialState: const TripFormState.editing(),
    );
    await pump(tester);
    await tester.pumpAndSettle();

    expect(find.text('route:/trips/${testTrip.id}'), findsOneWidget);
  });
}
