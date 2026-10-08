import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/audio/music_controller.dart';
import 'package:gymboo_app/core/health/health_service.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:gymboo_app/features/auth/presentation/widgets/settings.dart';
import 'package:gymboo_app/features/notifications/presentation/controller/notification_controller.dart';
import 'package:gymboo_app/features/notifications/presentation/widgets/notification_tile.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/controllers/pet_log_controller.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/widgets/pet_log_tile.dart';
import 'package:gymboo_app/shared/bottom_tab_retro.dart';
import 'package:gymboo_app/shared/retro_dropdown_panel.dart';
import 'package:gymboo_app/shared/theme_picker.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;
    final user = ref.watch(authControllerProvider).value;
    final logsAsync = ref.watch(petLogControllerProvider);
    final notificationsAsync = ref.watch(notificationControllerProvider);
    final isMuted = ref.watch(musicControllerProvider);

    return Scaffold(
      backgroundColor: palette.backgroundOuter,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12),
              Center(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/user_icon.svg',
                      width: 64,
                      height: 64,
                      color: palette.primaryPinkDark,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      user?.name ?? 'Usuário',
                      style: textTheme.labelLarge?.copyWith(
                        color: palette.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      user?.email ?? 'user@email.com',
                      style: textTheme.titleMedium?.copyWith(
                        color: palette.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              const _SectionHeader(title: 'Conta', icon: Icons.person_outline),
              const SizedBox(height: 8),
              SettingsCard(
                children: [
                  SettingsTile(
                    icon: Icons.edit_outlined,
                    label: 'Editar perfil',
                    trailing: Icon(
                      Icons.chevron_right,
                      color: palette.textSecondary,
                    ),
                    onTap: () => context.push('/profile/edit'),
                  ),
                  SettingsDivider(color: palette.primaryPink),
                  SettingsTile(
                    icon: Icons.favorite_border,
                    label: 'Reconectar Health Connect',
                    trailing: Icon(
                      Icons.chevron_right,
                      color: palette.textSecondary,
                    ),
                    onTap: () async {
                      final granted = await ref
                          .read(healthServiceProvider)
                          .requestPermissions();
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            granted
                                ? 'Conectado ao Health Connect'
                                : 'Permissão não concedida',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const _SectionHeader(title: 'Preferências', icon: Icons.tune),
              const SizedBox(height: 8),
              SettingsCard(
                children: [
                  SettingsTile(
                    icon: isMuted ? Icons.volume_off : Icons.volume_up,
                    label: 'Música',
                    trailing: Switch(
                      value: !isMuted,
                      activeTrackColor: palette.primaryPink,
                      onChanged: (_) => ref
                          .read(musicControllerProvider.notifier)
                          .toggleMute(),
                    ),
                    onTap: () =>
                        ref.read(musicControllerProvider.notifier).toggleMute(),
                  ),
                  SettingsDivider(color: palette.primaryPink),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.palette_outlined,
                              size: 20,
                              color: palette.textPrimary,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Tema',
                              style: textTheme.bodyMedium?.copyWith(
                                color: palette.textPrimary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const ThemePicker(),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const _SectionHeader(title: 'Histórico', icon: Icons.history),
              const SizedBox(height: 8),
              logsAsync.when(
                loading: () => const Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (err, _) => Text(
                  'Erro ao carregar histórico',
                  style: textTheme.bodyMedium?.copyWith(color: palette.coral),
                ),
                data: (logs) => RetroDropdownPanel(
                  title: 'Histórico do Gymboo',
                  icon: Icons.history,
                  itemCount: logs.length,
                  emptyMessage: 'Nenhum evento registrado ainda',
                  itemBuilder: (context, index) => PetLogTile(log: logs[index]),
                ),
              ),
              const SizedBox(height: 12),
              notificationsAsync.when(
                loading: () => const Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (err, _) => Text(
                  'Erro ao carregar notificações',
                  style: textTheme.bodyMedium?.copyWith(color: palette.coral),
                ),
                data: (notifications) => RetroDropdownPanel(
                  title: 'Notificações',
                  icon: Icons.notifications,
                  itemCount: notifications.length,
                  emptyMessage: 'Nenhuma notificação ainda',
                  itemBuilder: (context, index) {
                    final notification = notifications[index];
                    return NotificationTile(
                      notification: notification,
                      onTap: () => ref
                          .read(notificationControllerProvider.notifier)
                          .markAsRead(notification.id),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),

              GestureDetector(
                onTap: () => ref.read(authControllerProvider.notifier).logout(),
                child: Row(
                  spacing: 6,
                  children: [
                    Icon(Icons.logout, color: palette.primaryPinkDark),
                    Text(
                      'Sair',
                      style: textTheme.labelMedium?.copyWith(
                        color: palette.primaryPinkDark,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              Center(
                child: Text(
                  'Gymboo v1.0.0',
                  style: textTheme.labelSmall?.copyWith(
                    color: palette.textSecondary,
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomTabRetro(),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Icon(icon, size: 16, color: palette.primaryPinkDark),
        const SizedBox(width: 8),
        Text(
          title.toUpperCase(),
          style: textTheme.labelMedium?.copyWith(
            color: palette.primaryPinkDark,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
