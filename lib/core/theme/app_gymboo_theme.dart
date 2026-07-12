library;

import 'package:flutter/material.dart';

import 'app_text_styles.dart';
import 'design_tokens.dart';
import 'gymboo_colors.dart';

class AppGymbooTheme {
  AppGymbooTheme({
    required this.id,
    required this.name,
    required this.brightness,
    required this.palette,
    required this.previewSwatch,
  }) : themeData = _build(palette: palette, brightness: brightness);


  final String id;

  final String name;

  final Brightness brightness;

  final GymbooPalette palette;

  final List<Color> previewSwatch;

  final ThemeData themeData;

  static ThemeData _build({
    required GymbooPalette palette,
    required Brightness brightness,
  }) {
    final base = ThemeData(brightness: brightness, useMaterial3: true);

    final colorScheme = ColorScheme.fromSeed(
      seedColor: palette.primaryPink,
      brightness: brightness,
      primary: palette.primaryPink,
      onPrimary: palette.textOnDark,
      secondary: palette.blueAccent,
      surface: palette.surface,
      onSurface: palette.textPrimary,
      error: palette.coral,
    );

    final gymbooColors = GymbooColors(
      backgroundOuter: palette.backgroundOuter,
      headerBackground: palette.headerBackground,
      headerText: palette.textPrimary,
      headerTextSecondary: palette.textSecondary,
      coinBadgeBackground: palette.cream,
      coinBadgeText: palette.textPrimary,
      petFrameGradient: [palette.primaryPink, palette.primaryPinkDark],
      petFrameRing: palette.goldAccent,
      petInnerRing: palette.surface,
      levelBadgeBackground: palette.brandPurple,
      levelBadgeText: palette.textOnDark,
      petNameText: palette.textPrimary,
      xpBarTrack: palette.surfaceAlt,
      xpBarFill: [palette.primaryPink, palette.blueAccent],
      heartFilled: palette.coral,
      heartEmpty: palette.surfaceAlt,
      missionCardBackground: palette.surface,
      missionIconBackground: palette.goldAccent,
      missionTitleText: palette.textPrimary,
      missionXpBadgeBackground: palette.primaryPink,
      missionXpBadgeText: palette.textOnDark,
      missionSubtitleText: palette.textSecondary,
      missionActionButton: palette.goldAccentDark,
      missionActionIcon: palette.textOnDark,
      sectionLabelText: palette.brandPurple,
      progressRingTrack: palette.surfaceAlt,
      progressRingActive: palette.brandPurpleLight,
      progressValueText: palette.brandPurple,
      activityCardBackground: palette.surface,
      activityBarCardio: palette.coral,
      activityBarSwim: palette.blueAccent,
      activityBarStrength: palette.orangeAccent,
      activityLevelBadgeBackground: palette.surfaceAlt,
      activityLevelBadgeText: palette.textPrimary,
      navBackground: palette.headerBackground,
      navIcon: palette.brandPurpleLight,
      navIconSelected: palette.textOnDark,
      navSelectedBubble: palette.primaryPinkDark,
    );

    return base.copyWith(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: palette.backgroundOuter,
      textTheme: AppTextStyles.buildTextTheme(base.textTheme).apply(
        bodyColor: palette.textPrimary,
        displayColor: palette.textPrimary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: palette.headerBackground,
        foregroundColor: palette.textPrimary,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: palette.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        margin: EdgeInsets.zero,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: palette.brandPurpleLight,
        linearTrackColor: palette.surfaceAlt,
        circularTrackColor: palette.surfaceAlt,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: palette.headerBackground,
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
      extensions: [gymbooColors],
    );
  }
}
