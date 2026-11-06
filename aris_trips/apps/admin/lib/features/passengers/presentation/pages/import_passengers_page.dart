import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/error/failure_message.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/widgets/state_views.dart';
import '../../domain/entities/passenger_import.dart';
import '../cubit/import_cubit.dart';
import '../widgets/passenger_ui.dart';

/// CSV import with per-row preview. Expects a configured [ImportCubit].
class ImportPassengersPage extends StatelessWidget {
  const ImportPassengersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImportCubit, ImportState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: const Text('Importar pasajeros')),
        body: switch (state) {
          ImportIdle(:final fileError) => _Instructions(error: fileError),
          ImportReading() => const LoadingView(message: 'Leyendo archivo…'),
          ImportPreviewing() => _Preview(state: state),
          ImportDone(:final result) => EmptyView(
            icon: Icons.check_circle_outline,
            title: result.total == 1
                ? '1 pasajero importado'
                : '${result.total} pasajeros importados',
            message: switch (result.reused) {
              0 => null,
              1 => '1 ya existía y se reutilizó.',
              final reused => '$reused ya existían y se reutilizaron.',
            },
            action: FilledButton(
              onPressed: () => context.pop(),
              child: const Text('Listo'),
            ),
          ),
        },
      ),
    );
  }
}

class _Instructions extends StatelessWidget {
  const _Instructions({this.error});

  final ImportFileError? error;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fileError = error;
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        Text('Formato del archivo', style: theme.textTheme.titleMedium),
        const SizedBox(height: AppSpacing.sm),
        const Text(
          'Un CSV con una fila de encabezados. Columnas obligatorias: nombre y '
          'apellido. Opcionales: correo y telefono. Puedes exportarlo desde '
          'Excel o Google Sheets.',
        ),
        const SizedBox(height: AppSpacing.md),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(AppRadius.sm),
            border: Border.all(color: theme.colorScheme.outline),
          ),
          child: Text(
            'nombre,apellido,correo,telefono\n'
            'Ana,López,ana@correo.com,+525511111111\n'
            'Luis,Martínez,,',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontFamily: 'monospace',
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          'Si un pasajero ya existe con el mismo correo, nombre y apellido, se '
          'reutiliza. Las filas con errores no se importan.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        if (fileError != null) ...[
          const SizedBox(height: AppSpacing.md),
          Text(
            fileError.message,
            key: const Key('import_file_error'),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.error,
            ),
          ),
        ],
        const SizedBox(height: AppSpacing.lg),
        FilledButton.icon(
          key: const Key('pick_csv'),
          onPressed: context.read<ImportCubit>().pickFile,
          icon: const Icon(Icons.upload_file),
          label: const Text('Elegir archivo CSV'),
        ),
      ],
    );
  }
}

class _Preview extends StatelessWidget {
  const _Preview({required this.state});

  final ImportPreviewing state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<ImportCubit>();
    final preview = state.preview;
    final failure = state.failure;

    if (preview.missingColumns.isNotEmpty) {
      return EmptyView(
        icon: Icons.table_rows_outlined,
        title: 'Faltan columnas',
        message:
            'El archivo debe tener: '
            '${preview.missingColumns.map((c) => c.label).join(', ')}.',
        action: OutlinedButton(
          onPressed: cubit.pickFile,
          child: const Text('Elegir otro archivo'),
        ),
      );
    }
    if (preview.rows.isEmpty) {
      return EmptyView(
        icon: Icons.table_rows_outlined,
        title: 'Sin filas',
        message: 'El archivo solo tiene encabezados.',
        action: OutlinedButton(
          onPressed: cubit.pickFile,
          child: const Text('Elegir otro archivo'),
        ),
      );
    }

    final valid = preview.validRows.length;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '$valid ${valid == 1 ? 'fila válida' : 'filas válidas'}'
                  '${preview.invalidCount == 0 ? '' : ' · ${preview.invalidCount} con errores'}',
                  key: const Key('import_summary'),
                  style: theme.textTheme.titleMedium,
                ),
              ),
              TextButton(
                onPressed: state.importing ? null : cubit.pickFile,
                child: const Text('Otro archivo'),
              ),
            ],
          ),
        ),
        if (failure != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Text(
              failure.message,
              key: const Key('import_error'),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
          ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            itemCount: preview.rows.length,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (context, index) => _RowTile(row: preview.rows[index]),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                key: const Key('confirm_import'),
                onPressed: preview.canImport && !state.importing
                    ? cubit.submit
                    : null,
                child: state.importing
                    ? const SizedBox.square(
                        dimension: AppSpacing.lg,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(
                        valid == 1
                            ? 'Importar 1 pasajero'
                            : 'Importar $valid pasajeros',
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _RowTile extends StatelessWidget {
  const _RowTile({required this.row});

  final ImportRow row;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final draft = row.draft;
    final name = '${draft.firstName} ${draft.lastName}'.trim();
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        row.isValid ? Icons.check_circle_outline : Icons.error_outline,
        color: row.isValid ? AppColors.success : theme.colorScheme.error,
      ),
      title: Text(name.isEmpty ? '(sin nombre)' : name),
      subtitle: Text(
        row.isValid
            ? [
                if (draft.email.isNotEmpty) draft.email,
                if (draft.phone.isNotEmpty) draft.phone,
              ].join(' · ')
            : 'Fila ${row.line}: ${row.issues.map((i) => i.message).join(', ')}',
        style: row.isValid
            ? null
            : theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.error,
              ),
      ),
    );
  }
}
