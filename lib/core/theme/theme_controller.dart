library;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_gymboo_theme.dart';
import 'theme_registry.dart';

class ThemeController extends ChangeNotifier {
  ThemeController() : _current = ThemeRegistry.defaultTheme;

  static const _prefsKey = 'gymboo_selected_theme_id';

  AppGymbooTheme _current;
  AppGymbooTheme get current => _current;
  ThemeData get themeData => _current.themeData;
  List<AppGymbooTheme> get availableThemes => ThemeRegistry.all;


  Future<void> loadSavedTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final savedId = prefs.getString(_prefsKey);
    if (savedId != null) {
      _current = ThemeRegistry.byId(savedId);
      notifyListeners();
    }
  }

  Future<void> setTheme(String themeId) async {
    final theme = ThemeRegistry.byId(themeId);
    if (theme.id == _current.id) return;

    _current = theme;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, theme.id);
  }
}
