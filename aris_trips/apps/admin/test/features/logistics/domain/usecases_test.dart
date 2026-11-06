import 'package:aris_admin/core/error/failure.dart';
import 'package:aris_admin/features/logistics/domain/entities/flight.dart';
import 'package:aris_admin/features/logistics/domain/usecases/flight_usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/logistics_fakes.dart';

void main() {
  late MockFlightsRepository repository;

  setUpAll(registerLogisticsFallbacks);
  setUp(() => repository = MockFlightsRepository());

  test('SaveFlight rejects invalid drafts', () async {
    final result = await SaveFlight(repository)(
      tripId: tripId,
      draft: validFlightDraft.copyWith(airline: ''),
    ).run();

    expect(result, left<Failure, Flight>(const Failure.invalidInput()));
    verifyZeroInteractions(repository);
  });

  test('SaveFlight creates with a normalized draft', () async {
    when(() => repository.createFlight(any(), any()))
        .thenReturn(TaskEither.right(testFlight));

    await SaveFlight(repository)(tripId: tripId, draft: validFlightDraft).run();

    verify(() => repository.createFlight(tripId, validFlightDraft.normalized()))
        .called(1);
  });

  test('SaveFlight updates when an id is given', () async {
    when(() => repository.updateFlight(any(), any()))
        .thenReturn(TaskEither.right(testFlight));

    await SaveFlight(repository)(
      tripId: tripId,
      draft: validFlightDraft,
      id: 'f1',
    ).run();

    verify(() => repository.updateFlight('f1', validFlightDraft.normalized()))
        .called(1);
  });
}
