import 'package:flutter/material.dart';
import 'package:gymboo_app/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/theme/theme_controller.dart';
import 'package:gymboo_app/core/theme/theme_provider.dart';

void main()  async {

  WidgetsFlutterBinding.ensureInitialized();

  final themeController = ThemeController();
  await themeController.loadSavedTheme();


  runApp(
    ProviderScope(
      overrides: [
        themeControllerProvider.overrideWith((ref) => themeController),
      ],
      child: GymbooApp(),
    )
  );
}

