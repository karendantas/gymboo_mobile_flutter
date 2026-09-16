import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/controllers/pet_controller.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/widgets/pet_hud_screen.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/widgets/pet_skill_card.dart';
import 'package:gymboo_app/shared/bottom_tab_retro.dart';

class PetDetailsPage extends ConsumerWidget {
  const PetDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;
    final petAsync = ref.watch(petControllerProvider);

    return Scaffold(
      backgroundColor: palette.backgroundOuter,
      body: petAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Erro ao carregar: $err')),
        data: (pet) => SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(children: [PetHudScreen(pet: pet)]),
              ),
              const SizedBox(height: 24),

              Center(
                child: Text(
                  'Habilidades',
                  style: textTheme.labelLarge?.copyWith(
                    color: palette.textSecondary,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              Column(
                spacing: 16,
                children: [
                  ...pet.skills.map((skill) => PetSkillCard(skill: skill)),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomTabRetro(),
    );
  }
}
