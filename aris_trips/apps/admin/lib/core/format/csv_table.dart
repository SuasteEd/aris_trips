import 'dart:convert';
import 'dart:typed_data';

/// Minimal RFC 4180 reader: quoted fields, escaped quotes (""), line breaks
/// inside quotes and CRLF. Detects `,`, `;` or tab as separator (Excel in
/// Spanish exports with `;`) and accepts UTF-8 (with or without BOM) or
/// Latin-1.
abstract final class CsvTable {
  static List<List<String>> decodeBytes(Uint8List bytes) =>
      parse(decodeText(bytes));

  static String decodeText(Uint8List bytes) {
    var data = bytes;
    if (data.length >= 3 &&
        data[0] == 0xEF &&
        data[1] == 0xBB &&
        data[2] == 0xBF) {
      data = Uint8List.sublistView(data, 3);
    }
    try {
      return utf8.decode(data);
    } on FormatException {
      return latin1.decode(data);
    }
  }

  static List<List<String>> parse(String text) {
    final separator = _detectSeparator(text);
    final rows = <List<String>>[];
    var row = <String>[];
    final field = StringBuffer();
    var inQuotes = false;
    var i = 0;

    void endField() {
      row.add(field.toString());
      field.clear();
    }

    void endRow() {
      endField();
      rows.add(row);
      row = <String>[];
    }

    while (i < text.length) {
      final char = text[i];
      if (inQuotes) {
        if (char == '"') {
          if (i + 1 < text.length && text[i + 1] == '"') {
            field.write('"');
            i++;
          } else {
            inQuotes = false;
          }
        } else {
          field.write(char);
        }
      } else if (char == '"' && field.isEmpty) {
        inQuotes = true;
      } else if (char == separator) {
        endField();
      } else if (char == '\r') {
        if (i + 1 < text.length && text[i + 1] == '\n') i++;
        endRow();
      } else if (char == '\n') {
        endRow();
      } else {
        field.write(char);
      }
      i++;
    }
    if (field.isNotEmpty || row.isNotEmpty) endRow();
    return rows;
  }

  /// Most frequent candidate in the first line, outside quotes.
  static String _detectSeparator(String text) {
    final counts = {',': 0, ';': 0, '\t': 0};
    var inQuotes = false;
    for (final char in text.split('')) {
      if (char == '"') inQuotes = !inQuotes;
      if (!inQuotes && (char == '\n' || char == '\r')) break;
      if (!inQuotes && counts.containsKey(char)) {
        counts[char] = counts[char]! + 1;
      }
    }
    final best = counts.entries.reduce((a, b) => b.value > a.value ? b : a);
    return best.value == 0 ? ',' : best.key;
  }
}
