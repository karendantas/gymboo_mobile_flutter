import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/activities/presentation/widgets/daily_activity_mission.dart';
import 'package:gymboo_app/features/goal/presentation/widgets/weekly_goal_tracker.dart';
import 'package:gymboo_app/features/home/presentation/controllers/home_controller.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/widgets/pet_hud_screen.dart';
import 'package:gymboo_app/shared/bottom_tab_retro.dart';

class Home extends ConsumerWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<GymbooPalette>()!;
    final homeAsync = ref.watch(homeDataProvider);

    return Scaffold(
      body: Column(
        children: [
    
           Center(
            child: Container(
              width: 100,
              height: 20,
              decoration: BoxDecoration(
                color: theme.backgroundDark, 
                borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(20), bottomRight: Radius.circular(20)),
              
              ),
            ),
          ),

           Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 30),
            child: homeAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Erro ao carregar dados: $err')),
            data: (home) => Column(
              children: [
                PetHudScreen(pet: home.pet, dateLabel: 'QUI - 9 OUT'),
                const SizedBox(height: 20),
                const DailyActivityMission(),
                const SizedBox(height: 20),
                WeeklyGoalTracker(goal: home.goal, weeklyProgress: home.progress),
              ],
            ),
          ),
        ),
      ),
        ],
      ),
      
      bottomNavigationBar: const   BottomTabRetro(), 
    );
  }
}