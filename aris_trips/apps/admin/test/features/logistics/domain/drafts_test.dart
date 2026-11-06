import 'package:aris_admin/features/logistics/domain/entities/flight_draft.dart';
import 'package:aris_admin/features/logistics/domain/entities/itinerary_draft.dart';
import 'package:aris_admin/features/logistics/domain/entities/lodging_draft.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/logistics_fakes.dart';

void main() {
  group('FlightDraft', () {
    test('valid draft converts wall times with each airport zone', () {
      expect(validFlightDraft.isValid, isTrue);
      expect(validFlightDraft.departsAt, DateTime.utc(2027, 3, 20, 14));
      expect(validFlightDraft.arrivesAt, DateTime.utc(2027, 3, 20, 16, 15));
    });

    test('empty draft lists the required fields', () {
      expect(const FlightDraft().issues, {
        FlightDraftIssue.airlineRequired,
        FlightDraftIssue.flightNumberRequired,
        FlightDraftIssue.originRequired,
        FlightDraftIssue.destinationRequired,
        FlightDraftIssue.departureRequired,
        FlightDraftIssue.arrivalRequired,
      });
    });

    test('a westbound flight landing "earlier" on the clock is valid', () {
      // CUN 10:00 (UTC-5) → TIJ 10:30 (UTC-7 in July): 2 h 30 min.
      final draft = validFlightDraft.copyWith(
        departsLocal: DateTime(2027, 7, 1, 10),
        departureTz: 'America/Cancun',
        arrivesLocal: DateTime(2027, 7, 1, 10, 30),
        arrivalTz: 'America/Tijuana',
      );
      expect(draft.isValid, isTrue);
      expect(
        draft.arrivesAt!.difference(draft.departsAt!),
        const Duration(hours: 2, minutes: 30),
      );
    });

    test('arrival before departure as instants is rejected', () {
      final draft = validFlightDraft.copyWith(
        arrivesLocal: DateTime(2027, 3, 20, 8),
        arrivalTz: 'America/Mexico_City',
      );
      expect(draft.issues, {FlightDraftIssue.arrivalNotAfterDeparture});
    });

    test('invalid zones are reported', () {
      final draft = validFlightDraft.copyWith(departureTz: 'Mars/Olympus');
      expect(draft.issues, contains(FlightDraftIssue.departureTzInvalid));
    });

    test('normalized uppercases codes and trims', () {
      final draft = validFlightDraft
          .copyWith(airline: ' Aeroméxico ', terminal: '  ')
          .normalized();
      expect(draft.flightNumber, 'AM 523');
      expect(draft.origin, 'MEX');
      expect(draft.airline, 'Aeroméxico');
      expect(draft.terminal, '');
    });

    test('a flight converts back to the same wall times', () {
      final draft = testFlight.toDraft();
      expect(draft.departsLocal, DateTime(2027, 3, 20, 8));
      expect(draft.arrivesLocal, DateTime(2027, 3, 20, 11, 15));
      expect(draft.terminal, 'T2');
    });
  });

  group('LodgingDraft', () {
    test('valid without coordinates', () {
      expect(validLodgingDraft.isValid, isTrue);
      expect(validLodgingDraft.checkInAt, DateTime.utc(2027, 3, 20, 20));
    });

    test('check-out must be after check-in', () {
      final draft = validLodgingDraft.copyWith(
        checkOutLocal: DateTime(2027, 3, 20, 15),
      );
      expect(draft.issues, {LodgingDraftIssue.checkOutNotAfterCheckIn});
    });

    test('coordinates accept a decimal comma and check ranges', () {
      final ok = validLodgingDraft.copyWith(
        latitude: '21,0945',
        longitude: '-86.7673',
      );
      expect(ok.isValid, isTrue);
      expect(ok.latitudeValue, 21.0945);

      final bad = validLodgingDraft.copyWith(latitude: '95', longitude: 'abc');
      expect(bad.issues, {
        LodgingDraftIssue.latitudeInvalid,
        LodgingDraftIssue.longitudeInvalid,
      });
    });

    test('both coordinates or neither', () {
      final draft = validLodgingDraft.copyWith(latitude: '21.09');
      expect(draft.issues, {LodgingDraftIssue.coordinatesIncomplete});
    });

    test('a lodging converts back to text coordinates', () {
      final draft = testLodging.toDraft();
      expect(draft.latitude, '21.0945');
      expect(draft.checkInLocal, DateTime(2027, 3, 20, 15));
    });
  });

  group('ItineraryDraft', () {
    test('valid without end', () {
      expect(validItineraryDraft.isValid, isTrue);
      expect(validItineraryDraft.endsAt, isNull);
    });

    test('end before start is rejected, same time is allowed', () {
      expect(
        validItineraryDraft
            .copyWith(endsLocal: DateTime(2027, 3, 21, 8))
            .issues,
        {ItineraryDraftIssue.endBeforeStart},
      );
      expect(
        validItineraryDraft
            .copyWith(endsLocal: DateTime(2027, 3, 21, 9))
            .isValid,
        isTrue,
      );
    });

    test('title and start are required', () {
      expect(const ItineraryDraft().issues, {
        ItineraryDraftIssue.titleRequired,
        ItineraryDraftIssue.startRequired,
      });
    });

    test('items without booking apply to the group', () {
      expect(testItem.isForGroup, isTrue);
      expect(testItem.toDraft().endsLocal, DateTime(2027, 3, 21, 17));
    });
  });
}
