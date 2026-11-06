/// Comparison key for names and emails: lowercase, no accents, single
/// spaces. Mirrors `public.person_key` in the database.
String personKey(String? value) {
  final collapsed = (value ?? '').trim().replaceAll(RegExp(r'\s+'), ' ');
  final buffer = StringBuffer();
  for (final rune in collapsed.runes) {
    final char = String.fromCharCode(rune);
    buffer.write(_plain[char] ?? char);
  }
  return buffer.toString().toLowerCase();
}

const Map<String, String> _plain = {
  'Á': 'A', 'À': 'A', 'Ä': 'A', 'Â': 'A', //
  'É': 'E', 'È': 'E', 'Ë': 'E', 'Ê': 'E', //
  'Í': 'I', 'Ì': 'I', 'Ï': 'I', 'Î': 'I', //
  'Ó': 'O', 'Ò': 'O', 'Ö': 'O', 'Ô': 'O', //
  'Ú': 'U', 'Ù': 'U', 'Ü': 'U', 'Û': 'U', //
  'Ñ': 'N', 'Ç': 'C', //
  'á': 'a', 'à': 'a', 'ä': 'a', 'â': 'a', //
  'é': 'e', 'è': 'e', 'ë': 'e', 'ê': 'e', //
  'í': 'i', 'ì': 'i', 'ï': 'i', 'î': 'i', //
  'ó': 'o', 'ò': 'o', 'ö': 'o', 'ô': 'o', //
  'ú': 'u', 'ù': 'u', 'ü': 'u', 'û': 'u', //
  'ñ': 'n', 'ç': 'c',
};
