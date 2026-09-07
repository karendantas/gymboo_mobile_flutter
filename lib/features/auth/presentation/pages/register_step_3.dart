
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/registration_form_controller.dart';
import 'package:gymboo_app/features/auth/presentation/widgets/registration_header_steps.dart';
import 'package:gymboo_app/shared/retro_button.dart';
import 'package:gymboo_app/shared/card.dart';
import 'package:gymboo_app/shared/retro_text_field.dart';

class RegisterStep3Page extends ConsumerStatefulWidget {
  const RegisterStep3Page({super.key});

  @override
  ConsumerState<RegisterStep3Page> createState() => _RegisterStep3PageState();
}

class _RegisterStep3PageState extends ConsumerState<RegisterStep3Page> {

  Future<void> _handleFinish() async {
  
    final formNotifier = ref.read(registrationFormControllerProvider.notifier);
    final data = ref.read(registrationFormControllerProvider);

    await ref.read(authControllerProvider.notifier).createLocalProfile(
      name: data.name,
      height: data.height,
      weight: data.weight,
      petName: data.petName,
      weeklyWorkoutTarget: data.selectedDays.length,
      googleId: data.googleId,
      googleEmail: data.googleEmail,
    );

    final result = ref.read(authControllerProvider);

    if (result.hasError) {
      return;
    }

    if (result.value != null) {
      formNotifier.reset();
      if (mounted) context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;
    final formData = ref.watch(registrationFormControllerProvider);
    final isLoading = ref.watch(authControllerProvider).isLoading;

    ref.listen<AsyncValue>(authControllerProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao criar perfil: ${next.error}')),
        );
      }
    });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/bg-login.png', fit: BoxFit.cover, filterQuality: FilterQuality.none),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RegistrationStepHeader(
                    currentStep: 3,
                    onBack: () => context.go('/register/pet'),
                    title: 'QUASE LÁ',
                    subtitle: 'Confirme as informações do seu perfil',
                  ),

                
                  RetroCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('RESUMO', style: textTheme.labelMedium?.copyWith(color: palette.textPrimary)),
                        const SizedBox(height: 10),
                        _summaryRow('Nome', formData.name, textTheme, palette),
                        _summaryRow('Gymboo', formData.petName, textTheme, palette),
                        _summaryRow('Dias de treino/semana', '${formData.selectedDays.length}', textTheme, palette),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),

                  RetroButton(
                    title: isLoading ? 'Criando perfil...' : 'Concluir',
                    width: double.infinity,
                    color: const Color(0xFFEB7098),
                    shadowColor: const Color(0xFFA22D5F),
                    onTap: isLoading ? () {} : _handleFinish,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, String value, TextTheme textTheme, GymbooPalette palette) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: textTheme.bodyMedium?.copyWith(color: palette.textSecondary)),
          Text(value, style: textTheme.bodyMedium?.copyWith(color: palette.textPrimary, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}