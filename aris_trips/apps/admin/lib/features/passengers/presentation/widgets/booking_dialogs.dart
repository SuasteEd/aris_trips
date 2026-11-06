import 'package:flutter/material.dart';

import '../../../../core/theme/app_tokens.dart';
import '../../domain/entities/booking.dart';
import '../../domain/entities/passenger_draft.dart';
import 'passenger_form.dart';
import 'passenger_ui.dart';

/// Edits passenger data. Returns the draft when it is valid.
Future<PassengerDraft?> showPassengerDialog(
  BuildContext context,
  PassengerDraft initial,
) => showDialog<PassengerDraft>(
  context: context,
  builder: (_) => _PassengerDialog(initial: initial),
);

class _PassengerDialog extends StatefulWidget {
  const _PassengerDialog({required this.initial});

  final PassengerDraft initial;

  @override
  State<_PassengerDialog> createState() => _PassengerDialogState();
}

class _PassengerDialogState extends State<_PassengerDialog> {
  late final _controllers = PassengerControllers(widget.initial);
  Set<PassengerDraftIssue> _issues = const {};

  @override
  void dispose() {
    _controllers.dispose();
    super.dispose();
  }

  void _save() {
    final draft = _controllers.draft;
    final issues = draft.issues;
    if (issues.isEmpty) {
      Navigator.pop(context, draft);
    } else {
      setState(() => _issues = issues);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Datos del pasajero'),
      content: SingleChildScrollView(
        child: PassengerFields(controllers: _controllers, issues: _issues),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          key: const Key('save_passenger'),
          onPressed: _save,
          child: const Text('Guardar'),
        ),
      ],
    );
  }
}

/// Edits status and notes. Returns `(status, notes)`.
Future<(BookingStatus, String)?> showBookingDialog(
  BuildContext context,
  Booking booking,
) => showDialog<(BookingStatus, String)>(
  context: context,
  builder: (_) => _BookingDialog(booking: booking),
);

class _BookingDialog extends StatefulWidget {
  const _BookingDialog({required this.booking});

  final Booking booking;

  @override
  State<_BookingDialog> createState() => _BookingDialogState();
}

class _BookingDialogState extends State<_BookingDialog> {
  late BookingStatus _status = widget.booking.status;
  late final _notes = TextEditingController(text: widget.booking.notes ?? '');

  @override
  void dispose() {
    _notes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Reservación'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<BookingStatus>(
              key: const Key('booking_status'),
              initialValue: _status,
              decoration: const InputDecoration(labelText: 'Estado'),
              items: [
                for (final status in BookingStatus.values)
                  DropdownMenuItem(value: status, child: Text(status.label)),
              ],
              onChanged: (status) =>
                  setState(() => _status = status ?? _status),
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              key: const Key('booking_notes'),
              controller: _notes,
              minLines: 3,
              maxLines: 6,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Notas',
                hintText: 'Dieta, movilidad, preferencias…',
                alignLabelWithHint: true,
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          key: const Key('save_booking'),
          onPressed: () => Navigator.pop(context, (_status, _notes.text)),
          child: const Text('Guardar'),
        ),
      ],
    );
  }
}

/// Values chosen in an assignment dialog.
class AssignmentInput {
  const AssignmentInput({
    required this.targetId,
    required this.first,
    required this.second,
  });

  /// Flight or lodging id.
  final String targetId;

  /// Seat or room.
  final String first;

  /// Record locator or confirmation number.
  final String second;
}

/// Picks a flight or lodging (when [options] has several) and its details.
Future<AssignmentInput?> showAssignmentDialog(
  BuildContext context, {
  required String title,
  required Map<String, String> options,
  required String firstLabel,
  required String secondLabel,
  String? selected,
  String initialFirst = '',
  String initialSecond = '',
}) => showDialog<AssignmentInput>(
  context: context,
  builder: (_) => _AssignmentDialog(
    title: title,
    options: options,
    firstLabel: firstLabel,
    secondLabel: secondLabel,
    selected: selected,
    initialFirst: initialFirst,
    initialSecond: initialSecond,
  ),
);

class _AssignmentDialog extends StatefulWidget {
  const _AssignmentDialog({
    required this.title,
    required this.options,
    required this.firstLabel,
    required this.secondLabel,
    required this.selected,
    required this.initialFirst,
    required this.initialSecond,
  });

  final String title;
  final Map<String, String> options;
  final String firstLabel;
  final String secondLabel;
  final String? selected;
  final String initialFirst;
  final String initialSecond;

  @override
  State<_AssignmentDialog> createState() => _AssignmentDialogState();
}

class _AssignmentDialogState extends State<_AssignmentDialog> {
  late String? _target = widget.selected ?? widget.options.keys.firstOrNull;
  late final _first = TextEditingController(text: widget.initialFirst);
  late final _second = TextEditingController(text: widget.initialSecond);

  @override
  void dispose() {
    _first.dispose();
    _second.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final target = _target;
    return AlertDialog(
      title: Text(widget.title),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              key: const Key('assignment_target'),
              initialValue: target,
              isExpanded: true,
              items: [
                for (final MapEntry(key: id, value: label)
                    in widget.options.entries)
                  DropdownMenuItem(
                    value: id,
                    child: Text(label, overflow: TextOverflow.ellipsis),
                  ),
              ],
              onChanged: widget.selected != null
                  ? null
                  : (id) => setState(() => _target = id),
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              key: const Key('assignment_first'),
              controller: _first,
              decoration: InputDecoration(labelText: widget.firstLabel),
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              key: const Key('assignment_second'),
              controller: _second,
              decoration: InputDecoration(labelText: widget.secondLabel),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          key: const Key('save_assignment'),
          onPressed: target == null
              ? null
              : () => Navigator.pop(
                  context,
                  AssignmentInput(
                    targetId: target,
                    first: _first.text,
                    second: _second.text,
                  ),
                ),
          child: const Text('Guardar'),
        ),
      ],
    );
  }
}
