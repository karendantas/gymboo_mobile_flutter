import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/legal/data/legal_repository.dart';

class TermsPage extends ConsumerWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;
    final termsAsync = ref.watch(termsProvider);

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
                    onPressed: () => context.pop(),
                  ),
                  Expanded(
                    child: Text(
                      'Termos de Uso',
                      textAlign: TextAlign.center,
                      style: textTheme.headlineSmall?.copyWith(
                        color: palette.textSecondary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            Expanded(
              child: termsAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (_, _) => Center(
                  child: Text(
                    'Não foi possível carregar os termos',
                    style: textTheme.bodyMedium?.copyWith(color: palette.coral),
                  ),
                ),
                data: (doc) => ListView(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
                  children: [
                    Text(
                      'Versão ${doc.version} · atualizado em ${doc.updatedAt}',
                      style: textTheme.labelSmall?.copyWith(
                        color: palette.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    for (final s in doc.sections) ...[
                      Text(
                        s.title,
                        style: textTheme.titleSmall?.copyWith(
                          color: palette.primaryPinkDark,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        s.body,
                        style: textTheme.bodyMedium?.copyWith(
                          color: palette.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
