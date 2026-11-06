import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

/// IANA time zones. Pure Dart so the domain can use it.
abstract final class TimeZones {
  static const String defaultZone = 'America/Mexico_City';

  static bool _initialized = false;

  /// Loads the IANA database once. Safe to call repeatedly.
  static void ensureInitialized() {
    if (_initialized) return;
    tz_data.initializeTimeZones();
    _initialized = true;
  }

  static bool isValid(String name) {
    ensureInitialized();
    return tz.timeZoneDatabase.locations.containsKey(name);
  }

  /// Region/City zones, Mexico first, then alphabetical.
  static List<String> all() {
    ensureInitialized();
    final names = tz.timeZoneDatabase.locations.keys
        .where((name) => name.contains('/') && !name.startsWith('Etc/'))
        .toList();
    bool isMexico(String name) => _mexico.contains(name);
    names.sort((a, b) {
      final byCountry = (isMexico(a) ? 0 : 1).compareTo(isMexico(b) ? 0 : 1);
      return byCountry != 0 ? byCountry : a.compareTo(b);
    });
    return names;
  }

  static const Set<String> _mexico = {
    'America/Mexico_City',
    'America/Cancun',
    'America/Merida',
    'America/Monterrey',
    'America/Matamoros',
    'America/Chihuahua',
    'America/Ciudad_Juarez',
    'America/Ojinaga',
    'America/Mazatlan',
    'America/Bahia_Banderas',
    'America/Hermosillo',
    'America/Tijuana',
  };
}
