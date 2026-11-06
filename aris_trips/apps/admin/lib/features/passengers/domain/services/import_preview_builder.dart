import '../../../../core/text/person_key.dart';
import '../entities/booking.dart';
import '../entities/passenger_draft.dart';
import '../entities/passenger_import.dart';

/// Turns a decoded CSV table into a validated import preview.
abstract final class ImportPreviewBuilder {
  /// Accepted header names (compared with [personKey], `_` and `-` as
  /// spaces). Spanish first, English also accepted.
  static const Map<ImportColumn, Set<String>> headers = {
    ImportColumn.firstName: {'nombre', 'nombres', 'first name', 'firstname'},
    ImportColumn.lastName: {
      'apellido',
      'apellidos',
      'last name',
      'lastname',
      'surname',
    },
    ImportColumn.email: {
      'correo',
      'correo electronico',
      'email',
      'e mail',
      'mail',
    },
    ImportColumn.phone: {
      'telefono',
      'celular',
      'movil',
      'whatsapp',
      'phone',
      'mobile',
    },
  };

  static const Set<ImportColumn> required = {
    ImportColumn.firstName,
    ImportColumn.lastName,
  };

  static ImportPreview build(
    List<List<String>> table, {
    required List<Booking> existing,
  }) {
    if (table.isEmpty) {
      return const ImportPreview(missingColumns: required);
    }

    final columns = <ImportColumn, int>{};
    final header = table.first;
    for (var i = 0; i < header.length; i++) {
      final name = personKey(header[i].replaceAll(RegExp('[_-]'), ' '));
      for (final MapEntry(key: column, value: names) in headers.entries) {
        if (names.contains(name)) columns.putIfAbsent(column, () => i);
      }
    }
    final missing = required.difference(columns.keys.toSet());
    if (missing.isNotEmpty) return ImportPreview(missingColumns: missing);

    String cell(List<String> row, ImportColumn column) {
      final index = columns[column];
      return index == null || index >= row.length ? '' : row[index];
    }

    final onTrip = {
      for (final booking in existing) booking.passenger.toDraft().identityKey,
    };
    final seen = <String>{};
    final rows = <ImportRow>[];

    for (var i = 1; i < table.length; i++) {
      final raw = table[i];
      if (raw.every((value) => value.trim().isEmpty)) continue;

      final draft = PassengerDraft(
        firstName: cell(raw, ImportColumn.firstName),
        lastName: cell(raw, ImportColumn.lastName),
        email: cell(raw, ImportColumn.email),
        phone: cell(raw, ImportColumn.phone),
      ).normalized();

      final issues = <ImportIssue>{
        for (final issue in draft.issues)
          switch (issue) {
            PassengerDraftIssue.firstNameRequired =>
              ImportIssue.firstNameRequired,
            PassengerDraftIssue.lastNameRequired =>
              ImportIssue.lastNameRequired,
            PassengerDraftIssue.emailInvalid => ImportIssue.emailInvalid,
          },
      };
      if (draft.isValid) {
        final key = draft.identityKey;
        // Without email the reuse rule never applies, so only an email
        // match with the same name counts as "already on the trip".
        if (draft.email.isNotEmpty && onTrip.contains(key)) {
          issues.add(ImportIssue.alreadyInTrip);
        } else if (!seen.add(key)) {
          issues.add(ImportIssue.duplicateInFile);
        }
      }
      rows.add(ImportRow(line: i + 1, draft: draft, issues: issues));
    }
    return ImportPreview(rows: rows);
  }
}
