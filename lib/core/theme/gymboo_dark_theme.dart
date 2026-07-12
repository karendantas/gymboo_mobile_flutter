import 'package:flutter/material.dart';

import './app_gymboo_theme.dart';
import './design_tokens.dart';


const _darkPalette = GymbooPalette(
  brandPurple: Color(0xFFC9B8FF),
  brandPurpleLight: Color(0xFFA593E0),
  primaryPink: Color(0xFFE8A0C4),
  primaryPinkDark: Color(0xFFB05C87),
  backgroundOuter: Color(0xFF15121C),
  headerBackground: Color(0xFF211C2E),
  surface: Color(0xFF241F30),
  surfaceAlt: Color(0xFF322C40),
  goldAccent: Color(0xFFFFC94D),
  goldAccentDark: Color(0xFFE8A93A),
  orangeAccent: Color(0xFFFF9D42),
  blueAccent: Color(0xFF6FC3E8),
  petBodyColor: Color(0xFF6C8EE8),
  coral: Color(0xFFF0567B),
  cream: Color(0xFF3A3346),
  textPrimary: Color(0xFFF3EEFA),
  textSecondary: Color(0xFFA79FBD),
  textOnDark: Color(0xFF15121C),
  divider: Color(0xFF3A3346),
);

final gymbooDarkTheme = AppGymbooTheme(
  id: 'gymboo_dark',
  name: 'Noite Fofinho',
  brightness: Brightness.dark,
  palette: _darkPalette,
  previewSwatch: [
    _darkPalette.primaryPink,
    _darkPalette.backgroundOuter,
    _darkPalette.goldAccent,
  ],
);
