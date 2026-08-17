library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'gymboo_themes.dart';

class ThemeNotifier extends Notifier<AppGymbooTheme> {
  static const _prefsKey = 'gymboo_selected_theme_id';

  @override
  AppGymbooTheme build() {
    _restoreSaved();
    return ThemeRegistry.defaultTheme;
  }

  Future<void> _restoreSaved() async {
    final prefs = await SharedPreferences.getInstance();
    final savedId = prefs.getString(_prefsKey);
    if (savedId != null) state = ThemeRegistry.byId(savedId);
  }

  Future<void> setTheme(String themeId) async {
    final theme = ThemeRegistry.byId(themeId);
    if (theme.id == state.id) return;
    state = theme;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, theme.id);
  }
}

final themeNotifierProvider =
    NotifierProvider<ThemeNotifier, AppGymbooTheme>(ThemeNotifier.new);