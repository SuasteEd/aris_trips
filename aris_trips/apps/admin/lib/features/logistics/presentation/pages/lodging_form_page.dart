import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_tokens.dart';
import '../../../../core/widgets/date_time_field.dart';
import '../../../../core/widgets/time_zone_field.dart';
import '../../domain/entities/lodging.dart';
import '../../domain/entities/lodging_draft.dart';
import '../cubit/item_form_cubit.dart';
import '../widgets/item_form_scaffold.dart';
import '../widgets/logistics_messages.dart';

typedef LodgingFormState = ItemFormState<Lodging, LodgingDraftIssue>;

/// Expects a configured [LodgingFormCubit]. Pops `true` when saved.
class LodgingFormPage extends StatefulWidget {
  const LodgingFormPage({super.key, this.original, this.initial});

  final Lodging? original;
  final LodgingDraft? initial;

  @override
  State<LodgingFormPage> createState() => _LodgingFormPageState();
}

class _LodgingFormPageState extends State<LodgingFormPage> {
  late LodgingDraft _draft =
      widget.original?.toDraft() ?? widget.initial ?? const LodgingDraft();
  late final _name = TextEditingController(text: _draft.name);
  late final _address = TextEditingController(text: _draft.address);
  late final _latitude = TextEditingController(text: _draft.latitude);
  late final _longitude = TextEditingController(text: _draft.longitude);

  @override
  void dispose() {
    for (final controller in [_name, _address, _latitude, _longitude]) {
      controller.dispose();
    }
    super.dispose();
  }

  LodgingDraft _current() => _draft.copyWith(
    name: _name.text,
    address: _address.text,
    latitude: _latitude.text,
    longitude: _longitude.text,
  );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LodgingFormCubit, LodgingFormState>(
      listenWhen: (_, current) => current is ItemFormSaved,
      listener: (context, _) => Navigator.pop(context, true),
      builder: (context, state) {
        final editing = state is ItemFormEditing<Lodging, LodgingDraftIssue>
            ? state
            : null;
        final issues = editing?.issues ?? const {};
        final submitting = editing?.submitting ?? true;
        String? error(LodgingDraftIssue issue) =>
            issues.contains(issue) ? issue.message : null;
        const coordinates = TextInputType.numberWithOptions(
          signed: true,
          decimal: true,
        );

        return ItemFormScaffold(
          title: widget.original == null
              ? 'Nuevo hospedaje'
              : 'Editar hospedaje',
          submitting: submitting,
          failure: editing?.failure,
          onSave: () => context.read<LodgingFormCubit>().submit(_current()),
          children: [
            TextField(
              key: const Key('lodging_name'),
              controller: _name,
              enabled: !submitting,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                labelText: 'Nombre',
                errorText: error(LodgingDraftIssue.nameRequired),
              ),
            ),
            TextField(
              key: const Key('lodging_address'),
              controller: _address,
              enabled: !submitting,
              minLines: 1,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Dirección (opcional)',
              ),
            ),
            TimeZoneField(
              key: const Key('lodging_tz'),
              label: 'Zona horaria del hospedaje',
              value: _draft.timezone,
              enabled: !submitting,
              errorText: error(LodgingDraftIssue.timezoneInvalid),
              onChanged: (zone) =>
                  setState(() => _draft = _draft.copyWith(timezone: zone)),
            ),
            DateTimeField(
              key: const Key('lodging_check_in'),
              label: 'Check-in',
              value: _draft.checkInLocal,
              enabled: !submitting,
              errorText: error(LodgingDraftIssue.checkInRequired),
              onChanged: (value) =>
                  setState(() => _draft = _draft.copyWith(checkInLocal: value)),
            ),
            DateTimeField(
              key: const Key('lodging_check_out'),
              label: 'Check-out',
              value: _draft.checkOutLocal,
              enabled: !submitting,
              errorText:
                  error(LodgingDraftIssue.checkOutRequired) ??
                  error(LodgingDraftIssue.checkOutNotAfterCheckIn),
              onChanged: (value) => setState(
                () => _draft = _draft.copyWith(checkOutLocal: value),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    key: const Key('lodging_latitude'),
                    controller: _latitude,
                    enabled: !submitting,
                    keyboardType: coordinates,
                    decoration: InputDecoration(
                      labelText: 'Latitud (opcional)',
                      hintText: '21.0945',
                      errorText:
                          error(LodgingDraftIssue.latitudeInvalid) ??
                          error(LodgingDraftIssue.coordinatesIncomplete),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: TextField(
                    key: const Key('lodging_longitude'),
                    controller: _longitude,
                    enabled: !submitting,
                    keyboardType: coordinates,
                    decoration: InputDecoration(
                      labelText: 'Longitud (opcional)',
                      hintText: '-86.7673',
                      errorText: error(LodgingDraftIssue.longitudeInvalid),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
