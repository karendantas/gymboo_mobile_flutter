import 'package:flutter/material.dart';

import './app_gymboo_theme.dart';
import './design_tokens.dart';


final gymbooPinkTheme = AppGymbooTheme(
  id: 'gymboo_pink',
  name: 'Fofinho Rosa',
  brightness: Brightness.light,
  palette: gymbooDefaultPalette,
  previewSwatch: [
    gymbooDefaultPalette.primaryPink,
    gymbooDefaultPalette.brandPurple,
    gymbooDefaultPalette.goldAccent,
  ],
);
