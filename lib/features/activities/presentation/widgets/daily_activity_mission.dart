
import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';

class DailyActivityMission extends StatelessWidget {
  const DailyActivityMission({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<GymbooPalette>()!;
  final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: theme.backgroundOuter,
          borderRadius: BorderRadius.circular(8), 
        border: Border.all(color: theme.backgroundDark, width: 4),
        boxShadow: [BoxShadow(
             color: theme.backgroundDark,
                  offset: const Offset(0, 4),
                  blurRadius: 0,
        )]

        
      ),
      child: Expanded(
        child: Row(
         children: [
           Image.asset(
            'assets/images/star.png',
            width: 50,
            height: 54,
            filterQuality: FilterQuality.none,
          ),
        
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'MISSÃO DIÁRIA',
                style: textTheme.labelMedium?.copyWith(color: theme.primaryPink),
              ),
              const SizedBox(height: 3,),
              Text(
                'Complete sua atividade do dia!',
                style: textTheme.labelSmall,
              )
            ],
          )
         ],
        ),
      ),
    );
  }
}