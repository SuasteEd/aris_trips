import 'package:aris_admin/core/error/failure.dart';
import 'package:aris_admin/features/logistics/data/datasources/logistics_remote_data_source.dart';
import 'package:aris_admin/features/logistics/data/models/logistics_models.dart';
import 'package:aris_admin/features/logistics/data/repositories/logistics_repositories_impl.dart';
import 'package:aris_admin/features/logistics/domain/entities/flight.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../helpers/logistics_fakes.dart';

final flightRow = {
  'id': 'f1',
  'trip_id': tripId,
  'airline': 'Aeroméxico',
  'flight_number': 'AM 523',
  'origin': 'MEX',
  'destination': 'CUN',
  'departs_at': '2027-03-20T14:00:00+00:00',
  'departure_tz': 'America/Mexico_City',
  'arrives_at': '2027-03-20T16:15:00+00:00',
  'arrival_tz': 'America/Cancun',
  'terminal': 'T2',
};

void main() {
  setUpAll(registerLogisticsFallbacks);

  group('models', () {
    test('flight row with offset timestamps becomes UTC instants', () {
      final flight = FlightModel.fromJson(flightRow).toEntity();
      expect(flight, testFlight);
      expect(flight.departsAt.isUtc, isTrue);
    });

    test('flight payload sends UTC instants and the zones', () {
      final json = FlightModel.draftToJson(validFlightDraft.normalized());
      expect(json['departs_at'], '2027-03-20T14:00:00.000Z');
      expect(json['arrives_at'], '2027-03-20T16:15:00.000Z');
      expect(json['departure_tz'], 'America/Mexico_City');
      expect(json['terminal'], isNull);
      expect(json.containsKey('trip_id'), isFalse);
    });

    test('lodging numeric coordinates may come as integers', () {
      final lodging = LodgingModel.fromJson({
        'id': 'l1',
        'trip_id': tripId,
        'name': 'Hotel',
        'address': null,
        'latitude': 21,
        'longitude': -86.5,
        'check_in_at': '2027-03-20T20:00:00+00:00',
        'check_out_at': '2027-03-25T17:00:00+00:00',
        'timezone': 'America/Cancun',
      }).toEntity();
      expect(lodging.latitude, 21.0);
    });

    test('lodging payload parses coordinates from text', () {
      final json = LodgingModel.draftToJson(
        validLodgingDraft.copyWith(latitude: '21,5', longitude: '-86.7'),
      );
      expect(json['latitude'], 21.5);
      expect(json['longitude'], -86.7);
      expect(json['address'], isNull);
    });

    test('itinerary payload: null booking means the whole group', () {
      final json = ItineraryItemModel.draftToJson(validItineraryDraft);
      expect(json['booking_id'], isNull);
      expect(
        ItineraryItemModel.draftToJson(
          validItineraryDraft.copyWith(bookingId: 'b1'),
        )['booking_id'],
        'b1',
      );
      expect(json['ends_at'], isNull);
      expect(json['starts_at'], '2027-03-21T14:00:00.000Z');
    });

    test('no table reads access hashes', () {
      for (final table in LogisticsTable.values) {
        expect(table.columns, isNot(contains('hash')));
      }
    });
  });

  group('FlightsRepositoryImpl', () {
    late MockLogisticsRemoteDataSource remote;
    late FlightsRepositoryImpl repository;

    setUp(() {
      remote = MockLogisticsRemoteDataSource();
      repository = FlightsRepositoryImpl(remote);
    });

    test('lists the trip flights', () async {
      when(() => remote.list(table: LogisticsTable.flights, tripId: tripId))
          .thenAnswer((_) async => [flightRow]);

      final result = await repository.getFlights(tripId).run();

      expect(result.getOrElse((_) => []), [testFlight]);
    });

    test('creates with trip id and the payload', () async {
      when(
        () => remote.insert(
          table: any(named: 'table'),
          tripId: any(named: 'tripId'),
          values: any(named: 'values'),
        ),
      ).thenAnswer((_) async => flightRow);

      await repository
          .createFlight(tripId, validFlightDraft.normalized())
          .run();

      verify(
        () => remote.insert(
          table: LogisticsTable.flights,
          tripId: tripId,
          values: FlightModel.draftToJson(validFlightDraft.normalized()),
        ),
      ).called(1);
    });

    test('maps a database check violation to a server failure', () async {
      when(
        () => remote.update(
          table: any(named: 'table'),
          id: any(named: 'id'),
          values: any(named: 'values'),
        ),
      ).thenThrow(const PostgrestException(message: 'check', code: '23514'));

      final result = await repository
          .updateFlight('f1', validFlightDraft.normalized())
          .run();

      expect(
        result,
        left<Failure, Flight>(
          const Failure.server(message: 'check', code: '23514'),
        ),
      );
    });

    test('delete hidden by RLS is not found', () async {
      when(
        () => remote.delete(
          table: any(named: 'table'),
          id: any(named: 'id'),
        ),
      ).thenThrow(
        const PostgrestException(message: 'no rows', code: 'PGRST116'),
      );

      final result = await repository.deleteFlight('f1').run();

      expect(result, left<Failure, Unit>(const Failure.notFound()));
    });
  });
}
