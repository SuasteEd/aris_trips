import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

class PickedImage {
  const PickedImage({required this.bytes, required this.contentType});

  final Uint8List bytes;
  final String contentType;
}

/// Picks an image from the gallery, resized and recompressed on device.
abstract interface class ImagePickerService {
  /// Null when the admin cancels.
  Future<PickedImage?> pickFromGallery({double maxWidth = 1600});
}

@LazySingleton(as: ImagePickerService)
class DeviceImagePickerService implements ImagePickerService {
  DeviceImagePickerService() : _picker = ImagePicker();

  final ImagePicker _picker;

  @override
  Future<PickedImage?> pickFromGallery({double maxWidth = 1600}) async {
    final file = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: maxWidth,
      maxHeight: maxWidth,
      imageQuality: 85,
      requestFullMetadata: false,
    );
    if (file == null) return null;
    return PickedImage(
      bytes: await file.readAsBytes(),
      contentType: file.mimeType ?? _typeFromName(file.name),
    );
  }

  static String _typeFromName(String name) {
    final lower = name.toLowerCase();
    if (lower.endsWith('.png')) return 'image/png';
    if (lower.endsWith('.webp')) return 'image/webp';
    return 'image/jpeg';
  }
}
