import 'package:flutter/material.dart';

import '../../../../core/theme/app_tokens.dart';

/// Cover image with a placeholder when there is none or it fails to load.
class TripCover extends StatelessWidget {
  const TripCover({
    super.key,
    required this.url,
    this.iconSize = AppSpacing.xl,
  });

  final String? url;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final placeholder = ColoredBox(
      color: AppColors.placeholder,
      child: Center(
        child: Icon(
          Icons.landscape_outlined,
          size: iconSize,
          color: AppColors.onSurfaceMuted,
        ),
      ),
    );
    final source = url;
    if (source == null) return placeholder;
    return Image.network(
      source,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) => placeholder,
      loadingBuilder: (context, child, progress) =>
          progress == null ? child : placeholder,
    );
  }
}
