import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/format/csv_table.dart';
import '../../../../core/media/file_picker_service.dart';
import '../../domain/entities/booking.dart';
import '../../domain/entities/passenger_import.dart';
import '../../domain/usecases/passenger_usecases.dart';

part 'import_cubit.freezed.dart';

enum ImportFileError { tooLarge, unreadable, empty }

@freezed
sealed class ImportState with _$ImportState {
  /// Waiting for a file. [fileError] explains why the last one failed.
  const factory ImportState.idle({ImportFileError? fileError}) = ImportIdle;

  const factory ImportState.reading() = ImportReading;

  const factory ImportState.preview(
    ImportPreview preview, {
    @Default(false) bool importing,
    Failure? failure,
  }) = ImportPreviewing;

  const factory ImportState.done(ImportResult result) = ImportDone;
}

@injectable
class ImportCubit extends Cubit<ImportState> {
  ImportCubit(this._files, this._getBookings, this._preview, this._import)
    : super(const ImportState.idle());

  final FilePickerService _files;
  final GetBookings _getBookings;
  final BuildImportPreview _preview;
  final ImportPassengers _import;

  late String _tripId;

  static const int maxBytes = 1024 * 1024;

  void configure(String tripId) => _tripId = tripId;

  Future<void> pickFile() async {
    final previous = state;
    if (previous is ImportReading) return;
    emit(const ImportState.reading());
    try {
      final file = await _files.pickCsv(maxBytes: maxBytes);
      if (file == null) {
        // Cancelled: keep what was on screen.
        emit(previous is ImportDone ? const ImportState.idle() : previous);
        return;
      }
      final table = CsvTable.decodeBytes(file.bytes);
      if (table.isEmpty) {
        emit(const ImportState.idle(fileError: ImportFileError.empty));
        return;
      }
      // Bookings already on the trip mark rows that would be duplicates.
      final existing = await _getBookings(_tripId).run();
      if (isClosed) return;
      existing.match(
        (failure) => emit(
          ImportState.preview(
            _preview(table, existing: const <Booking>[]),
            failure: failure,
          ),
        ),
        (bookings) =>
            emit(ImportState.preview(_preview(table, existing: bookings))),
      );
    } on FileTooLargeException {
      emit(const ImportState.idle(fileError: ImportFileError.tooLarge));
    } catch (_) {
      emit(const ImportState.idle(fileError: ImportFileError.unreadable));
    }
  }

  Future<void> submit() async {
    final current = state;
    if (current is! ImportPreviewing ||
        current.importing ||
        !current.preview.canImport) {
      return;
    }
    emit(current.copyWith(importing: true, failure: null));
    final result = await _import(_tripId, current.preview).run();
    if (isClosed) return;
    emit(
      result.match(
        (failure) => current.copyWith(importing: false, failure: failure),
        ImportState.done,
      ),
    );
  }
}
