import 'package:aris_admin/features/trips/data/models/trip_model.dart';
import 'package:aris_admin/features/trips/domain/entities/trip_status.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/trips_fakes.dart';

void main() {
  test('reads a trips row', () {
    final model = TripModel.fromJson({
      'id': 'abc',
      'name': 'Cancún',
      'destination': 'Cancún, Q. Roo',
      'description': null,
      'cover_path': 'trips/abc/cover-1.jpg',
      'start_date': '2027-03-20',
      'end_date': '2027-03-25',
      'status': 'published',
    });

    final trip = model.toEntity(coverUrl: 'https://cdn/x.jpg');

    expect(trip.startDate, DateTime(2027, 3, 20));
    expect(trip.endDate, DateTime(2027, 3, 25));
    expect(trip.status, TripStatus.published);
    expect(trip.coverPath, 'trips/abc/cover-1.jpg');
    expect(trip.coverUrl, 'https://cdn/x.jpg');
  });

  test('writes only editable columns with date-only values', () {
    final json = TripModel.draftToJson(
      validDraft.copyWith(status: TripStatus.published),
    );

    expect(json, {
      'name': 'Mérida',
      'destination': 'Mérida, Yucatán',
      'description': null,
      'start_date': '2027-01-10',
      'end_date': '2027-01-15',
      'status': 'published',
    });
  });

  test('never selects access hashes', () {
    expect(TripModel.columns, isNot(contains('hash')));
  });

  test('unknown status fails loudly', () {
    expect(() => TripStatus.fromValue('deleted'), throwsArgumentError);
  });
}
