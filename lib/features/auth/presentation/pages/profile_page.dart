import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/controllers/pet_log_controller.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/widgets/pet_log_tile.dart';
import 'package:gymboo_app/shared/bottom_tab_retro.dart';
import 'package:gymboo_app/shared/retro_button.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;
    final user = ref.watch(authControllerProvider).value;
    final logsAsync = ref.watch(petLogControllerProvider);

    return Scaffold(
      backgroundColor: palette.backgroundOuter,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              SvgPicture.asset(
                'assets/icons/user_icon.svg',
                width: 64,
                height: 64,
                color: palette.primaryPinkDark,
              ),

              const SizedBox(height: 12),

              Text(
                user?.name ?? '',
                style: textTheme.labelLarge?.copyWith(
                  color: palette.textPrimary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                user?.email ?? '',
                style: textTheme.titleMedium?.copyWith(
                  color: palette.textSecondary,
                ),
              ),

              const SizedBox(height: 16),

              RetroButton(
                title: 'Sair',
                width: double.infinity,
                color: palette.coral,
                shadowColor: palette.primaryPinkDark,
                onTap: () => ref.read(authControllerProvider.notifier).logout(),
              ),
              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: palette.primaryPink,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: palette.primaryPinkDark, width: 2),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.history, color: Colors.white, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      'HISTÓRICO DO GYMBOO',
                      style: textTheme.labelMedium?.copyWith(
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              Expanded(
                child: logsAsync.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (err, _) => Center(
                    child: Text(
                      'Erro ao carregar histórico',
                      style: textTheme.bodyMedium?.copyWith(
                        color: palette.coral,
                      ),
                    ),
                  ),
                  data: (logs) {
                    if (logs.isEmpty) {
                      return Center(
                        child: Text(
                          'Nenhum evento registrado ainda',
                          style: textTheme.bodyMedium?.copyWith(
                            color: palette.textSecondary,
                          ),
                        ),
                      );
                    }
                    return RefreshIndicator(
                      onRefresh: () =>
                          ref.refresh(petLogControllerProvider.future),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: palette.surface,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: palette.divider, width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: palette.divider,
                              offset: const Offset(0, 4),
                              blurRadius: 0,
                            ),
                          ],
                        ),
                        child: ListView.builder(
                          itemCount: logs.length,

                          itemBuilder: (context, index) =>
                              PetLogTile(log: logs[index]),
                        ),
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
}
