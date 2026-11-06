import 'package:flutter/material.dart';

import '../../../../core/theme/app_tokens.dart';
import '../../domain/entities/trip_draft.dart';
import '../../domain/entities/trip_status.dart';

/// Texts and colors for [TripStatus] in the interface.
extension TripStatusUi on TripStatus {
  String get label => switch (this) {
    TripStatus.draft => 'Borrador',
    TripStatus.published => 'Publicado',
    TripStatus.archived => 'Archivado',
  };

  String get filterLabel => switch (this) {
    TripStatus.draft => 'Borradores',
    TripStatus.published => 'Publicados',
    TripStatus.archived => 'Archivados',
  };

  /// Menu entry that moves a trip to this status.
  String get actionLabel => switch (this) {
    TripStatus.draft => 'Pasar a borrador',
    TripStatus.published => 'Publicar',
    TripStatus.archived => 'Archivar',
  };

  IconData get icon => switch (this) {
    TripStatus.draft => Icons.edit_note,
    TripStatus.published => Icons.public,
    TripStatus.archived => Icons.inventory_2_outlined,
  };

  Color get color => switch (this) {
    TripStatus.draft => AppColors.warning,
    TripStatus.published => AppColors.success,
    TripStatus.archived => AppColors.onSurfaceMuted,
  };
}

extension TripDraftIssueUi on TripDraftIssue {
  String get message => switch (this) {
    TripDraftIssue.nameRequired => 'Escribe el nombre del viaje.',
    TripDraftIssue.destinationRequired => 'Escribe el destino.',
    TripDraftIssue.startDateRequired => 'Elige la fecha de inicio.',
    TripDraftIssue.endDateRequired => 'Elige la fecha de fin.',
    TripDraftIssue.endBeforeStart =>
      'La fecha de fin no puede ser antes del inicio.',
  };
}
