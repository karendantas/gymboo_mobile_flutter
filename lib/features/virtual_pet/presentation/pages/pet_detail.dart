import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/controllers/pet_controller.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/widgets/pet_hud_screen.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/widgets/pet_skill_card.dart';
import 'package:gymboo_app/shared/bottom_tab_retro.dart';
import 'package:gymboo_app/shared/top_detail.dart';

class PetDetailsPage extends ConsumerWidget {
  const PetDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final petAsync = ref.watch(petControllerProvider);

    return Scaffold(
      backgroundColor: palette.backgroundOuter,
      body: Column(
        children: [
          const TopDetail(),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsGeometry.only(
                left: 30,
                right: 30,
                top: 50,
              ),
              child: petAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, _) =>
                    Center(child: Text('Erro ao carregar: $err')),
                data: (pet) => Column(
                  children: [
                    PetHudScreen(pet: pet),
                    const SizedBox(height: 16),
                    for (final skill in pet.skills) ...[
                      PetSkillCard(skill: skill),
                      const SizedBox(height: 16),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: const BottomTabRetro(),
    );
  }
}
