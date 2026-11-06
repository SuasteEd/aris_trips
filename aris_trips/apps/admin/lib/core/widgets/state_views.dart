import 'package:flutter/material.dart';

import '../theme/app_tokens.dart';

/// Shared views for the loading, empty and error states of every screen.

class LoadingView extends StatelessWidget {
  const LoadingView({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          if (message != null) ...[
            const SizedBox(height: AppSpacing.md),
            Text(message!, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ],
      ),
    );
  }
}

class EmptyView extends StatelessWidget {
  const EmptyView({
    super.key,
    required this.title,
    this.message,
    this.icon = Icons.inbox_outlined,
    this.action,
  });

  final String title;
  final String? message;
  final IconData icon;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return _MessageView(
      icon: icon,
      iconColor: Theme.of(context).colorScheme.onSurfaceVariant,
      title: title,
      message: message,
      action: action,
    );
  }
}

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    this.title = 'Algo salió mal',
    required this.message,
    this.onRetry,
  });

  final String title;
  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return _MessageView(
      icon: Icons.error_outline,
      iconColor: Theme.of(context).colorScheme.error,
      title: title,
      message: message,
      action: onRetry == null
          ? null
          : OutlinedButton(onPressed: onRetry, child: const Text('Reintentar')),
    );
  }
}

class _MessageView extends StatelessWidget {
  const _MessageView({
    required this.icon,
    required this.iconColor,
    required this.title,
    this.message,
    this.action,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String? message;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: AppSpacing.xxl, color: iconColor),
            const SizedBox(height: AppSpacing.md),
            Text(
              title,
              style: textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            if (message != null) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(
                message!,
                style: textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (action != null) ...[
              const SizedBox(height: AppSpacing.lg),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
