
import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/core/theme/gymboo_text_styles.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/widgets/pet_hud_screen.dart';
import 'package:gymboo_app/shared/bottom_tab_retro.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<GymbooPalette>();

    return Scaffold(
   
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 30),
        child: Column(
          children: [
            PetHudScreen(
                petName: 'Fofurico',
  dateLabel: 'QUI - 9 OUT',
  filledHearts: 5,
  level: 2,
  currentXp: 320,
  xpToNextLevel: 500,
            )
          
          ],
        ),
      ),
      bottomNavigationBar: const   BottomTabRetro(),
    );
  }
}