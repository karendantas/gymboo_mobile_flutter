import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:gymboo_app/shared/google_button.dart';
import 'package:gymboo_app/shared/retro_button.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  bool _connectingGoogle = false;

  Future<void> _handleGoogleLogin() async {
    setState(() => _connectingGoogle = true);

    await ref.read(authControllerProvider.notifier).loginWithGoogle();

    if (mounted) {
      setState(() => _connectingGoogle = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;

    final textTheme = Theme.of(context).textTheme;

    ref.listen<AsyncValue>(authControllerProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao entrar com Google: ${next.error}')),
        );
      }
    });

    return Scaffold(
      backgroundColor: palette.backgroundOuter,

      body: Stack(
        children: [
          Image.asset(
            'assets/images/login_bg.png',
            fit: BoxFit.cover,
            filterQuality: FilterQuality.none,
            height: double.infinity,
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),

              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/logo3.png',
                            width: 360,
                            height: 170,
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.none,
                          ),

                          const SizedBox(height: 4),
                          Image.asset(
                            'assets/images/pet_icon.png',
                            width: 235,
                            height: 260,
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.none,
                          ),

                          const SizedBox(height: 4),

                          Text(
                            'cuide do seu bichinho,\n'
                            'cuide de você',
                            textAlign: TextAlign.center,
                            style: textTheme.labelSmall?.copyWith(
                              color: palette.textSecondary,
                              fontWeight: FontWeight.w600,
                              height: 1.35,
                            ),
                          ),

                          const SizedBox(height: 28),

                          RetroButton(
                            title: 'Entrar com e-mail',
                            width: double.infinity,
                            color: palette.primaryPink,
                            shadowColor: palette.primaryPinkDark,
                            onTap: () => context.go('/login'),
                          ),

                          const SizedBox(height: 14),
                          RetroButton(
                            title: 'Cadastrar',
                            width: double.infinity,
                            color: palette.backgroundOuter,
                            shadowColor: palette.backgroundDark,
                            textColor: palette.textPrimary,
                            onTap: () => context.go('/register'),
                          ),

                          const SizedBox(height: 18),

                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: palette.primaryPinkDark.withValues(
                                    alpha: 0.45,
                                  ),
                                  thickness: 1,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Text(
                                  'OU',
                                  style: textTheme.labelSmall?.copyWith(
                                    color: palette.textSecondary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              Expanded(
                                child: Divider(
                                  color: palette.primaryPinkDark.withValues(
                                    alpha: 0.45,
                                  ),
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 14),

                          GoogleButton(
                            isLoading: _connectingGoogle,
                            palette: palette,
                            textTheme: textTheme,
                            onTap: _connectingGoogle
                                ? null
                                : _handleGoogleLogin,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    Text(
                      'Ao continuar, você concorda com nossos',
                      textAlign: TextAlign.center,
                      style: textTheme.labelSmall?.copyWith(
                        color: palette.textSecondary,
                        fontSize: 10,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        GestureDetector(
                          onTap: () {
                            // TODO: abrir termos de uso
                          },
                          child: Text(
                            'Termos de Uso',
                            style: textTheme.labelSmall?.copyWith(
                              color: palette.brandPurple,
                              fontSize: 10,
                              decoration: TextDecoration.underline,
                              decorationColor: palette.brandPurple,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
