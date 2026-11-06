import 'package:flutter/material.dart';

import '../format/date_formats.dart';

/// Read-only field that opens the date picker.
class DateField extends StatelessWidget {
  const DateField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.errorText,
    this.firstDate,
    this.lastDate,
    this.enabled = true,
  });

  final String label;
  final DateTime? value;
  final ValueChanged<DateTime> onChanged;
  final String? errorText;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final bool enabled;

  Future<void> _pick(BuildContext context) async {
    final now = DateTime.now();
    final first = firstDate ?? DateTime(now.year - 2);
    final last = lastDate ?? DateTime(now.year + 5, 12, 31);
    var initial = value ?? now;
    if (initial.isBefore(first)) initial = first;
    if (initial.isAfter(last)) initial = last;
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: first,
      lastDate: last,
      helpText: label,
    );
    if (picked != null) onChanged(picked);
  }

  @override
  Widget build(BuildContext context) {
    final date = value;
    return InkWell(
      onTap: enabled ? () => _pick(context) : null,
      child: InputDecorator(
        isEmpty: date == null,
        decoration: InputDecoration(
          labelText: label,
          errorText: errorText,
          enabled: enabled,
          suffixIcon: const Icon(Icons.calendar_today_outlined),
        ),
        child: Text(date == null ? '' : DateFormats.date(date)),
      ),
    );
  }
}
