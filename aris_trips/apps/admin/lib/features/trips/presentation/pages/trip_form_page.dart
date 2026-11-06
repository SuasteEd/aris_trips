import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/error/failure_message.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/widgets/date_field.dart';
import '../../../../core/widgets/state_views.dart';
import '../../domain/entities/trip.dart';
import '../../domain/entities/trip_draft.dart';
import '../../domain/entities/trip_status.dart';
import '../cubit/trip_form_cubit.dart';
import '../widgets/trip_status_ui.dart';

/// Create or edit a trip. Expects a [TripFormCubit] already started.
class TripFormPage extends StatelessWidget {
  const TripFormPage({super.key, this.tripId});

  final String? tripId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripFormCubit, TripFormState>(
      listenWhen: (_, current) => current is TripFormSaved,
      listener: (context, state) {
        if (state case TripFormSaved(:final trip, :final created)) {
          if (created) {
            context.pushReplacement(AppRoutes.tripDetail(trip.id));
          } else {
            context.pop(true);
          }
        }
      },
      buildWhen: (previous, current) =>
          previous.runtimeType != current.runtimeType ||
          current is TripFormLoadFailure,
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(tripId == null ? 'Nuevo viaje' : 'Editar viaje'),
        ),
        body: switch (state) {
          TripFormLoading() || TripFormSaved() => const LoadingView(),
          TripFormLoadFailure(:final failure) => ErrorView(
            message: failure.message,
            onRetry: () => context.read<TripFormCubit>().start(tripId: tripId),
          ),
          TripFormEditing(:final original) => _TripForm(original: original),
        },
      ),
    );
  }
}

class _TripForm extends StatefulWidget {
  const _TripForm({required this.original});

  final Trip? original;

  @override
  State<_TripForm> createState() => _TripFormState();
}

class _TripFormState extends State<_TripForm> {
  late final TextEditingController _name;
  late final TextEditingController _destination;
  late final TextEditingController _description;
  DateTime? _startDate;
  DateTime? _endDate;
  late TripStatus _status;

  @override
  void initState() {
    super.initState();
    final draft = widget.original?.toDraft() ?? const TripDraft();
    _name = TextEditingController(text: draft.name);
    _destination = TextEditingController(text: draft.destination);
    _description = TextEditingController(text: draft.description ?? '');
    _startDate = draft.startDate;
    _endDate = draft.endDate;
    _status = draft.status;
  }

  @override
  void dispose() {
    _name.dispose();
    _destination.dispose();
    _description.dispose();
    super.dispose();
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    context.read<TripFormCubit>().submit(
      TripDraft(
        name: _name.text,
        destination: _destination.text,
        description: _description.text,
        startDate: _startDate,
        endDate: _endDate,
        status: _status,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripFormCubit, TripFormState>(
      builder: (context, state) {
        final editing = state is TripFormEditing ? state : null;
        final issues = editing?.issues ?? const <TripDraftIssue>{};
        final submitting = editing?.submitting ?? true;
        final failure = editing?.failure;

        String? error(TripDraftIssue issue) =>
            issues.contains(issue) ? issue.message : null;

        return ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            TextField(
              key: const Key('trip_name'),
              controller: _name,
              enabled: !submitting,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Nombre',
                errorText: error(TripDraftIssue.nameRequired),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              key: const Key('trip_destination'),
              controller: _destination,
              enabled: !submitting,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Destino',
                errorText: error(TripDraftIssue.destinationRequired),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: DateField(
                    key: const Key('trip_start_date'),
                    label: 'Inicio',
                    value: _startDate,
                    enabled: !submitting,
                    errorText: error(TripDraftIssue.startDateRequired),
                    onChanged: (date) => setState(() => _startDate = date),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: DateField(
                    key: const Key('trip_end_date'),
                    label: 'Fin',
                    value: _endDate,
                    enabled: !submitting,
                    firstDate: _startDate,
                    errorText:
                        error(TripDraftIssue.endDateRequired) ??
                        error(TripDraftIssue.endBeforeStart),
                    onChanged: (date) => setState(() => _endDate = date),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            DropdownButtonFormField<TripStatus>(
              key: const Key('trip_status'),
              initialValue: _status,
              decoration: const InputDecoration(labelText: 'Estado'),
              items: [
                for (final status in TripStatus.values)
                  DropdownMenuItem(value: status, child: Text(status.label)),
              ],
              onChanged: submitting
                  ? null
                  : (status) => setState(() => _status = status ?? _status),
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              key: const Key('trip_description'),
              controller: _description,
              enabled: !submitting,
              minLines: 3,
              maxLines: 8,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Descripción (opcional)',
                alignLabelWithHint: true,
              ),
            ),
            if (failure != null) ...[
              const SizedBox(height: AppSpacing.md),
              Text(
                failure.message,
                key: const Key('trip_form_error'),
                style: Theme.of(context).textTheme.bodyMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.error),
              ),
            ],
            const SizedBox(height: AppSpacing.lg),
            FilledButton(
              key: const Key('save_trip'),
              onPressed: submitting ? null : _submit,
              child: submitting
                  ? const SizedBox.square(
                      dimension: AppSpacing.lg,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }
}
