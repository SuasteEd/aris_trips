import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/format/zoned_formats.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/widgets/date_time_field.dart';
import '../../../../core/widgets/time_zone_field.dart';
import '../../domain/entities/flight.dart';
import '../../domain/entities/flight_draft.dart';
import '../cubit/item_form_cubit.dart';
import '../widgets/item_form_scaffold.dart';
import '../widgets/logistics_messages.dart';

typedef FlightFormState = ItemFormState<Flight, FlightDraftIssue>;

/// Expects a configured [FlightFormCubit]. Pops `true` when saved.
class FlightFormPage extends StatefulWidget {
  const FlightFormPage({super.key, this.original, this.initial});

  final Flight? original;

  /// Defaults for a new flight (e.g. suggested zones).
  final FlightDraft? initial;

  @override
  State<FlightFormPage> createState() => _FlightFormPageState();
}

class _FlightFormPageState extends State<FlightFormPage> {
  late FlightDraft _draft =
      widget.original?.toDraft() ?? widget.initial ?? const FlightDraft();
  late final _airline = TextEditingController(text: _draft.airline);
  late final _number = TextEditingController(text: _draft.flightNumber);
  late final _origin = TextEditingController(text: _draft.origin);
  late final _destination = TextEditingController(text: _draft.destination);
  late final _terminal = TextEditingController(text: _draft.terminal);

  @override
  void dispose() {
    for (final controller in [
      _airline,
      _number,
      _origin,
      _destination,
      _terminal,
    ]) {
      controller.dispose();
    }
    super.dispose();
  }

  FlightDraft _current() => _draft.copyWith(
    airline: _airline.text,
    flightNumber: _number.text,
    origin: _origin.text,
    destination: _destination.text,
    terminal: _terminal.text,
  );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightFormCubit, FlightFormState>(
      listenWhen: (_, current) => current is ItemFormSaved,
      listener: (context, _) => Navigator.pop(context, true),
      builder: (context, state) {
        final editing = state is ItemFormEditing<Flight, FlightDraftIssue>
            ? state
            : null;
        final issues = editing?.issues ?? const {};
        final submitting = editing?.submitting ?? true;
        String? error(FlightDraftIssue issue) =>
            issues.contains(issue) ? issue.message : null;

        final draft = _current();
        final departs = draft.departsAt;
        final arrives = draft.arrivesAt;
        final duration =
            departs != null && arrives != null && arrives.isAfter(departs)
            ? 'Duración: ${ZonedFormats.duration(arrives.difference(departs))}'
            : null;

        return ItemFormScaffold(
          title: widget.original == null ? 'Nuevo vuelo' : 'Editar vuelo',
          submitting: submitting,
          failure: editing?.failure,
          onSave: () => context.read<FlightFormCubit>().submit(_current()),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    key: const Key('flight_airline'),
                    controller: _airline,
                    enabled: !submitting,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      labelText: 'Aerolínea',
                      errorText: error(FlightDraftIssue.airlineRequired),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: TextField(
                    key: const Key('flight_number'),
                    controller: _number,
                    enabled: !submitting,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      labelText: 'Número de vuelo',
                      hintText: 'AM 523',
                      errorText: error(FlightDraftIssue.flightNumberRequired),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    key: const Key('flight_origin'),
                    controller: _origin,
                    enabled: !submitting,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      labelText: 'Origen',
                      hintText: 'MEX',
                      errorText: error(FlightDraftIssue.originRequired),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: TextField(
                    key: const Key('flight_destination'),
                    controller: _destination,
                    enabled: !submitting,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      labelText: 'Destino',
                      hintText: 'CUN',
                      errorText: error(FlightDraftIssue.destinationRequired),
                    ),
                  ),
                ),
              ],
            ),
            DateTimeField(
              key: const Key('flight_departs'),
              label: 'Salida (hora local del origen)',
              value: _draft.departsLocal,
              enabled: !submitting,
              errorText: error(FlightDraftIssue.departureRequired),
              onChanged: (value) =>
                  setState(() => _draft = _draft.copyWith(departsLocal: value)),
            ),
            TimeZoneField(
              key: const Key('flight_departure_tz'),
              label: 'Zona horaria de salida',
              value: _draft.departureTz,
              enabled: !submitting,
              errorText: error(FlightDraftIssue.departureTzInvalid),
              onChanged: (zone) =>
                  setState(() => _draft = _draft.copyWith(departureTz: zone)),
            ),
            DateTimeField(
              key: const Key('flight_arrives'),
              label: 'Llegada (hora local del destino)',
              value: _draft.arrivesLocal,
              enabled: !submitting,
              errorText:
                  error(FlightDraftIssue.arrivalRequired) ??
                  error(FlightDraftIssue.arrivalNotAfterDeparture),
              helperText: duration,
              onChanged: (value) =>
                  setState(() => _draft = _draft.copyWith(arrivesLocal: value)),
            ),
            TimeZoneField(
              key: const Key('flight_arrival_tz'),
              label: 'Zona horaria de llegada',
              value: _draft.arrivalTz,
              enabled: !submitting,
              errorText: error(FlightDraftIssue.arrivalTzInvalid),
              onChanged: (zone) =>
                  setState(() => _draft = _draft.copyWith(arrivalTz: zone)),
            ),
            TextField(
              key: const Key('flight_terminal'),
              controller: _terminal,
              enabled: !submitting,
              decoration: const InputDecoration(
                labelText: 'Terminal (opcional)',
              ),
            ),
          ],
        );
      },
    );
  }
}
