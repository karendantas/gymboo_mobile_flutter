library;

import 'package:flutter/material.dart';

class GymbooPalette extends ThemeExtension<GymbooPalette> {
  const GymbooPalette({
    required this.brandPurple,
    required this.brandPurpleLight,
    required this.primaryPink,
    required this.primaryPinkDark,
    required this.backgroundOuter,
    required this.backgroundDark,
    required this.surface,
    required this.surfaceSecondary,
    required this.surfaceAlt,
    required this.goldAccent,
    required this.goldAccentDark,
    required this.orangeAccent,
    required this.blueAccent,
    required this.petBodyColor,
    required this.coral,
    required this.cream,
    required this.textPrimary,
    required this.textSecondary,
    required this.textOnDark,
    required this.divider,
    required this.googleButton,
    required this.googleButtonBorder,
    required this.input,
  });

  final Color brandPurple;
  final Color brandPurpleLight;
  final Color primaryPink;
  final Color primaryPinkDark;
  final Color backgroundOuter;
  final Color backgroundDark;
  final Color surface;
  final Color surfaceSecondary;
  final Color surfaceAlt;
  final Color goldAccent;
  final Color goldAccentDark;
  final Color orangeAccent;
  final Color blueAccent;
  final Color petBodyColor;
  final Color coral;
  final Color cream;
  final Color textPrimary;
  final Color textSecondary;
  final Color textOnDark;
  final Color divider;
  final Color googleButton;
  final Color googleButtonBorder;
  final Color input;

  List<Color> get petFrameGradient => [primaryPink, primaryPinkDark];
  List<Color> get xpBarFill => [primaryPink, blueAccent];

  @override
  GymbooPalette copyWith({
    Color? brandPurple,
    Color? brandPurpleLight,
    Color? primaryPink,
    Color? primaryPinkDark,
    Color? backgroundOuter,
    Color? backgroundDark,
    Color? surface,
    Color? surfaceSecondary,
    Color? surfaceAlt,
    Color? goldAccent,
    Color? goldAccentDark,
    Color? orangeAccent,
    Color? blueAccent,
    Color? petBodyColor,
    Color? coral,
    Color? cream,
    Color? textPrimary,
    Color? textSecondary,
    Color? textOnDark,
    Color? divider,
    Color? googleButton,
    Color? googleButtonBorder,
    Color? input,
  }) {
    return GymbooPalette(
      brandPurple: brandPurple ?? this.brandPurple,
      brandPurpleLight: brandPurpleLight ?? this.brandPurpleLight,
      primaryPink: primaryPink ?? this.primaryPink,
      primaryPinkDark: primaryPinkDark ?? this.primaryPinkDark,
      backgroundOuter: backgroundOuter ?? this.backgroundOuter,
      backgroundDark: backgroundDark ?? this.backgroundDark,
      surface: surface ?? this.surface,
      surfaceSecondary: surfaceSecondary ?? this.surfaceSecondary,
      surfaceAlt: surfaceAlt ?? this.surfaceAlt,
      goldAccent: goldAccent ?? this.goldAccent,
      goldAccentDark: goldAccentDark ?? this.goldAccentDark,
      orangeAccent: orangeAccent ?? this.orangeAccent,
      blueAccent: blueAccent ?? this.blueAccent,
      petBodyColor: petBodyColor ?? this.petBodyColor,
      coral: coral ?? this.coral,
      cream: cream ?? this.cream,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textOnDark: textOnDark ?? this.textOnDark,
      divider: divider ?? this.divider,
      googleButton: googleButton ?? this.googleButton,
      googleButtonBorder: googleButtonBorder ?? this.googleButtonBorder,
      input: input ?? this.input,
    );
  }

  @override
  GymbooPalette lerp(ThemeExtension<GymbooPalette>? other, double t) {
    if (other is! GymbooPalette) return this;
    return GymbooPalette(
      brandPurple: Color.lerp(brandPurple, other.brandPurple, t)!,
      brandPurpleLight: Color.lerp(
        brandPurpleLight,
        other.brandPurpleLight,
        t,
      )!,
      primaryPink: Color.lerp(primaryPink, other.primaryPink, t)!,
      primaryPinkDark: Color.lerp(primaryPinkDark, other.primaryPinkDark, t)!,
      backgroundOuter: Color.lerp(backgroundOuter, other.backgroundOuter, t)!,
      backgroundDark: Color.lerp(backgroundDark, other.backgroundDark, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceSecondary: Color.lerp(
        surfaceSecondary,
        other.surfaceSecondary,
        t,
      )!,
      surfaceAlt: Color.lerp(surfaceAlt, other.surfaceAlt, t)!,
      goldAccent: Color.lerp(goldAccent, other.goldAccent, t)!,
      goldAccentDark: Color.lerp(goldAccentDark, other.goldAccentDark, t)!,
      orangeAccent: Color.lerp(orangeAccent, other.orangeAccent, t)!,
      blueAccent: Color.lerp(blueAccent, other.blueAccent, t)!,
      petBodyColor: Color.lerp(petBodyColor, other.petBodyColor, t)!,
      coral: Color.lerp(coral, other.coral, t)!,
      cream: Color.lerp(cream, other.cream, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textOnDark: Color.lerp(textOnDark, other.textOnDark, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      googleButton: Color.lerp(googleButton, other.googleButton, t)!,
      googleButtonBorder: Color.lerp(
        googleButtonBorder,
        other.googleButtonBorder,
        t,
      )!,
      input: Color.lerp(input, other.input, t)!,
    );
  }
}

const gymbooDefaultPalette = GymbooPalette(
  // ---- Marca / títulos ----
  brandPurple: Color(0xFF792B48),
  brandPurpleLight: Color(0xFFC0466C),

  // ---- Rosa principal ----
  primaryPink: Color(0xFFE86C93),
  primaryPinkDark: Color(0xFFC2466C),

  // ---- Fundos ----
  backgroundOuter: Color.fromARGB(255, 245, 189, 201),
  backgroundDark: Color.fromARGB(255, 235, 135, 158),

  // ---- Superfícies / HUD ----
  surface: Color(0xFFF0DFC1),
  surfaceSecondary: Color(0xFFCCC2A0),
  surfaceAlt: Color(0xFF98826D),

  // ---- Acentos ----
  goldAccent: Color(0xFFFCC45B),
  goldAccentDark: Color(0xFFCF702C),
  orangeAccent: Color(0xFFCF702C),
  blueAccent: Color(0xFF8980DA),

  // ---- Pet & indicadores ----
  petBodyColor: Color(0xFF8980DA),
  coral: Color(0xFFC0466C),
  cream: Color(0xFFF0DFC1),

  // ---- Texto ----
  textPrimary: Color(0xFF31193A),
  textSecondary: Color(0xFF792B48),
  textOnDark: Color(0xFFFFFFFF),
  divider: Color(0xFF98826D),

  googleButton: Color(0xFFFFFDF7),
  googleButtonBorder: Color(0xFFD5CDB5),
  input: Color.fromARGB(255, 245, 249, 215),
);
