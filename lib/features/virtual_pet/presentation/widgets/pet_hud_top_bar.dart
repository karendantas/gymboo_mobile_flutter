import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';

class PetHudTopBar extends StatelessWidget {
  const PetHudTopBar({super.key, required this.dateLabel});

  final String dateLabel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
  final theme = Theme.of(context).extension<GymbooPalette>();

    return Container(
      height: 40,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/pixel_hud_card.png'),
          fit: BoxFit.fill,
          filterQuality: FilterQuality.none,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Text(dateLabel, style: textTheme.labelMedium?.copyWith(color: theme?.surfaceAlt)),
          ],
        ),
      ),
    );
  }
}