import 'package:aris_admin/core/error/failure.dart';
import 'package:aris_admin/features/trips/domain/entities/trip_draft.dart';
import 'package:aris_admin/features/trips/presentation/cubit/trip_form_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/trips_fakes.dart';

void main() {
  late MockGetTrip getTrip;
  late MockSaveTrip saveTrip;

  setUpAll(registerTripsFallbacks);
  setUp(() {
    getTrip = MockGetTrip();
    saveTrip = MockSaveTrip();
  });

  TripFormCubit build() => TripFormCubit(getTrip, saveTrip);

  blocTest<TripFormCubit, TripFormState>(
    'start without id is an empty form',
    build: build,
    act: (cubit) => cubit.start(),
    expect: () => <TripFormState>[],
    verify: (cubit) => expect(cubit.state, const TripFormState.editing()),
  );

  blocTest<TripFormCubit, TripFormState>(
    'start with id loads the trip to edit',
    setUp: () =>
        when(() => getTrip(any())).thenReturn(TaskEither.right(testTrip)),
    build: build,
    act: (cubit) => cubit.start(tripId: testTrip.id),
    expect: () => [
      const TripFormState.loading(),
      TripFormState.editing(original: testTrip),
    ],
  );

  blocTest<TripFormCubit, TripFormState>(
    'start reports a load failure',
    setUp: () =>
        when(() => getTrip(any()))
            .thenReturn(TaskEither.left(const Failure.notFound())),
    build: build,
    act: (cubit) => cubit.start(tripId: 'missing'),
    expect: () => [
      const TripFormState.loading(),
      const TripFormState.loadFailure(Failure.notFound()),
    ],
  );

  blocTest<TripFormCubit, TripFormState>(
    'submit with issues highlights fields without saving',
    build: build,
    act: (cubit) => cubit.submit(const TripDraft(name: 'X')),
    expect: () => [
      const TripFormState.editing(
        issues: {
          TripDraftIssue.destinationRequired,
          TripDraftIssue.startDateRequired,
          TripDraftIssue.endDateRequired,
        },
      ),
    ],
    verify: (_) => verifyZeroInteractions(saveTrip),
  );

  blocTest<TripFormCubit, TripFormState>(
    'submit creates a trip',
    setUp: () =>
        when(() => saveTrip(any(), id: any(named: 'id')))
            .thenReturn(TaskEither.right(testTrip)),
    build: build,
    act: (cubit) => cubit.submit(validDraft),
    expect: () => [
      const TripFormState.editing(submitting: true),
      TripFormState.saved(testTrip, created: true),
    ],
    verify: (_) => verify(() => saveTrip(validDraft)).called(1),
  );

  blocTest<TripFormCubit, TripFormState>(
    'submit updates the trip being edited',
    setUp: () =>
        when(() => saveTrip(any(), id: any(named: 'id')))
            .thenReturn(TaskEither.right(testTrip)),
    build: build,
    seed: () => TripFormState.editing(original: testTrip),
    act: (cubit) => cubit.submit(validDraft),
    expect: () => [
      TripFormState.editing(original: testTrip, submitting: true),
      TripFormState.saved(testTrip, created: false),
    ],
    verify: (_) =>
        verify(() => saveTrip(validDraft, id: testTrip.id)).called(1),
  );

  blocTest<TripFormCubit, TripFormState>(
    'submit failure keeps the form with the error',
    setUp: () =>
        when(() => saveTrip(any(), id: any(named: 'id')))
            .thenReturn(TaskEither.left(const Failure.network())),
    build: build,
    act: (cubit) => cubit.submit(validDraft),
    expect: () => [
      const TripFormState.editing(submitting: true),
      const TripFormState.editing(failure: Failure.network()),
    ],
  );
}
