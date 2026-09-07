import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/backup/backup_controller.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/registration_form_controller.dart';
import 'package:gymboo_app/shared/retro_button.dart';
import 'package:gymboo_app/shared/card.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  bool _connectingGoogle = false;

  Future<void> _handleGoogleConnect() async {
    setState(() => _connectingGoogle = true);
    final result = await ref.read(backupControllerProvider.notifier).connectGoogleAndCheckBackup();
    if (!mounted) return;
    setState(() => _connectingGoogle = false);

    switch (result.outcome) {
      case GoogleConnectOutcome.cancelled:
        break; // usuário fechou o seletor de conta, não faz nada
      case GoogleConnectOutcome.restored:
        context.go('/home');
      case GoogleConnectOutcome.noBackupFound:
        final account = result.accountInfo!;
        ref.read(registrationFormControllerProvider.notifier).setGoogleAccount(
              id: account.id,
              email: account.email,
            );
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nenhum backup encontrado. Vamos criar seu perfil!')),
        );
        context.go('/register');
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/bg-login.png', fit: BoxFit.cover, filterQuality: FilterQuality.none),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/pet_purple_neutral.png',
                    width: 180,
                    height: 180,
                    filterQuality: FilterQuality.none,
                  ),
                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Image.asset('assets/images/heart_filled.png', width: 20, height: 20, filterQuality: FilterQuality.none),
                      Text('GYMBOO', style: textTheme.headlineLarge?.copyWith(color: palette.primaryPinkDark)),
                      Image.asset('assets/images/heart_filled.png', width: 20, height: 20, filterQuality: FilterQuality.none),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Cuide do seu bichinho,\ncuide de você.',
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium?.copyWith(color: palette.textSecondary),
                  ),
                  const SizedBox(height: 36),

                  RetroCard(
                    color: palette.surface,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Já jogou antes?',
                          textAlign: TextAlign.center,
                          style: textTheme.labelMedium?.copyWith(color: palette.textPrimary),
                        ),
                        const SizedBox(height: 10),
                        RetroButton(
                          title: _connectingGoogle ? 'Conectando...' : 'Entrar com Google',
                          width: double.infinity,
                          color: palette.surface,
                          shadowColor: palette.divider,
                          onTap: _connectingGoogle ? () {} : _handleGoogleConnect,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Recupera seu progresso salvo automaticamente',
                          textAlign: TextAlign.center,
                          style: textTheme.labelSmall?.copyWith(color: palette.textSecondary),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(child: Divider(color: palette.divider)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text('ou', style: textTheme.labelSmall?.copyWith(color: palette.textSecondary)),
                      ),
                      Expanded(child: Divider(color: palette.divider)),
                    ],
                  ),
                  const SizedBox(height: 16),

                  RetroButton(
                    title: 'Criar novo perfil',
                    width: double.infinity,
                    color: palette.primaryPink,
                    shadowColor: palette.primaryPinkDark,
                    onTap: () => context.go('/register'),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sem conta necessária — tudo fica salvo\nsó neste aparelho',
                    textAlign: TextAlign.center,
                    style: textTheme.labelSmall?.copyWith(color: palette.textSecondary),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}