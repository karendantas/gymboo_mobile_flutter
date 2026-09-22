import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/controllers/wardrobe_controller.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/widgets/pet_hud_screen.dart';

import '../controllers/reward_controller.dart';
import '../widgets/reward_card.dart';

class PetWardrobePage extends ConsumerStatefulWidget {
  const PetWardrobePage({super.key});

  @override
  ConsumerState<PetWardrobePage> createState() => _PetWardrobePageState();
}

class _PetWardrobePageState extends ConsumerState<PetWardrobePage> {
  String? _loadingCode;

  Future<void> _handleTap(String code, bool alreadyEquipped) async {
    setState(() => _loadingCode = code);
    final controller = ref.read(rewardsControllerProvider.notifier);

    final success = alreadyEquipped
        ? await controller.unequip(code)
        : await controller.equip(code);

    if (!mounted) return;
    setState(() => _loadingCode = null);

    if (!success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Erro ao atualizar item')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;
    final wardrobeAsync = ref.watch(wardrobeDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Guarda-roupa',
          style: textTheme.headlineSmall?.copyWith(color: palette.textPrimary),
        ),
        backgroundColor: palette.backgroundOuter,
        centerTitle: true,
      ),
      backgroundColor: palette.backgroundOuter,
      body: wardrobeAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Erro ao carregar: $err')),
        data: (data) {
          if (data.rewards.isEmpty) {
            return Center(
              child: Text(
                'Nenhum item disponível ainda',
                style: textTheme.bodyMedium?.copyWith(
                  color: palette.textSecondary,
                ),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                PetHudScreen(pet: data.pet),
                const SizedBox(height: 24),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.85,
                        ),
                    itemCount: data.rewards.length,
                    itemBuilder: (context, index) {
                      final reward = data.rewards[index];
                      return RewardCard(
                        reward: reward,
                        isLoading: _loadingCode == reward.code,
                        onTap: () => _handleTap(reward.code, reward.equipped),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
