import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/features/activities/presentation/widgets/daily_activity_mission.dart';
import 'package:gymboo_app/features/goal/presentation/widgets/weekly_goal_tracker.dart';
import 'package:gymboo_app/features/home/presentation/controllers/home_controller.dart';
import 'package:gymboo_app/features/home/presentation/widgets/ranking_button_info.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/virtual_pet.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/widgets/pet_hud_screen.dart';
import 'package:gymboo_app/shared/bottom_tab_retro.dart';
import 'package:gymboo_app/shared/pet_warning_modal.dart';
import 'package:gymboo_app/shared/top_detail.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  bool _warningOpen = false;

  Future<void> _maybeShowWarning(VirtualPet pet) async {
    if (_warningOpen || !mounted || pet.life > 1) return;

    _warningOpen = true;
    await showPetWarningDialog(context, pet);
    _warningOpen = false;
  }

  @override
  Widget build(BuildContext context) {
    final homeAsync = ref.watch(homeDataProvider);

    ref.listen(homeDataProvider, (previous, next) async {
      if (next.isLoading) return;
      final home = next.value;
      if (home != null) _maybeShowWarning(home.pet);
    });
    return Scaffold(
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
              child: homeAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) =>
                    Center(child: Text('Erro ao carregar dados: $err')),
                data: (home) => Column(
                  children: [
                    PetHudScreen(pet: home.pet),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const DailyActivityMission(),
                            const SizedBox(height: 20),
                            WeeklyGoalTracker(progress: home.progress),
                            const SizedBox(height: 20),
                            const RankingButtonInfo(),
                          ],
                        ),
                      ),
                    ),
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
