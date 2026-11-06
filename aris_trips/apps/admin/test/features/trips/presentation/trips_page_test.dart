import 'package:aris_admin/core/error/failure.dart';
import 'package:aris_admin/features/auth/presentation/cubit/session_cubit.dart';
import 'package:aris_admin/features/trips/domain/entities/trip_status.dart';
import 'package:aris_admin/features/trips/domain/entities/trips_query.dart';
import 'package:aris_admin/features/trips/presentation/cubit/trips_list_cubit.dart';
import 'package:aris_admin/features/trips/presentation/pages/trips_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/auth_fakes.dart';
import '../../../helpers/pump_app.dart';
import '../../../helpers/trips_fakes.dart';

void main() {
  late MockTripsListCubit cubit;
  late MockSessionCubit session;

  setUpAll(() async {
    registerTripsFallbacks();
    await initFormatting();
  });

  setUp(() {
    cubit = MockTripsListCubit();
    session = MockSessionCubit();
    when(() => session.state)
        .thenReturn(const SessionState.authenticated(testAdmin));
    when(() => session.signOut()).thenAnswer((_) async {});
    when(() => cubit.load()).thenAnswer((_) async {});
    when(() => cubit.setStatus(any())).thenAnswer((_) async {});
  });

  Future<void> pump(WidgetTester tester, TripsListState state) {
    when(() => cubit.state).thenReturn(state);
    return pumpRouted(
      tester,
      MultiBlocProvider(
        providers: [
          BlocProvider<TripsListCubit>.value(value: cubit),
          BlocProvider<SessionCubit>.value(value: session),
        ],
        child: const TripsPage(),
      ),
    );
  }

  const all = TripsQuery();

  testWidgets('shows a loader while loading', (tester) async {
    await pump(tester, const TripsListState.loading(query: all));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('lists trips with dates and status', (tester) async {
    await pump(
      tester,
      TripsListState.loaded(query: all, trips: [testTrip, otherTrip]),
    );

    expect(find.text('Cancún Primavera 2027'), findsOneWidget);
    expect(find.text('20–25 mar 2027'), findsOneWidget);
    expect(find.text('Publicado'), findsOneWidget);
    expect(find.text('Borrador'), findsOneWidget);
  });

  testWidgets('empty without filters invites to create a trip', (tester) async {
    await pump(tester, const TripsListState.empty(query: all));

    expect(find.text('Aún no hay viajes'), findsOneWidget);
  });

  testWidgets('empty with filters says there are no results', (tester) async {
    await pump(
      tester,
      const TripsListState.empty(query: TripsQuery(search: 'zzz')),
    );

    expect(find.text('Sin resultados'), findsOneWidget);
  });

  testWidgets('failure offers a retry', (tester) async {
    await pump(
      tester,
      const TripsListState.failure(query: all, failure: Failure.network()),
    );

    await tester.tap(find.text('Reintentar'));
    verify(() => cubit.load()).called(1);
  });

  testWidgets('status chips filter the list', (tester) async {
    await pump(tester, const TripsListState.empty(query: all));

    await tester.tap(find.byKey(const Key('filter_archived')));
    verify(() => cubit.setStatus(TripStatus.archived)).called(1);

    await tester.tap(find.byKey(const Key('filter_all')));
    verify(() => cubit.setStatus(null)).called(1);
  });

  testWidgets('typing searches', (tester) async {
    await pump(tester, const TripsListState.empty(query: all));

    await tester.enterText(find.byKey(const Key('trips_search')), 'oax');
    verify(() => cubit.search('oax')).called(1);
  });

  testWidgets('opening a trip goes to its detail and reloads on return', (
    tester,
  ) async {
    await pump(tester, TripsListState.loaded(query: all, trips: [testTrip]));

    await tester.tap(find.text('Cancún Primavera 2027'));
    await tester.pumpAndSettle();
    expect(find.text('route:/trips/${testTrip.id}'), findsOneWidget);
  });

  testWidgets('the new trip button opens the form', (tester) async {
    await pump(tester, const TripsListState.empty(query: all));

    await tester.tap(find.byKey(const Key('new_trip')));
    await tester.pumpAndSettle();
    expect(find.text('route:/trips/new'), findsOneWidget);
  });

  testWidgets('sign out', (tester) async {
    await pump(tester, const TripsListState.empty(query: all));

    await tester.tap(find.byKey(const Key('sign_out')));
    verify(() => session.signOut()).called(1);
  });
}
