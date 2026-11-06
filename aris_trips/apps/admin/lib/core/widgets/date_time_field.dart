import 'package:flutter/material.dart';

import '../format/date_formats.dart';

/// Picks a wall-clock date and time. The value has no zone of its own; the
/// form pairs it with a time zone field.
class DateTimeField extends StatelessWidget {
  const DateTimeField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.errorText,
    this.helperText,
    this.enabled = true,
    this.onCleared,
  });

  final String label;
  final DateTime? value;
  final ValueChanged<DateTime> onChanged;
  final String? errorText;
  final String? helperText;
  final bool enabled;

  /// Shows a clear button when the field is optional.
  final VoidCallback? onCleared;

  Future<void> _pick(BuildContext context) async {
    final now = DateTime.now();
    final initial = value ?? DateTime(now.year, now.month, now.day, 9);
    final date = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(now.year - 2),
      lastDate: DateTime(now.year + 5, 12, 31),
      helpText: label,
    );
    if (date == null || !context.mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initial),
      helpText: label,
    );
    if (time == null) return;
    onChanged(
      DateTime(date.year, date.month, date.day, time.hour, time.minute),
    );
  }

  @override
  Widget build(BuildContext context) {
    final current = value;
    final clear = onCleared;
    return InkWell(
      onTap: enabled ? () => _pick(context) : null,
      child: InputDecorator(
        isEmpty: current == null,
        decoration: InputDecoration(
          labelText: label,
          errorText: errorText,
          helperText: helperText,
          enabled: enabled,
          suffixIcon: current != null && clear != null && enabled
              ? IconButton(
                  tooltip: 'Quitar',
                  icon: const Icon(Icons.close),
                  onPressed: clear,
                )
              : const Icon(Icons.schedule),
        ),
        child: Text(
          current == null
              ? ''
              : '${DateFormats.date(current)}, '
                    '${current.hour.toString().padLeft(2, '0')}:'
                    '${current.minute.toString().padLeft(2, '0')}',
        ),
      ),
    );
  }
}
