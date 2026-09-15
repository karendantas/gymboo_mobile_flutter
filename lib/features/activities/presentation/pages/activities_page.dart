import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/activities/presentation/controllers/activities_controller.dart';
import 'package:gymboo_app/shared/bottom_tab_retro.dart';
import 'package:gymboo_app/shared/retro_button.dart';
import '../widgets/activity_card.dart';

class ActivitiesPage extends ConsumerWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;
    final activitiesAsync = ref.watch(activitiesControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Minhas atividades',
                    style: textTheme.headlineSmall?.copyWith(
                      color: palette.textSecondary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.push('/activities/new'),
                    child: Container(
                      width: 36,
                      height: 36,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: palette.primaryPink,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Expanded(
                child: activitiesAsync.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (err, _) => Center(
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
                          onTap: () => ref
                              .read(activitiesControllerProvider.notifier)
                              .refresh(),
                        ),
                      ],
                    ),
                  ),
                  data: (activities) {
                    if (activities.isEmpty) {
                      return Center(
                        child: Text(
                          'Nenhuma atividade registrada ainda.\nToque no + para adicionar!',
                          textAlign: TextAlign.center,
                          style: textTheme.bodyMedium?.copyWith(
                            color: palette.textSecondary,
                          ),
                        ),
                      );
                    }

                    return RefreshIndicator(
                      onRefresh: () => ref
                          .read(activitiesControllerProvider.notifier)
                          .refresh(),
                      child: ListView.builder(
                        itemCount: activities.length,
                        itemBuilder: (context, index) {
                          final activity = activities[index];
                          return ActivityCard(
                            activity: activity,
                            onTap: () => context.push(
                              '/activities/${activity.id}/edit',
                              extra: activity,
                            ),
                            onDelete: () =>
                                _confirmDelete(context, ref, activity.id),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomTabRetro(),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    int id,
  ) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Excluir atividade?'),
        content: const Text('Essa ação não pode ser desfeita.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
    if (confirm == true) {
      await ref.read(activitiesControllerProvider.notifier).delete(id);
    }
  }
}
