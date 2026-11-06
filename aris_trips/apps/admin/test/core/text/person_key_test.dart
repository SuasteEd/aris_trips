import 'package:aris_admin/core/text/person_key.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('matches the database person_key', () {
    // Same input as the pgTAP test of public.person_key.
    expect(personKey('  José   ÑÚÑEZ '), 'jose nunez');
    expect(personKey(null), '');
    expect(personKey('López'), personKey('LOPEZ'));
  });
}
