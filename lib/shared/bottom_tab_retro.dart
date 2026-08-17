
import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/shared/button_retro.dart';

class BottomTabRetro extends StatelessWidget {
  const BottomTabRetro({super.key});

  @override
  Widget build(BuildContext context) {
  final theme = Theme.of(context).extension<GymbooPalette>();

    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: theme?.backgroundOuter,
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
                color: theme?.primaryPink ?? const Color(0xFFD67398) , 
                shadowColor: theme?.primaryPinkDark ?? const Color(0xFF91365A), 
                paddingBottom: 30,
                onTap: () => {}
                ),
              
            

           
           RetroButton(
                imagePath: 'assets/icons/pet_icon.svg', 
                color: theme?.primaryPink ?? const Color(0xFFD67398) , 
                shadowColor: theme?.primaryPinkDark ?? const Color(0xFF91365A), 
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
                color: theme?.primaryPink ?? const Color(0xFFD67398) , 
                shadowColor: theme?.primaryPinkDark ?? const Color(0xFF91365A), 
                paddingTop: 20,
                onTap: () => {}),
              
           RetroButton(
                imagePath: 'assets/icons/user_icon.svg', 
                color: theme?.primaryPink ?? const Color(0xFFD67398) , 
                shadowColor: theme?.primaryPinkDark ?? const Color(0xFF91365A), 
                  paddingBottom: 30,
                onTap: () => {}
                ),
              

                
          ],
          ),
         
        ],
      )
    );
  }

}