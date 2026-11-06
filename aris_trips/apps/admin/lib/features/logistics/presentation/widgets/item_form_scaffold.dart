import 'package:flutter/material.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/failure_message.dart';
import '../../../../core/theme/app_tokens.dart';

/// Shared layout of the logistics forms.
class ItemFormScaffold extends StatelessWidget {
  const ItemFormScaffold({
    super.key,
    required this.title,
    required this.submitting,
    required this.failure,
    required this.onSave,
    required this.children,
  });

  final String title;
  final bool submitting;
  final Failure? failure;
  final VoidCallback onSave;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final error = failure;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          for (final child in children) ...[
            child,
            const SizedBox(height: AppSpacing.md),
          ],
          if (error != null) ...[
            Text(
              error.message,
              key: const Key('item_form_error'),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
          ],
          FilledButton(
            key: const Key('save_item'),
            onPressed: submitting ? null : onSave,
            child: submitting
                ? const SizedBox.square(
                    dimension: AppSpacing.lg,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Guardar'),
          ),
        ],
      ),
    );
  }
}
