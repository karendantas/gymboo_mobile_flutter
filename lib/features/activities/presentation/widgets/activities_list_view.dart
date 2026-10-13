import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/core/util/date_format.dart';
import 'package:gymboo_app/features/activities/domain/models/activity.dart';
import 'package:gymboo_app/features/activities/domain/models/activity_category.dart';
import 'package:gymboo_app/features/activities/domain/models/activity_category_display.dart';
import 'package:gymboo_app/features/activities/presentation/controllers/activities_filter_controller.dart';
import 'package:gymboo_app/features/activities/presentation/controllers/activities_list_controller.dart';
import 'package:gymboo_app/features/activities/presentation/widgets/filter_box.dart';
import 'package:gymboo_app/shared/retro_button.dart';

import 'activity_card.dart';

class ActivitiesListView extends ConsumerStatefulWidget {
  const ActivitiesListView({
    super.key,
    required this.onTap,
    required this.onDelete,
  });

  final void Function(Activity activity) onTap;
  final void Function(Activity activity) onDelete;

  @override
  ConsumerState<ActivitiesListView> createState() => _ActivitiesListViewState();
}

class _ActivitiesListViewState extends ConsumerState<ActivitiesListView> {
  final _scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      if (_scroll.position.pixels >= _scroll.position.maxScrollExtent - 200) {
        ref.read(activitiesListControllerProvider.notifier).loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final current = ref.read(activitiesFilterProvider).from;
    final picked = await showDatePicker(
      context: context,
      initialDate: current ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      ref
          .read(activitiesFilterProvider.notifier)
          .setRange(DateTimeRange(start: picked, end: picked));
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;
    final filter = ref.watch(activitiesFilterProvider);
    final async = ref.watch(activitiesListControllerProvider);
    final filterNotifier = ref.read(activitiesFilterProvider.notifier);

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: PopupMenuButton<String>(
                position: PopupMenuPosition.under,
                offset: const Offset(0, 8),
                color: palette.input,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: palette.primaryPink, width: 2),
                ),
                onSelected: (v) => filterNotifier.setCategory(
                  v == 'ALL' ? null : ActivityCategory.values.byName(v),
                ),
                itemBuilder: (_) => [
                  const PopupMenuItem(value: 'ALL', child: Text('Todas')),
                  for (final c in ActivityCategory.values)
                    PopupMenuItem(value: c.name, child: Text(c.label)),
                ],
                child: FilterBox(
                  label: filter.category?.label ?? 'Categoria',
                  active: filter.category != null,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: GestureDetector(
                onTap: _pickDate,
                child: FilterBox(
                  label: filter.from == null
                      ? 'Data'
                      : '${formatShortDate(filter.from!)} – ${formatShortDate(filter.to!)}',
                  icon: Icons.calendar_month,
                  active: filter.from != null,
                ),
              ),
            ),
            if (!filter.isEmpty) ...[
              const SizedBox(width: 4),
              IconButton(
                onPressed: filterNotifier.clear,
                icon: Icon(Icons.close, color: palette.coral),
                visualDensity: VisualDensity.compact,
                tooltip: 'Limpar filtros',
              ),
            ],
          ],
        ),
        const SizedBox(height: 12),
        const SizedBox(height: 8),

        Expanded(
          child: Stack(
            children: [
              async.when(
                skipLoadingOnReload: true,
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (_, _) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Erro ao carregar atividades',
                        style: textTheme.bodyMedium?.copyWith(
                          color: palette.coral,
                        ),
                      ),
                      const SizedBox(height: 12),
                      RetroButton(
                        title: 'Tentar de novo',
                        color: palette.primaryPink,
                        shadowColor: palette.primaryPinkDark,
                        onTap: () =>
                            ref.invalidate(activitiesListControllerProvider),
                      ),
                    ],
                  ),
                ),
                data: (s) {
                  if (s.items.isEmpty) {
                    return Center(
                      child: Text(
                        filter.isEmpty
                            ? 'Nenhuma atividade registrada ainda.\nToque no + para adicionar!'
                            : 'Nenhuma atividade com esses filtros',
                        textAlign: TextAlign.center,
                        style: textTheme.bodyMedium?.copyWith(
                          color: palette.textSecondary,
                        ),
                      ),
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: () =>
                        ref.refresh(activitiesListControllerProvider.future),
                    child: ListView.builder(
                      controller: _scroll,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: s.items.length + (s.hasMore ? 1 : 0),
                      itemBuilder: (context, i) {
                        if (i == s.items.length) {
                          return const Padding(
                            padding: EdgeInsets.all(16),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                        final activity = s.items[i];
                        return ActivityCard(
                          activity: activity,
                          onTap: () => widget.onTap(activity),
                          onDelete: () => widget.onDelete(activity),
                        );
                      },
                    ),
                  );
                },
              ),
              if (async.isReloading)
                Positioned.fill(
                  child: ColoredBox(
                    color: palette.backgroundOuter.withValues(alpha: 0.6),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
