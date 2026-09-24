import 'package:flutter/material.dart';

class PetHeartsRow extends StatelessWidget {
  const PetHeartsRow({
    super.key,
    required this.filledHearts,
    this.totalHearts = 5,
  });

  final int filledHearts;
  final int totalHearts;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 6,
      children: List.generate(totalHearts, (i) {
        final isFilled = i < filledHearts;
        return Image.asset(
          isFilled
              ? 'assets/images/heart_filled.png'
              : 'assets/images/heart_empty.png',
          width: 24,
          height: 24,
          filterQuality: FilterQuality.none,
          fit: BoxFit.contain,
        );
      }),
    );
  }
}
