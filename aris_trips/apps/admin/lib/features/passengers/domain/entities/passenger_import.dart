import 'package:freezed_annotation/freezed_annotation.dart';

import 'passenger_draft.dart';

part 'passenger_import.freezed.dart';

enum ImportColumn { firstName, lastName, email, phone }

enum ImportIssue {
  firstNameRequired,
  lastNameRequired,
  emailInvalid,
  duplicateInFile,
  alreadyInTrip,
}

@freezed
abstract class ImportRow with _$ImportRow {
  const factory ImportRow({
    /// Line in the file (header is line 1).
    required int line,
    required PassengerDraft draft,
    @Default({}) Set<ImportIssue> issues,
  }) = _ImportRow;

  const ImportRow._();

  bool get isValid => issues.isEmpty;
}

@freezed
abstract class ImportPreview with _$ImportPreview {
  const factory ImportPreview({
    @Default([]) List<ImportRow> rows,

    /// Required columns not found in the header.
    @Default({}) Set<ImportColumn> missingColumns,
  }) = _ImportPreview;

  const ImportPreview._();

  List<ImportRow> get validRows => rows.where((r) => r.isValid).toList();

  int get invalidCount => rows.length - validRows.length;

  bool get canImport => missingColumns.isEmpty && validRows.isNotEmpty;
}

@freezed
abstract class ImportResult with _$ImportResult {
  const factory ImportResult({required int created, required int reused}) =
      _ImportResult;

  const ImportResult._();

  int get total => created + reused;
}
