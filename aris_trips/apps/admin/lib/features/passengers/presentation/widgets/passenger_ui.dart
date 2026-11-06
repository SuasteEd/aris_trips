import 'package:flutter/material.dart';

import '../../../../core/theme/app_tokens.dart';
import '../../domain/entities/booking.dart';
import '../../domain/entities/passenger_draft.dart';
import '../../domain/entities/passenger_import.dart';
import '../cubit/import_cubit.dart';

extension BookingStatusUi on BookingStatus {
  String get label => switch (this) {
    BookingStatus.pending => 'Pendiente',
    BookingStatus.confirmed => 'Confirmada',
    BookingStatus.cancelled => 'Cancelada',
  };

  Color get color => switch (this) {
    BookingStatus.pending => AppColors.warning,
    BookingStatus.confirmed => AppColors.success,
    BookingStatus.cancelled => AppColors.onSurfaceMuted,
  };
}

extension PassengerDraftIssueUi on PassengerDraftIssue {
  String get message => switch (this) {
    PassengerDraftIssue.firstNameRequired => 'Escribe el nombre.',
    PassengerDraftIssue.lastNameRequired => 'Escribe el apellido.',
    PassengerDraftIssue.emailInvalid => 'Escribe un correo válido.',
  };
}

extension ImportIssueUi on ImportIssue {
  String get message => switch (this) {
    ImportIssue.firstNameRequired => 'Falta el nombre',
    ImportIssue.lastNameRequired => 'Falta el apellido',
    ImportIssue.emailInvalid => 'Correo inválido',
    ImportIssue.duplicateInFile => 'Repetido en el archivo',
    ImportIssue.alreadyInTrip => 'Ya está en el viaje',
  };
}

extension ImportColumnUi on ImportColumn {
  String get label => switch (this) {
    ImportColumn.firstName => 'nombre',
    ImportColumn.lastName => 'apellido',
    ImportColumn.email => 'correo',
    ImportColumn.phone => 'telefono',
  };
}

extension ImportFileErrorUi on ImportFileError {
  String get message => switch (this) {
    ImportFileError.tooLarge => 'El archivo pesa más de 1 MB.',
    ImportFileError.unreadable =>
      'No pudimos leer el archivo. Guárdalo como CSV e inténtalo de nuevo.',
    ImportFileError.empty => 'El archivo está vacío.',
  };
}

/// Small colored label for a booking status.
class BookingStatusChip extends StatelessWidget {
  const BookingStatusChip({super.key, required this.status});

  final BookingStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: status.color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Text(
        status.label,
        style: Theme.of(context).textTheme.labelMedium
            ?.copyWith(color: status.color),
      ),
    );
  }
}

/// `2 vuelos · Hab. 1204`, or `Sin asignaciones`.
String assignmentSummary(Booking booking) {
  final flights = booking.flightAssignments.length;
  final rooms = {for (final a in booking.lodgingAssignments) ?a.room};
  final parts = [
    if (flights > 0) flights == 1 ? '1 vuelo' : '$flights vuelos',
    if (rooms.isNotEmpty)
      'Hab. ${rooms.join(', ')}'
    else if (booking.lodgingAssignments.isNotEmpty)
      'Hospedaje sin habitación',
  ];
  return parts.isEmpty ? 'Sin asignaciones' : parts.join(' · ');
}
