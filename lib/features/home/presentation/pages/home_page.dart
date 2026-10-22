import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/features/activities/presentation/widgets/daily_activity_mission.dart';
import 'package:gymboo_app/features/goal/presentation/widgets/weekly_goal_tracker.dart';
import 'package:gymboo_app/features/home/presentation/controllers/home_controller.dart';
import 'package:gymboo_app/features/home/presentation/widgets/ranking_button_info.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/virtual_pet.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/controllers/pet_controller.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/widgets/pet_hud_screen.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/widgets/pet_widget_service.dart';
import 'package:gymboo_app/shared/bottom_tab_retro.dart';
import 'package:gymboo_app/shared/fit_or_scroll.dart';
import 'package:gymboo_app/shared/pet_warning_modal.dart';
import 'package:gymboo_app/shared/scale_to_screen.dart';
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

    ref.listen(petControllerProvider, (prev, next) {
      final pet = next.value;
      if (pet != null) {
        ref.read(petWidgetServiceProvider).sync(context, pet);
      }
    });

    ref.listen(homeDataProvider, (previous, next) async {
      if (next.isLoading) return;
      final home = next.value;
      if (home != null) _maybeShowWarning(home.pet);
    });
    return Scaffold(
      body: FitOrScroll(
        minHeight: 700,
        builder: (context, pageScrolls) {
          final content = Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 16),
            child: homeAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) =>
                  Center(child: Text('Erro ao carregar dados: $err')),
              data: (home) => _buildBody(home, pageScrolls),
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

Widget _buildBody(HomeData home, bool pageScrolls) {
  const gap = 20.0;

  final cards = Column(
    children: [
      const DailyActivityMission(),
      const SizedBox(height: gap),
      WeeklyGoalTracker(progress: home.progress),
      const SizedBox(height: gap),
      const RankingButtonInfo(),
    ],
  );

  return Column(
    mainAxisSize: pageScrolls ? MainAxisSize.min : MainAxisSize.max,
    children: [
      ScaleToScreen(child: PetHudScreen(pet: home.pet)),
      const SizedBox(height: gap),
      if (pageScrolls)
        cards // rola junto com a página
      else
        Expanded(child: SingleChildScrollView(child: cards)), // rola só aqui
    ],
  );
}
