import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/ranking/data/ranking_repository.dart';
import 'package:gymboo_app/features/ranking/presentation/widgets/podium.dart';
import 'package:gymboo_app/features/ranking/presentation/widgets/ranking_tile.dart';
import 'package:gymboo_app/shared/retro_button.dart';

class RankingPage extends ConsumerWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;
    final rankingAsync = ref.watch(rankingProvider);

    return Scaffold(
      backgroundColor: palette.backgroundOuter,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: palette.textPrimary),
                    onPressed: () => context.go('/home'),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/trophy.png',
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.none,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'RANKING',
                          style: textTheme.headlineSmall?.copyWith(
                            color: palette.primaryPinkDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: rankingAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, _) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Não foi possível carregar o ranking',
                          textAlign: TextAlign.center,
                          style: textTheme.bodyMedium?.copyWith(
                            color: palette.coral,
                          ),
                        ),
                        const SizedBox(height: 16),
                        RetroButton(
                          title: 'Tentar de novo',
                          color: palette.primaryPink,
                          shadowColor: palette.primaryPinkDark,
                          onTap: () => ref.invalidate(rankingProvider),
                        ),
                      ],
                    ),
                  ),
                ),
                data: (entries) {
                  if (entries.isEmpty) {
                    return Center(
                      child: Text(
                        'Ninguém no ranking ainda',
                        style: textTheme.bodyMedium?.copyWith(
                          color: palette.textSecondary,
                        ),
                      ),
                    );
                  }

                  final rest = entries.skip(3).toList();
                  final userIsListed = entries.any((e) => e.currentUser);

                  return RefreshIndicator(
                    onRefresh: () => ref.refresh(rankingProvider.future),
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                      children: [
                        Podium(entries: entries.take(3).toList()),
                        const SizedBox(height: 24),
                        for (final entry in rest) RankingTile(entry: entry),
                        if (!userIsListed)
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              'Você ainda não está entre os primeiros colocados.\nContinue treinando!',
                              textAlign: TextAlign.center,
                              style: textTheme.labelSmall?.copyWith(
                                color: palette.textSecondary,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
