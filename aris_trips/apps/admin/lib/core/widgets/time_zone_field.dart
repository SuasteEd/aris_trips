import 'package:flutter/material.dart';

import '../format/zoned_formats.dart';
import '../theme/app_tokens.dart';
import '../time/time_zones.dart';

/// Shows an IANA zone and opens a searchable list to change it.
class TimeZoneField extends StatelessWidget {
  const TimeZoneField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.errorText,
    this.enabled = true,
  });

  final String label;
  final String value;
  final ValueChanged<String> onChanged;
  final String? errorText;
  final bool enabled;

  Future<void> _pick(BuildContext context) async {
    final zone = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => _TimeZonePicker(selected: value),
    );
    if (zone != null) onChanged(zone);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? () => _pick(context) : null,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          errorText: errorText,
          enabled: enabled,
          suffixIcon: const Icon(Icons.public),
        ),
        child: Text(ZonedFormats.zoneName(value)),
      ),
    );
  }
}

class _TimeZonePicker extends StatefulWidget {
  const _TimeZonePicker({required this.selected});

  final String selected;

  @override
  State<_TimeZonePicker> createState() => _TimeZonePickerState();
}

class _TimeZonePickerState extends State<_TimeZonePicker> {
  late final List<String> _all = TimeZones.all();
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final query = _query.trim().toLowerCase().replaceAll(' ', '_');
    final zones = query.isEmpty
        ? _all
        : _all.where((zone) => zone.toLowerCase().contains(query)).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: TextField(
            key: const Key('time_zone_search'),
            autofocus: true,
            onChanged: (text) => setState(() => _query = text),
            decoration: const InputDecoration(
              hintText: 'Buscar ciudad o zona',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: zones.length,
            itemBuilder: (context, index) {
              final zone = zones[index];
              return ListTile(
                title: Text(ZonedFormats.zoneName(zone)),
                subtitle: Text(zone),
                selected: zone == widget.selected,
                trailing: zone == widget.selected
                    ? const Icon(Icons.check)
                    : null,
                onTap: () => Navigator.pop(context, zone),
              );
            },
          ),
        ),
      ],
    );
  }
}
