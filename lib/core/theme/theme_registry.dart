library;

import 'app_gymboo_theme.dart';
import './gymboo_dark_theme.dart';
import './gymboo_ocean_theme.dart';
import './gymboo_pink_theme.dart';

abstract final class ThemeRegistry {
 
  static final AppGymbooTheme defaultTheme = gymbooPinkTheme;

  static final List<AppGymbooTheme> all = [
    gymbooPinkTheme,
    gymbooOceanTheme,
    gymbooDarkTheme,
  ];

  static AppGymbooTheme byId(String id) {
    return all.firstWhere(
      (theme) => theme.id == id,
      orElse: () => defaultTheme,
    );
  }
}
