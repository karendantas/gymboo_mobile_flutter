library;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTextStyles {
  static TextTheme buildTextTheme(TextTheme base) {
    final display = GoogleFonts.pressStart2pTextTheme(base);
    final body = GoogleFonts.nunitoTextTheme(base);

    return body.copyWith(
      
      displayLarge: display.displayLarge?.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 40,
        height: 1.1,
      ),
      displayMedium: display.displayMedium?.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 32,
        height: 1.15,
      ),
      displaySmall: display.displaySmall?.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 24,
        height: 1.2,
      ),


      headlineLarge: display.headlineLarge?.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 22,
      ),
      headlineMedium: display.headlineMedium?.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
      headlineSmall: display.headlineSmall?.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 15,
        letterSpacing: 0.5,
      ),

    
      titleLarge: body.titleLarge?.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
      titleMedium: body.titleMedium?.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 15,
      ),
      titleSmall: body.titleSmall?.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 13,
      ),

      bodyLarge: body.bodyLarge?.copyWith(fontSize: 16, height: 1.4),
      bodyMedium: body.bodyMedium?.copyWith(fontSize: 14, height: 1.4),
      bodySmall: body.bodySmall?.copyWith(fontSize: 12, height: 1.3),

      labelLarge: body.labelLarge?.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 13,
        letterSpacing: 0.4,
      ),
      labelMedium: body.labelMedium?.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 11,
        letterSpacing: 0.6,
      ),
      labelSmall: body.labelSmall?.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 10,
        letterSpacing: 0.5,
      ),
    );
  }
}
