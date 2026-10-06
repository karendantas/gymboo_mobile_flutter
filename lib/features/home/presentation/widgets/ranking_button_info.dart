import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';

class RankingButtonInfo extends StatelessWidget {
  const RankingButtonInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => context.go('/ranking'),
      child: Container(
        decoration: BoxDecoration(
          color: palette.card,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: palette.backgroundDark, width: 3),
          boxShadow: [
            BoxShadow(
              color: palette.backgroundDark,
              offset: const Offset(0, 4),
              blurRadius: 0,
            ),
          ],
        ),
        child: Expanded(
          child: Row(
            children: [
              Image.asset(
                'assets/images/trophy.png',
                width: 40,
                height: 54,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.none,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'RANKING',
                    style: textTheme.labelMedium?.copyWith(
                      color: palette.primaryPink,
                    ),
                  ),
                  Text(
                    'Veja a posicao do seu Gymboo!',
                    style: textTheme.labelSmall?.copyWith(
                      color: palette.primaryPink,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
