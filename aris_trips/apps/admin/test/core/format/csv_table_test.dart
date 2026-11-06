import 'dart:convert';
import 'dart:typed_data';

import 'package:aris_admin/core/format/csv_table.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('commas, quotes, escaped quotes and line breaks in quotes', () {
    final rows = CsvTable.parse(
      'nombre,apellido,notas\r\n'
      'Ana,"López, Pérez","dice ""hola""\nmucho"\r\n'
      'Luis,Martínez,\n',
    );
    expect(rows, [
      ['nombre', 'apellido', 'notas'],
      ['Ana', 'López, Pérez', 'dice "hola"\nmucho'],
      ['Luis', 'Martínez', ''],
    ]);
  });

  test('detects semicolons (Excel in Spanish)', () {
    expect(CsvTable.parse('nombre;apellido\nAna;López'), [
      ['nombre', 'apellido'],
      ['Ana', 'López'],
    ]);
  });

  test('detects tabs', () {
    expect(CsvTable.parse('a\tb\n1\t2'), [
      ['a', 'b'],
      ['1', '2'],
    ]);
  });

  test('UTF-8 with BOM', () {
    final bytes = Uint8List.fromList([
      0xEF,
      0xBB,
      0xBF,
      ...utf8.encode('nombre\nJosé'),
    ]);
    expect(CsvTable.decodeBytes(bytes), [
      ['nombre'],
      ['José'],
    ]);
  });

  test('falls back to Latin-1', () {
    final bytes = Uint8List.fromList(latin1.encode('nombre\nJosé Núñez'));
    expect(CsvTable.decodeBytes(bytes).last, ['José Núñez']);
  });

  test('empty input', () {
    expect(CsvTable.parse(''), isEmpty);
  });
}
