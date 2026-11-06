import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure_message.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/widgets/confirm_dialog.dart';
import '../../../../core/widgets/state_views.dart';
import '../cubit/items_cubit.dart';

/// Shared layout of the flights, lodging and itinerary tabs: states, add
/// button, delete confirmation and action errors.
class ItemsTab<T, C extends ItemsCubit<T>> extends StatelessWidget {
  const ItemsTab({
    super.key,
    required this.addLabel,
    required this.emptyIcon,
    required this.emptyTitle,
    required this.emptyMessage,
    required this.deleteTitle,
    required this.deleteMessage,
    required this.onAdd,
    required this.itemsBuilder,
  });

  final String addLabel;
  final IconData emptyIcon;
  final String emptyTitle;
  final String emptyMessage;
  final String deleteTitle;
  final String deleteMessage;
  final VoidCallback onAdd;

  /// Builds the list content. Call `onDelete` to ask and delete an item.
  final List<Widget> Function(
    BuildContext context,
    List<T> items,
    void Function(T item) onDelete,
  )
  itemsBuilder;

  Future<void> _delete(BuildContext context, T item) async {
    final cubit = context.read<C>();
    final confirmed = await confirmAction(
      context,
      title: deleteTitle,
      message: deleteMessage,
      confirmLabel: 'Eliminar',
    );
    if (confirmed) await cubit.delete(item);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<C, ItemsState<T>>(
      listenWhen: (previous, current) =>
          current is ItemsLoaded<T> &&
          current.actionFailure != null &&
          (previous is! ItemsLoaded<T> || previous.busy),
      listener: (context, state) {
        if (state case ItemsLoaded<T>(:final actionFailure?)) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(actionFailure.message)));
        }
      },
      builder: (context, state) => switch (state) {
        ItemsLoading<T>() => const LoadingView(),
        ItemsFailure<T>(:final failure) => ErrorView(
          message: failure.message,
          onRetry: context.read<C>().refresh,
        ),
        ItemsLoaded<T>(:final items) when items.isEmpty => EmptyView(
          icon: emptyIcon,
          title: emptyTitle,
          message: emptyMessage,
          action: FilledButton.icon(
            onPressed: onAdd,
            icon: const Icon(Icons.add),
            label: Text(addLabel),
          ),
        ),
        ItemsLoaded<T>(:final items, :final busy) => Column(
          children: [
            if (busy) const LinearProgressIndicator(),
            Expanded(
              child: RefreshIndicator(
                onRefresh: context.read<C>().refresh,
                child: ListView(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: OutlinedButton.icon(
                        key: const Key('add_item'),
                        onPressed: busy ? null : onAdd,
                        icon: const Icon(Icons.add),
                        label: Text(addLabel),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    ...itemsBuilder(
                      context,
                      items,
                      (item) => _delete(context, item),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      },
    );
  }
}

/// Edit / delete menu for an item card.
class ItemMenu extends StatelessWidget {
  const ItemMenu({super.key, required this.onEdit, required this.onDelete});

  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<bool>(
      tooltip: 'Opciones',
      onSelected: (edit) => edit ? onEdit() : onDelete(),
      itemBuilder: (_) => const [
        PopupMenuItem(value: true, child: Text('Editar')),
        PopupMenuItem(value: false, child: Text('Eliminar')),
      ],
    );
  }
}
