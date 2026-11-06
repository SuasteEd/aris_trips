import 'package:aris_admin/core/error/failure.dart';
import 'package:aris_admin/features/trips/data/repositories/trips_repository_impl.dart';
import 'package:aris_admin/features/trips/domain/entities/trip.dart';
import 'package:aris_admin/features/trips/domain/entities/trip_status.dart';
import 'package:aris_admin/features/trips/domain/entities/trips_query.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' show ClientException;
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../helpers/trips_fakes.dart';

void main() {
  late MockTripsRemoteDataSource remote;
  late TripsRepositoryImpl repository;

  setUpAll(registerTripsFallbacks);
  setUp(() {
    remote = MockTripsRemoteDataSource();
    repository = TripsRepositoryImpl(remote);
  });

  test('getTrips returns the list', () async {
    when(() => remote.fetchTrips(any())).thenAnswer((_) async => [testTrip]);

    final result = await repository.getTrips(const TripsQuery()).run();

    expect(result.getOrElse((_) => []), [testTrip]);
  });

  test('getTrips maps network errors', () async {
    when(() => remote.fetchTrips(any())).thenThrow(ClientException('offline'));

    final result = await repository.getTrips(const TripsQuery()).run();

    expect(result, left<Failure, List<Trip>>(const Failure.network()));
  });

  test('getTrip maps a missing row to notFound', () async {
    when(
      () => remote.fetchTrip(any()),
    ).thenThrow(const PostgrestException(message: 'no rows', code: 'PGRST116'));

    final result = await repository.getTrip('x').run();

    expect(result, left<Failure, Trip>(const Failure.notFound()));
  });

  test('createTrip and updateTrip delegate', () async {
    when(() => remote.insertTrip(any())).thenAnswer((_) async => testTrip);
    when(() => remote.updateTrip(any(), any()))
        .thenAnswer((_) async => testTrip);

    expect(
      await repository.createTrip(validDraft).run(),
      right<Failure, Trip>(testTrip),
    );
    expect(
      await repository.updateTrip(testTrip.id, validDraft).run(),
      right<Failure, Trip>(testTrip),
    );
  });

  test('changeStatus maps RLS violations to unauthorized', () async {
    when(() => remote.updateStatus(any(), any()))
        .thenThrow(const PostgrestException(message: 'denied', code: '42501'));

    final result = await repository
        .changeStatus(testTrip.id, TripStatus.archived)
        .run();

    expect(result, left<Failure, Trip>(const Failure.unauthorized()));
  });

  test('setCover maps storage errors', () async {
    when(() => remote.replaceCover(any(), any()))
        .thenThrow(const StorageException('too large', statusCode: '413'));

    final result = await repository.setCover(testTrip, testImage).run();

    expect(
      result,
      left<Failure, Trip>(
        const Failure.server(message: 'too large', code: '413'),
      ),
    );
  });
}
