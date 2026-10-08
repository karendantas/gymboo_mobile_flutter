import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/virtual_pet.dart';
import 'package:gymboo_app/shared/retro_button.dart';

Future<void> showPetWarningDialog(BuildContext context, VirtualPet pet) {
  return showDialog(
    context: context,
    builder: (dialogContext) {
      final palette = Theme.of(dialogContext).extension<GymbooPalette>()!;
      final textTheme = Theme.of(dialogContext).textTheme;

      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 28),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: palette.input,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: palette.backgroundDark, width: 3),
            boxShadow: [
              BoxShadow(
                color: palette.backgroundDark,
                offset: const Offset(0, 5),
                blurRadius: 0,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('🤒', style: TextStyle(fontSize: 32)),
              const SizedBox(height: 8),
              Text(
                '${pet.name} está muito doente',
                textAlign: TextAlign.center,
                style: textTheme.labelMedium?.copyWith(
                  color: palette.textPrimary,
                ),
              ),

              const SizedBox(height: 12),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: textTheme.bodyMedium?.copyWith(
                    color: palette.textSecondary,
                  ),
                  children: const [
                    TextSpan(
                      text:
                          'Seu pet está com só 1 coração. Cada dia sem treino ',
                    ),

                    TextSpan(
                      text: ' tira ainda mais pontos.\n\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          'Registre uma atividade hoje pra ele começar a se recuperar.',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              RetroButton(
                title: 'Registrar atividade',
                width: double.infinity,
                color: palette.primaryPink,
                shadowColor: palette.primaryPinkDark,
                onTap: () {
                  Navigator.of(dialogContext).pop();
                  context.push('/activities/new');
                },
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: Text(
                  'Depois',
                  style: textTheme.labelMedium?.copyWith(
                    color: palette.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
