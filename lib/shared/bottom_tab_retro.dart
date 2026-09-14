import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/shared/retro_bottom_button.dart';
import 'package:gymboo_app/shared/vertical_fitbox.dart';

class BottomTabRetro extends StatelessWidget {
  const BottomTabRetro({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<GymbooPalette>()!;

    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: theme.backgroundOuter,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: VerticalFitBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RetroBottomButton(
                  imagePath: 'assets/icons/home_icon.svg',
                  color: theme.primaryPink,
                  shadowColor: theme.primaryPinkDark,
                  paddingBottom: 40,
                  onTap: () => context.go('/home'),
                ),

                RetroBottomButton(
                  imagePath: 'assets/icons/pet_icon.svg',
                  color: theme.primaryPink,
                  shadowColor: theme.primaryPinkDark,
                  paddingTop: 20,
                  onTap: () => {},
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Image.asset(
                    'assets/images/console_effects.png',
                    width: 64,
                    height: 40,
                  ),
                ),

                RetroBottomButton(
                  imagePath: 'assets/icons/dumbell_icon.svg',
                  color: theme.primaryPink,
                  shadowColor: theme.primaryPinkDark,
                  paddingTop: 20,
                  onTap: () => context.go('/activities'),
                ),

                RetroBottomButton(
                  imagePath: 'assets/icons/user_icon.svg',
                  color: theme.primaryPink,
                  shadowColor: theme.primaryPinkDark,
                  paddingBottom: 40,
                  onTap: () => {context.go('/profile')},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
