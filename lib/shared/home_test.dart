
import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/core/theme/gymboo_text_styles.dart';
import 'package:gymboo_app/features/activities/presentation/widgets/daily_activity_mission.dart';
import 'package:gymboo_app/features/goal/domain/models/goal.dart';
import 'package:gymboo_app/features/goal/domain/models/weekly_progress.dart';
import 'package:gymboo_app/features/goal/presentation/widgets/weekly_goal_tracker.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/virtual_pet.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/widgets/pet_hud_screen.dart';
import 'package:gymboo_app/shared/bottom_tab_retro.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<GymbooPalette>()!;

    final petHudMockHealthy = VirtualPet(
  id: 'mock-1',
  name: 'Fofurin',
  life: 100,
  energy: 80,
  thirst: 60,
  level: 4,
  points: 320,
  xpToNextLevel: 500,
);


final mockGoal = Goal(
  id: 'goal-1',
  weeklyWorkoutTarget: 3,
  dailyWaterGoalMl: 1000
);
 

  final mockWeeklyProgress = WeeklyProgress(
  completedByDay: {
    Weekday.seg: true,
    Weekday.ter: false,
    Weekday.qua: true,
    Weekday.qui: true,
    Weekday.sex: false,
    Weekday.sab: false,
    Weekday.dom: false,
  },
);

    return Scaffold(
   
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 30),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 20,
              color: theme.backgroundDark,
       
            ),
            PetHudScreen(
                pet: petHudMockHealthy,
                dateLabel: 'QUI - 9 OUT',
               
            ),

            const SizedBox(height: 20,),

            DailyActivityMission(),

              const SizedBox(height: 20,),

              WeeklyGoalTracker(goal: mockGoal, weeklyProgress: mockWeeklyProgress,),

       
          ],
        ),
      ),
      bottomNavigationBar: const   BottomTabRetro(),
    );
  }
}