import 'package:aris_admin/core/format/date_formats.dart';
import 'package:aris_admin/core/format/zoned_formats.dart';
import 'package:aris_admin/core/time/time_zones.dart';
import 'package:aris_admin/core/time/zoned_time.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  setUpAll(() => initializeDateFormatting(DateFormats.locale));

  group('ZonedTime', () {
    test('wall time in Cancún (UTC-5, no DST) to instant and back', () {
      final instant = ZonedTime.toInstant(
        DateTime(2027, 3, 20, 11, 15),
        'America/Cancun',
      );
      expect(instant, DateTime.utc(2027, 3, 20, 16, 15));
      expect(
        ZonedTime.toWallTime(instant, 'America/Cancun'),
        DateTime(2027, 3, 20, 11, 15),
      );
    });

    test('Mexico City no longer observes DST (UTC-6 all year)', () {
      expect(
        ZonedTime.offset(DateTime.utc(2027, 1, 15), 'America/Mexico_City'),
        const Duration(hours: -6),
      );
      expect(
        ZonedTime.offset(DateTime.utc(2027, 7, 15), 'America/Mexico_City'),
        const Duration(hours: -6),
      );
    });

    test('Tijuana follows US DST', () {
      expect(
        ZonedTime.offsetLabel(DateTime.utc(2027, 1, 15), 'America/Tijuana'),
        'GMT-8',
      );
      expect(
        ZonedTime.offsetLabel(DateTime.utc(2027, 7, 15), 'America/Tijuana'),
        'GMT-7',
      );
      // 14 Mar 2027 02:30 does not exist in Tijuana: it moves forward.
      final skipped = ZonedTime.toInstant(
        DateTime(2027, 3, 14, 2, 30),
        'America/Tijuana',
      );
      expect(ZonedTime.toWallTime(skipped, 'America/Tijuana').hour, 3);
    });

    test('the phone zone is never used', () {
      final a = ZonedTime.toInstant(DateTime(2027, 5, 1, 9), 'Asia/Tokyo');
      final b = ZonedTime.toInstant(DateTime.utc(2027, 5, 1, 9), 'Asia/Tokyo');
      expect(a, b);
      expect(a, DateTime.utc(2027, 5, 1));
    });

    test('half-hour offsets', () {
      expect(
        ZonedTime.offsetLabel(DateTime.utc(2027, 1, 1), 'Asia/Kolkata'),
        'GMT+5:30',
      );
      expect(
        ZonedTime.offsetLabel(DateTime.utc(2027, 1, 1), 'Europe/London'),
        'GMT',
      );
    });
  });

  group('TimeZones', () {
    test('validates names', () {
      expect(TimeZones.isValid('America/Cancun'), isTrue);
      expect(TimeZones.isValid('Mexico/Not_A_Zone'), isFalse);
    });

    test('lists Mexico first and skips Etc zones', () {
      final zones = TimeZones.all();
      expect(zones.first, startsWith('America/'));
      expect(
        zones.indexOf('America/Mexico_City'),
        lessThan(zones.indexOf('Africa/Abidjan')),
      );
      expect(zones.where((z) => z.startsWith('Etc/')), isEmpty);
      expect(zones, contains(TimeZones.defaultZone));
    });
  });

  group('ZonedFormats', () {
    final departs = DateTime.utc(2027, 3, 20, 14); // 08:00 in CDMX

    test('formats in the place time', () {
      expect(ZonedFormats.time(departs, 'America/Mexico_City'), '08:00');
      expect(
        ZonedFormats.timeWithOffset(departs, 'America/Mexico_City'),
        '08:00 GMT-6',
      );
      expect(
        ZonedFormats.dateTime(departs, 'America/Cancun'),
        '20 mar 2027, 09:00',
      );
    });

    test('durations', () {
      expect(ZonedFormats.duration(const Duration(minutes: 135)), '2 h 15 min');
      expect(ZonedFormats.duration(const Duration(minutes: 45)), '45 min');
      expect(ZonedFormats.duration(const Duration(hours: 3)), '3 h');
    });

    test('zone names', () {
      expect(
        ZonedFormats.zoneName('America/Mexico_City'),
        'Mexico City (America)',
      );
    });
  });
}
