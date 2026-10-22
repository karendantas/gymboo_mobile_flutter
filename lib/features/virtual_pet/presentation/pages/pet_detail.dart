import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/virtual_pet.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/controllers/pet_controller.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/widgets/pet_hud_screen.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/widgets/pet_skill_card.dart';
import 'package:gymboo_app/shared/bottom_tab_retro.dart';
import 'package:gymboo_app/shared/fit_or_scroll.dart';
import 'package:gymboo_app/shared/retro_button.dart';
import 'package:gymboo_app/shared/scale_to_screen.dart';
import 'package:gymboo_app/shared/top_detail.dart';

class PetDetailsPage extends ConsumerStatefulWidget {
  const PetDetailsPage({super.key});

  @override
  ConsumerState<PetDetailsPage> createState() => _PetDetailsPageState();
}

class _PetDetailsPageState extends ConsumerState<PetDetailsPage> {
  Widget _buildDetails(VirtualPet pet, bool pageScrolls) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textStyle = Theme.of(context).textTheme;

    final cards = Column(
      children: [
        Row(
          children: [
            Expanded(
              child: RetroButton(
                title: 'Roupas',
                imagePath: 'assets/images/hanger_icon.png',
                color: palette.primaryPink,
                shadowColor: palette.primaryPinkDark,
                onTap: () => context.push('/pet/wardrobe'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: RetroButton(
                title: 'Jogos',
                imagePath: 'assets/images/controller.png',
                color: palette.primaryPink,
                shadowColor: palette.primaryPinkDark,
                onTap: () => context.go('/jump-rope'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),

        Text(
          'HABILIDADES',
          style: textStyle.labelLarge?.copyWith(color: palette.primaryPinkDark),
        ),
        const SizedBox(height: 10),
        for (final skill in pet.skills) ...[
          PetSkillCard(skill: skill),
          const SizedBox(height: 15),
        ],

        const SizedBox(height: 20),
        RetroButton(
          title: 'Editar Gymboo',
          width: double.infinity,
          color: palette.primaryPink,
          shadowColor: palette.primaryPinkDark,
          onTap: () => context.push('/edit/pet'),
        ),

        const SizedBox(height: 30),
      ],
    );
    return Column(
      mainAxisSize: pageScrolls ? MainAxisSize.min : MainAxisSize.max,
      children: [
        ScaleToScreen(child: PetHudScreen(pet: pet)),
        const SizedBox(height: 16),
        if (pageScrolls)
          cards
        else
          Expanded(child: SingleChildScrollView(child: cards)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final petAsync = ref.watch(petControllerProvider);

    return Scaffold(
      backgroundColor: palette.backgroundOuter,
      body: FitOrScroll(
        minHeight: 700,
        builder: (context, pageScrolls) {
          final content = Padding(
            padding: const EdgeInsetsGeometry.only(
              left: 30,
              right: 30,
              top: 50,
            ),
            child: petAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(child: Text('Erro ao carregar: $err')),
              data: (pet) {
                return _buildDetails(pet, pageScrolls);
              },
            ),
          );

          return Column(
            mainAxisSize: pageScrolls ? MainAxisSize.min : MainAxisSize.max,
            children: [
              const TopDetail(),
              if (pageScrolls) content else Expanded(child: content),
            ],
          );
        },
      ),

      bottomNavigationBar: const BottomTabRetro(),
    );
  }
}
