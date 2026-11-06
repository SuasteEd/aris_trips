import 'dart:typed_data';

/// Image bytes picked by the admin, ready to upload.
class CoverImage {
  const CoverImage({required this.bytes, required this.contentType});

  final Uint8List bytes;

  /// `image/jpeg`, `image/png` or `image/webp` (allowed by the bucket).
  final String contentType;

  static const Set<String> allowedTypes = {
    'image/jpeg',
    'image/png',
    'image/webp',
  };

  bool get isAllowedType => allowedTypes.contains(contentType);
}
