
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/shared/button_retro.dart';

class BottomTabRetro extends StatelessWidget {
  const BottomTabRetro({super.key});

  @override
  Widget build(BuildContext context) {
  final theme = Theme.of(context).extension<GymbooPalette>()!;

    return 
        Container(
        height: 150,
        decoration: BoxDecoration(
          color: theme.backgroundOuter,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)
          )
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
           
               RetroButton(
                  imagePath: 'assets/icons/home_icon.svg', 
                  color: theme.primaryPink , 
                  shadowColor: theme.primaryPinkDark, 
                  paddingBottom: 40,
                  onTap: () => context.go('/home')
                  ),
                
             RetroButton(
                  imagePath: 'assets/icons/pet_icon.svg', 
                  color: theme.primaryPink  , 
                  shadowColor: theme.primaryPinkDark , 
                  paddingTop: 20,
                  onTap: () => {}
                  ),
                
      
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Image.asset(
                        'assets/images/console_effects.png',
                        width: 64,
                        height: 40,
                        
                    ),
                  ),
      
                 RetroButton(
                  imagePath: 'assets/icons/dumbell_icon.svg', 
                  color: theme.primaryPink , 
                  shadowColor: theme.primaryPinkDark, 
                  paddingTop: 20,
                  onTap: () => context.go('/activities')),
                
             RetroButton(
                  imagePath: 'assets/icons/user_icon.svg', 
                  color: theme.primaryPink, 
                  shadowColor: theme.primaryPinkDark, 
                    paddingBottom: 40,
                  onTap: () => {}
                  ),
                  
            ],
            ),
           
            Center(
            child: Container(
              width: 100,
              height: 20,
              decoration: BoxDecoration(
                color: theme.backgroundDark, 
                borderRadius: BorderRadius.only(topLeft:  Radius.circular(20), topRight: Radius.circular(20)),
              ),
            ),
          ),
          ],
        )
      ); 
  }

}