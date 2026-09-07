import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/backup/backup_controller.dart';
import 'package:gymboo_app/core/backup/backup_providers.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/shared/retro_button.dart';
import 'package:intl/intl.dart';

class BackupPage extends ConsumerWidget {
  const BackupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;
    final backupState = ref.watch(backupControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Backup')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Conecte sua conta Google pra salvar seu progresso na nuvem '
              '(sem custo, usa seu próprio Google Drive).',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),

            if (backupState.hasValue && backupState.value != null)
              Text(
                'Último backup: ${DateFormat('dd/MM/yyyy HH:mm').format(backupState.value!)}',
                style: textTheme.labelMedium?.copyWith(color: palette.textSecondary),
              ),

            const SizedBox(height: 16),

            RetroButton(
              title: backupState.isLoading ? 'Salvando...' : 'Fazer backup agora',
              width: double.infinity,
              color: palette.primaryPink,
              shadowColor: palette.primaryPinkDark,
              onTap: backupState.isLoading
                  ? () {}
                  : () async {
                      final success = await ref.read(backupControllerProvider.notifier).backupNow();
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(success ? 'Backup salvo com sucesso!' : 'Falha ao salvar backup')),
                      );
                    },
            ),
            const SizedBox(height: 12),

            RetroButton(
              title: 'Restaurar backup',
              width: double.infinity,
              color: palette.goldAccentDark,
              shadowColor: palette.goldAccent,
              onTap: () async {
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Restaurar backup?'),
                    content: const Text('Isso substitui os dados locais pelos dados salvos no Google Drive.'),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancelar')),
                      TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Restaurar')),
                    ],
                  ),
                );
                if (confirm != true) return;

                await ref.read(backupControllerProvider.notifier).restoreIfNeeded();
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Restauração concluída (se havia backup salvo).')),
                );
              },
            ),
            RetroButton(
  title: 'Debug: ver conteúdo salvo',
  width: double.infinity,
  color: palette.surfaceAlt,
  shadowColor: palette.divider,
  onTap: () async {
    final data = await ref.read(backupServiceProvider).downloadBackup();

    if (!context.mounted) return;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Conteúdo do backup'),
        content: SingleChildScrollView(
          child: Text(data?.toString() ?? 'Nenhum backup encontrado no Drive.'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Fechar')),
        ],
      ),
    );
  },
),
          ],
        ),
      ),
    );
  }
}