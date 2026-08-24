import 'package:flutter/material.dart';
import 'package:gymboo_app/shared/bottom_tab_retro.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Center(child: Text('Em construção atividades'),),
          bottomNavigationBar: const   BottomTabRetro(),
      );
  }
}