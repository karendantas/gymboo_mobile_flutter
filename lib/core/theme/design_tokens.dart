library;

import 'package:flutter/material.dart';

class GymbooPalette {
  const GymbooPalette({
    required this.brandPurple,
    required this.brandPurpleLight,
    required this.primaryPink,
    required this.primaryPinkDark,
    required this.backgroundOuter,
    required this.headerBackground,
    required this.surface,
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
  });


  final Color brandPurple;
  final Color brandPurpleLight;

  final Color primaryPink;

  final Color primaryPinkDark;

  final Color backgroundOuter;

  final Color headerBackground;

  final Color surface;

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
}

const gymbooDefaultPalette = GymbooPalette(
  brandPurple: Color(0xFF4A3B78),
  brandPurpleLight: Color(0xFF6B5CA5),
  primaryPink: Color(0xFFF2A8C6),
  primaryPinkDark: Color(0xFFE0568E),
  backgroundOuter: Color.fromARGB(255, 255, 255, 255),
  headerBackground: Color(0xFFFBDEE9),
  surface: Color(0xFFFFFFFF),
  surfaceAlt: Color(0xFFF3E9EE),
  goldAccent: Color(0xFFFFC94D),
  goldAccentDark: Color(0xFFF4A522),
  orangeAccent: Color(0xFFFF9D42),
  blueAccent: Color(0xFF57B8E8),
  petBodyColor: Color(0xFF6C8EE8),
  coral: Color(0xFFF0567B),
  cream: Color(0xFFFBEFD9),
  textPrimary: Color(0xFF4A3B78),
  textSecondary: Color(0xFF9A93A6),
  textOnDark: Color(0xFFFFFFFF),
  divider: Color(0xFFEBD9E2),
);
