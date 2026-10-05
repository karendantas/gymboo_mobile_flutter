import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/registration_form_controller.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/virtual_pet.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/controllers/pet_controller.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/widgets/pet_hud_screen.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/widgets/pet_skill_card.dart';
import 'package:gymboo_app/shared/bottom_tab_retro.dart';
import 'package:gymboo_app/shared/retro_button.dart';
import 'package:gymboo_app/shared/retro_tabbed.dart';
import 'package:gymboo_app/shared/top_detail.dart';

class PetDetailsPage extends ConsumerStatefulWidget {
  const PetDetailsPage({super.key});

  @override
  ConsumerState<PetDetailsPage> createState() => _PetDetailsPageState();
}

class _PetDetailsPageState extends ConsumerState<PetDetailsPage> {
  PetColorOption? selectedColor;
  final petNameController = TextEditingController();

  PetColorOption? colorFromString(String? color) {
    if (color == null) return null;

    return PetColorOption.values.firstWhere(
      (option) => option.name == color,
      orElse: () => PetColorOption.purple,
    );
  }

  @override
  void dispose() {
    petNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textStyle = Theme.of(context).textTheme;
    final petAsync = ref.watch(petControllerProvider);

    const colorSwatches = {
      PetColorOption.purple: Color.fromARGB(255, 181, 143, 243),
      PetColorOption.green: Color(0xFF8FD98F),
      PetColorOption.yellow: Color(0xFFF7D35C),
    };

    void handleEditPet(VirtualPet pet) {
      if (petNameController.text.trim() != pet.name) {
        ref
            .read(petControllerProvider.notifier)
            .edit(name: petNameController.text.trim());
      }
      if (selectedColor?.name != pet.type) {
        ref
            .read(petControllerProvider.notifier)
            .edit(type: selectedColor?.name);
      }
    }

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
                data: (pet) {
                  selectedColor ??= colorFromString(pet.type);

                  return Column(
                    children: [
                      PetHudScreen(pet: pet),
                      const SizedBox(height: 16),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: RetroButton(
                                      title: 'Roupas',
                                      imagePath:
                                          'assets/images/hanger_icon.png',
                                      color: palette.primaryPink,
                                      shadowColor: palette.primaryPinkDark,
                                      onTap: () =>
                                          context.push('/pet/wardrobe'),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: RetroButton(
                                      title: 'Jogos',
                                      imagePath: 'assets/images/controller.png',
                                      color: palette.primaryPink,
                                      shadowColor: palette.primaryPinkDark,
                                      onTap: () => context.go('/mini_games'),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),

                              Text(
                                'HABILIDADES',
                                style: textStyle.labelLarge?.copyWith(
                                  color: palette.primaryPinkDark,
                                ),
                              ),
                              const SizedBox(height: 10),
                              for (final skill in pet.skills) ...[
                                PetSkillCard(skill: skill),
                                const SizedBox(height: 15),
                              ],

                              const SizedBox(height: 20),
                              Text(
                                'PERSONALIZAR',
                                style: textStyle.labelLarge?.copyWith(
                                  color: palette.primaryPinkDark,
                                ),
                              ),
                              const SizedBox(height: 20),
                              RetroTabbedField(
                                label: 'Renomear pet',
                                labelIcon: Icons.edit,
                                hintText: pet.name,
                                controller: petNameController,
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: PetColorOption.values.map((option) {
                                  final isSelected = selectedColor == option;
                                  return GestureDetector(
                                    onTap: () =>
                                        setState(() => selectedColor = option),
                                    child: Container(
                                      width: 56,
                                      height: 56,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: colorSwatches[option],
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: isSelected
                                              ? palette.primaryPinkDark
                                              : Colors.transparent,
                                          width: 3,
                                        ),
                                      ),
                                      child: isSelected
                                          ? const Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: 20,
                                            )
                                          : null,
                                    ),
                                  );
                                }).toList(),
                              ),

                              const SizedBox(height: 20),
                              RetroButton(
                                title: 'Salvar',
                                width: double.infinity,
                                color: palette.primaryPink,
                                shadowColor: palette.primaryPinkDark,
                                onTap: () => handleEditPet(pet),
                              ),

                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: const BottomTabRetro(),
    );
  }
}
