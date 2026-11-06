import 'package:aris_admin/core/format/date_formats.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  setUpAll(() => initializeDateFormatting(DateFormats.locale));

  test('single date', () {
    expect(DateFormats.date(DateTime(2027, 3, 20)), '20 mar 2027');
  });

  test('ranges collapse shared month and year', () {
    expect(
      DateFormats.range(DateTime(2027, 3, 20), DateTime(2027, 3, 25)),
      '20–25 mar 2027',
    );
    expect(
      DateFormats.range(DateTime(2027, 3, 28), DateTime(2027, 4, 2)),
      '28 mar – 2 abr 2027',
    );
    expect(
      DateFormats.range(DateTime(2026, 12, 30), DateTime(2027, 1, 3)),
      '30 dic 2026 – 3 ene 2027',
    );
    expect(
      DateFormats.range(DateTime(2027, 3, 20), DateTime(2027, 3, 20)),
      '20 mar 2027',
    );
  });
}
