import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/shared/bottom_tab_retro.dart';
import 'package:gymboo_app/shared/retro_button.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Center(child:   
        RetroButton(title: 'Backup', 
        onTap: () => context.go('/backup'), color: Colors.blue, shadowColor: Colors.blueAccent),),
      
          bottomNavigationBar: const   BottomTabRetro(),
      );
  }
}