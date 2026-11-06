import 'package:aris_admin/features/trips/domain/entities/trip_draft.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/trips_fakes.dart';

void main() {
  test('an empty draft reports every required field', () {
    expect(const TripDraft().issues, {
      TripDraftIssue.nameRequired,
      TripDraftIssue.destinationRequired,
      TripDraftIssue.startDateRequired,
      TripDraftIssue.endDateRequired,
    });
  });

  test('whitespace-only text is missing', () {
    final draft = validDraft.copyWith(name: '   ', destination: '\n');
    expect(draft.issues, {
      TripDraftIssue.nameRequired,
      TripDraftIssue.destinationRequired,
    });
  });

  test('end before start is rejected, same day is allowed', () {
    expect(validDraft.copyWith(endDate: DateTime(2027, 1, 9)).issues, {
      TripDraftIssue.endBeforeStart,
    });
    expect(
      validDraft
          .copyWith(
            startDate: DateTime(2027, 1, 10, 23),
            endDate: DateTime(2027, 1, 10, 1),
          )
          .isValid,
      isTrue,
    );
  });

  test('normalized trims text, drops empty description and time', () {
    final draft = validDraft
        .copyWith(
          name: '  Mérida ',
          description: '   ',
          startDate: DateTime(2027, 1, 10, 18, 30),
        )
        .normalized();

    expect(draft.name, 'Mérida');
    expect(draft.description, isNull);
    expect(draft.startDate, DateTime(2027, 1, 10));
  });

  test('a trip converts back to an equal draft', () {
    final draft = testTrip.toDraft();
    expect(draft.name, testTrip.name);
    expect(draft.startDate, testTrip.startDate);
    expect(draft.status, testTrip.status);
  });
}
