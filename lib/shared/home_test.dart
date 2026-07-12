
import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/app_text_styles.dart';
import 'package:gymboo_app/core/theme/gymboo_colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
  final theme = Theme.of(context).extension<GymbooColors>();

    return Scaffold(
      appBar: AppBar(
        title: Column(children: [
          Text('Olá, Karen'),
          Text(DateTime.now().toString())
        ],),
        
        leading:   Icon(Icons.menu),
      ),
      body: Center(
        child: Text('Ola',
        
        style: textTheme.displayLarge
      ),
      )
    );
  }
}