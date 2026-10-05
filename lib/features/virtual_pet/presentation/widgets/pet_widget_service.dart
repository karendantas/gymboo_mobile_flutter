import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/reward_asset_mapper.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/virtual_pet.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/widgets/pet_widget_card.dart';
import 'package:home_widget/home_widget.dart';

class PetWidgetService {
  static const _imageKey = 'pet_widget_image';
  static const _androidName = 'PetWidgetProvider';

  Future<void> sync(BuildContext context, VirtualPet pet) async {
    final palette = Theme.of(context).extension<GymbooPalette>()!;

    final assets = [
      'assets/images/pet_${pet.type}_default.png',
      'assets/images/heart_filled.png',
      'assets/images/heart_empty.png',
      for (final item in pet.equippedItems) item.code.assetPath,
    ];
    for (final path in assets) {
      await precacheImage(AssetImage(path), context).catchError((_) {});
    }

    await HomeWidget.renderFlutterWidget(
      PetWidgetCard(
        pet: pet,
        backgroundColor: palette.surface,
        borderColor: palette.backgroundDark,
      ),
      key: _imageKey,
      logicalSize: const Size(220, 220),
      pixelRatio: 3.0,
    );

    await HomeWidget.updateWidget(androidName: _androidName);
  }

  Future<void> clear() async {
    await HomeWidget.saveWidgetData<String?>(_imageKey, null);
    await HomeWidget.updateWidget(androidName: _androidName);
  }
}

final petWidgetServiceProvider = Provider<PetWidgetService>(
  (ref) => PetWidgetService(),
);
