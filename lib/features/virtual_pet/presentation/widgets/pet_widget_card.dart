import 'package:flutter/material.dart';

import '../../domain/models/virtual_pet.dart';
import 'dressed_pet_sprite.dart';

class PetWidgetCard extends StatelessWidget {
  const PetWidgetCard({
    super.key,
    required this.pet,
    required this.backgroundColor,
    required this.borderColor,
  });

  final VirtualPet pet;
  final Color backgroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DressedPetSprite(pet: pet, size: 130),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(5, (i) {
                final filled = i < pet.filledHearts;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Image.asset(
                    filled
                        ? 'assets/images/heart_filled.png'
                        : 'assets/images/heart_empty.png',
                    width: 20,
                    height: 20,
                    filterQuality: FilterQuality.none,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
