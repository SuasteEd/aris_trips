import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

class PickedFile {
  const PickedFile({required this.name, required this.bytes});

  final String name;
  final Uint8List bytes;
}

abstract interface class FilePickerService {
  /// Null when the admin cancels. Files over [maxBytes] are rejected with
  /// [FileTooLargeException] before reading them.
  Future<PickedFile?> pickCsv({required int maxBytes});
}

class FileTooLargeException implements Exception {
  const FileTooLargeException();
}

@LazySingleton(as: FilePickerService)
class DeviceFilePickerService implements FilePickerService {
  @override
  Future<PickedFile?> pickCsv({required int maxBytes}) async {
    final file = await FilePicker.pickFile(
      type: FileType.custom,
      allowedExtensions: const ['csv', 'txt'],
    );
    if (file == null) return null;
    final length = await file.length();
    if (length != null && length > maxBytes) {
      throw const FileTooLargeException();
    }
    final bytes = await file.readAsBytes();
    if (bytes.length > maxBytes) throw const FileTooLargeException();
    return PickedFile(name: file.name, bytes: bytes);
  }
}
