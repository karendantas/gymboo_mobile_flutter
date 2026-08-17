
import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/core/theme/gymboo_text_styles.dart';
import 'package:gymboo_app/shared/bottom_tab_retro.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context).extension<GymbooPalette>();

    return Scaffold(
   
      body: Column(
        children: [

        
        ],
      ),
      bottomNavigationBar: const   BottomTabRetro(),
    );
  }
}