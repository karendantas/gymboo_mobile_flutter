library;

import 'package:flutter_riverpod/legacy.dart';
 
import 'theme_controller.dart';
 
final themeControllerProvider = ChangeNotifierProvider<ThemeController>((
  ref,
) {
  throw UnimplementedError(
    'themeControllerProvider precisa ser sobrescrito em main.dart, com uma '
    'instância de ThemeController já carregada via loadSavedTheme(). '
    'Veja main.dart.',
  );
});
 