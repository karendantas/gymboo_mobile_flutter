import 'package:flutter/material.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/reward_asset_mapper.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/virtual_pet.dart';

class DressedPetSprite extends StatelessWidget {
  const DressedPetSprite({super.key, required this.pet, this.size = 220});

  final VirtualPet pet;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/pet_${pet.type}_${pet.mood.toLowerCase()}.png',
            width: size,
            height: size,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.none,
          ),

          for (final item in pet.equippedItems)
            Image.asset(
              item.code.assetPath,
              width: size,
              height: size,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.none,
            ),
        ],
      ),
    );
  }
}
