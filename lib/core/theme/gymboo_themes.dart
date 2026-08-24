library;

import 'package:flutter/material.dart';
import 'gymboo_palette.dart';
import 'gymboo_text_styles.dart';

class AppGymbooTheme {
  AppGymbooTheme({
    required this.id,
    required this.name,
    required this.brightness,
    required this.palette,
  }) : themeData = _build(palette, brightness);

  final String id;
  final String name;
  final Brightness brightness;
  final GymbooPalette palette;
  final ThemeData themeData;

  List<Color> get previewSwatch => [
        palette.primaryPink,
        palette.brandPurple,
        palette.goldAccent,
      ];

  static ThemeData _build(GymbooPalette palette, Brightness brightness) {
    final base = ThemeData(brightness: brightness, useMaterial3: true);

    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: palette.primaryPink,
        brightness: brightness,
        primary: palette.primaryPink,
        onPrimary: palette.textOnDark,
        secondary: palette.blueAccent,
        surface: palette.surface,
        onSurface: palette.textPrimary,
        error: palette.coral,
      ),
      scaffoldBackgroundColor: palette.backgroundOuter,
      textTheme: AppTextStyles.buildTextTheme(base.textTheme).apply(
        bodyColor: palette.textPrimary,
        displayColor: palette.textPrimary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: palette.backgroundDark,
        foregroundColor: palette.textPrimary,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: palette.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        margin: EdgeInsets.zero,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: palette.brandPurpleLight,
        linearTrackColor: palette.surfaceAlt,
        circularTrackColor: palette.surfaceAlt,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: palette.backgroundDark,
        selectedItemColor: palette.textOnDark,
        unselectedItemColor: palette.brandPurpleLight,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: palette.goldAccentDark,
          foregroundColor: palette.textOnDark,
          shape: const StadiumBorder(),
          elevation: 0,
        ),
      ),
      extensions: [palette],
    );
  }
}


abstract final class ThemeRegistry {
  static final defaultPallete = AppGymbooTheme(
    id: 'gymboo_default_pallete',
    name: 'Fofinho Rosa',
    brightness: Brightness.light,
    palette: gymbooDefaultPalette,
  );



  static final AppGymbooTheme defaultTheme = defaultPallete;
  static final List<AppGymbooTheme> all = [defaultPallete ];

  static AppGymbooTheme byId(String id) =>
      all.firstWhere((t) => t.id == id, orElse: () => defaultTheme);
}