import 'dart:typed_data';

import 'package:aris_admin/core/error/failure.dart';
import 'package:aris_admin/features/trips/domain/entities/cover_image.dart';
import 'package:aris_admin/features/trips/domain/entities/trip.dart';
import 'package:aris_admin/features/trips/domain/entities/trip_status.dart';
import 'package:aris_admin/features/trips/domain/entities/trips_query.dart';
import 'package:aris_admin/features/trips/domain/usecases/change_trip_status.dart';
import 'package:aris_admin/features/trips/domain/usecases/get_trips.dart';
import 'package:aris_admin/features/trips/domain/usecases/save_trip.dart';
import 'package:aris_admin/features/trips/domain/usecases/set_trip_cover.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/trips_fakes.dart';

void main() {
  late MockTripsRepository repository;

  setUpAll(registerTripsFallbacks);
  setUp(() => repository = MockTripsRepository());

  group('GetTrips', () {
    test('trims the search text', () async {
      when(() => repository.getTrips(any()))
          .thenReturn(TaskEither.right(const []));

      await GetTrips(repository)(const TripsQuery(search: '  cancún ')).run();

      verify(() => repository.getTrips(const TripsQuery(search: 'cancún')))
          .called(1);
    });
  });

  group('SaveTrip', () {
    test('rejects an invalid draft without calling the repository', () async {
      final result = await SaveTrip(repository)(validDraft.copyWith(name: ' '))
          .run();

      expect(result, left<Failure, Trip>(const Failure.invalidInput()));
      verifyZeroInteractions(repository);
    });

    test('creates when there is no id, with a normalized draft', () async {
      when(() => repository.createTrip(any()))
          .thenReturn(TaskEither.right(testTrip));

      await SaveTrip(repository)(validDraft.copyWith(name: ' Mérida ')).run();

      verify(() => repository.createTrip(validDraft.copyWith(name: 'Mérida')))
          .called(1);
    });

    test('updates when an id is given', () async {
      when(() => repository.updateTrip(any(), any()))
          .thenReturn(TaskEither.right(testTrip));

      await SaveTrip(repository)(validDraft, id: testTrip.id).run();

      verify(() => repository.updateTrip(testTrip.id, validDraft)).called(1);
    });
  });

  group('ChangeTripStatus', () {
    test('skips the repository when the status does not change', () async {
      final result = await ChangeTripStatus(repository)(
        testTrip,
        testTrip.status,
      ).run();

      expect(result, right<Failure, Trip>(testTrip));
      verifyZeroInteractions(repository);
    });

    test('changes the status', () async {
      final archived = testTrip.copyWith(status: TripStatus.archived);
      when(() => repository.changeStatus(any(), any()))
          .thenReturn(TaskEither.right(archived));

      final result = await ChangeTripStatus(repository)(
        testTrip,
        TripStatus.archived,
      ).run();

      expect(result, right<Failure, Trip>(archived));
    });
  });

  group('SetTripCover', () {
    test('rejects types the bucket does not accept', () async {
      final gif = CoverImage(bytes: Uint8List(1), contentType: 'image/gif');

      final result = await SetTripCover(repository)(testTrip, gif).run();

      expect(result, left<Failure, Trip>(const Failure.invalidInput()));
      verifyZeroInteractions(repository);
    });

    test('rejects images over 5 MB', () async {
      final big = CoverImage(
        bytes: Uint8List(SetTripCover.maxBytes + 1),
        contentType: 'image/jpeg',
      );

      final result = await SetTripCover(repository)(testTrip, big).run();

      expect(result, left<Failure, Trip>(const Failure.invalidInput()));
    });

    test('uploads a valid image', () async {
      when(() => repository.setCover(any(), any()))
          .thenReturn(TaskEither.right(testTrip));

      await SetTripCover(repository)(testTrip, testImage).run();

      verify(() => repository.setCover(testTrip, testImage)).called(1);
    });
  });
}
