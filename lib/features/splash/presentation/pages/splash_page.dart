import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:gymboo_app/shared/retro_button.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
 
  bool _isNavigating = false;

  Future<void> _handleStart() async {
    if (_isNavigating) return;
    setState(() => _isNavigating = true);


    final authNotifier = ref.read(authControllerProvider.notifier);
    while (ref.read(authControllerProvider).isLoading) {
      await Future.delayed(const Duration(milliseconds: 50));
    }

    final isLoggedIn = ref.read(authControllerProvider).value != null;

    if (!mounted) return;
    context.go(isLoggedIn ? '/home' : '/login');
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: palette.backgroundOuter,
      body: Stack(
          fit: StackFit.expand,
        children: [
             Image.asset(
          'assets/images/login_bg.png',
          fit: BoxFit.cover,
          filterQuality: FilterQuality.none,
        ),
          SafeArea(
            
            child: Center(
              child: Column(
          
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                  const SizedBox(height: 12),
                     Image.asset(
                        'assets/images/logo.png',
                        width: 400,
                        height: 200,
                         fit: BoxFit.contain,
                        filterQuality: FilterQuality.none,
                      ),
               
                  const SizedBox(height: 6),
                    Image.asset(
                    'assets/images/pet_purple_default.png',
                    width: 250,
                    height: 290,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.none,
                  ),
                    const SizedBox(height: 6),
                  Text(
                    'cuide do seu bichinho, cuide de você',
                    style: textTheme.labelSmall?.copyWith(color: palette.textSecondary),
                  ),
                  const SizedBox(height: 48),
                  _isNavigating
                      ? const CircularProgressIndicator()
                      : RetroButton(
                          title: 'INICIAR',
                          width: 220,
                          color: palette.primaryPink,
                          shadowColor: palette.primaryPinkDark,
                          onTap: _handleStart,
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