import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';

class TopDetail extends StatelessWidget {
  const TopDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<GymbooPalette>()!;
    return Center(
      child: Container(
        width: 100,
        height: 20,
        decoration: BoxDecoration(
          color: theme.backgroundDark,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
