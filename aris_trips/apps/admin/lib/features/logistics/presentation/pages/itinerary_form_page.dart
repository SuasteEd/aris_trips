import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/date_time_field.dart';
import '../../../../core/widgets/time_zone_field.dart';
import '../../domain/entities/itinerary_draft.dart';
import '../../domain/entities/itinerary_item.dart';
import '../cubit/item_form_cubit.dart';
import '../widgets/item_form_scaffold.dart';
import '../widgets/logistics_messages.dart';

typedef ItineraryFormState = ItemFormState<ItineraryItem, ItineraryDraftIssue>;

/// Expects a configured [ItineraryFormCubit]. Pops `true` when saved.
class ItineraryFormPage extends StatefulWidget {
  const ItineraryFormPage({
    super.key,
    this.original,
    this.initial,
    this.audience = const {},
  });

  final ItineraryItem? original;
  final ItineraryDraft? initial;

  /// Booking id → passenger name, for items of a single passenger.
  final Map<String, String> audience;

  @override
  State<ItineraryFormPage> createState() => _ItineraryFormPageState();
}

class _ItineraryFormPageState extends State<ItineraryFormPage> {
  late ItineraryDraft _draft =
      widget.original?.toDraft() ?? widget.initial ?? const ItineraryDraft();
  late final _title = TextEditingController(text: _draft.title);
  late final _location = TextEditingController(text: _draft.location);
  late final _description = TextEditingController(text: _draft.description);

  @override
  void dispose() {
    for (final controller in [_title, _location, _description]) {
      controller.dispose();
    }
    super.dispose();
  }

  ItineraryDraft _current() => _draft.copyWith(
    title: _title.text,
    location: _location.text,
    description: _description.text,
  );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ItineraryFormCubit, ItineraryFormState>(
      listenWhen: (_, current) => current is ItemFormSaved,
      listener: (context, _) => Navigator.pop(context, true),
      builder: (context, state) {
        final editing =
            state is ItemFormEditing<ItineraryItem, ItineraryDraftIssue>
            ? state
            : null;
        final issues = editing?.issues ?? const {};
        final submitting = editing?.submitting ?? true;
        String? error(ItineraryDraftIssue issue) =>
            issues.contains(issue) ? issue.message : null;

        return ItemFormScaffold(
          title: widget.original == null
              ? 'Nueva actividad'
              : 'Editar actividad',
          submitting: submitting,
          failure: editing?.failure,
          onSave: () => context.read<ItineraryFormCubit>().submit(_current()),
          children: [
            TextField(
              key: const Key('itinerary_title'),
              controller: _title,
              enabled: !submitting,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: 'Título',
                errorText: error(ItineraryDraftIssue.titleRequired),
              ),
            ),
            DropdownButtonFormField<String?>(
              key: const Key('itinerary_audience'),
              initialValue: widget.audience.containsKey(_draft.bookingId)
                  ? _draft.bookingId
                  : null,
              decoration: const InputDecoration(labelText: 'Para'),
              items: [
                const DropdownMenuItem(child: Text('Todo el grupo')),
                for (final MapEntry(key: id, value: name)
                    in widget.audience.entries)
                  DropdownMenuItem(value: id, child: Text(name)),
              ],
              onChanged: submitting
                  ? null
                  : (id) =>
                        setState(() => _draft = _draft.copyWith(bookingId: id)),
            ),
            TimeZoneField(
              key: const Key('itinerary_tz'),
              label: 'Zona horaria del lugar',
              value: _draft.timezone,
              enabled: !submitting,
              errorText: error(ItineraryDraftIssue.timezoneInvalid),
              onChanged: (zone) =>
                  setState(() => _draft = _draft.copyWith(timezone: zone)),
            ),
            DateTimeField(
              key: const Key('itinerary_starts'),
              label: 'Inicio',
              value: _draft.startsLocal,
              enabled: !submitting,
              errorText: error(ItineraryDraftIssue.startRequired),
              onChanged: (value) =>
                  setState(() => _draft = _draft.copyWith(startsLocal: value)),
            ),
            DateTimeField(
              key: const Key('itinerary_ends'),
              label: 'Fin (opcional)',
              value: _draft.endsLocal,
              enabled: !submitting,
              errorText: error(ItineraryDraftIssue.endBeforeStart),
              onChanged: (value) =>
                  setState(() => _draft = _draft.copyWith(endsLocal: value)),
              onCleared: () =>
                  setState(() => _draft = _draft.copyWith(endsLocal: null)),
            ),
            TextField(
              key: const Key('itinerary_location'),
              controller: _location,
              enabled: !submitting,
              decoration: const InputDecoration(labelText: 'Lugar (opcional)'),
            ),
            TextField(
              key: const Key('itinerary_description'),
              controller: _description,
              enabled: !submitting,
              minLines: 2,
              maxLines: 6,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Descripción (opcional)',
                alignLabelWithHint: true,
              ),
            ),
          ],
        );
      },
    );
  }
}
