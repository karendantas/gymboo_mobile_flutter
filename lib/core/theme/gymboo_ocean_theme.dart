import 'package:flutter/material.dart';

import './app_gymboo_theme.dart';
import './design_tokens.dart';


const _oceanPalette = GymbooPalette(
  brandPurple: Color(0xFF1E3A5F),
  brandPurpleLight: Color(0xFF3E6690),
  primaryPink: Color(0xFF7FD1E0),
  primaryPinkDark: Color(0xFF2E9DB8),
  backgroundOuter: Color(0xFF4A7FA5),
  headerBackground: Color(0xFFDCF3F7),
  surface: Color(0xFFFFFFFF),
  surfaceAlt: Color(0xFFE7F3F6),
  goldAccent: Color(0xFFFFC94D),
  goldAccentDark: Color(0xFFF4A522),
  orangeAccent: Color(0xFFFF9D42),
  blueAccent: Color(0xFF3E6690),
  petBodyColor: Color(0xFF5FA8D3),
  coral: Color(0xFFEF6F6C),
  cream: Color(0xFFFBEFD9),
  textPrimary: Color(0xFF1E3A5F),
  textSecondary: Color(0xFF6C8CA3),
  textOnDark: Color(0xFFFFFFFF),
  divider: Color(0xFFD3E7EE),
);

final gymbooOceanTheme = AppGymbooTheme(
  id: 'gymboo_ocean',
  name: 'Maré Azul',
  brightness: Brightness.light,
  palette: _oceanPalette,
  previewSwatch: [
    _oceanPalette.primaryPink,
    _oceanPalette.brandPurple,
    _oceanPalette.goldAccent,
  ],
);
