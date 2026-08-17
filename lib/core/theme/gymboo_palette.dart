library;

import 'package:flutter/material.dart';

class GymbooPalette extends ThemeExtension<GymbooPalette> {
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

  // Antes eram campos separados no GymbooColors (petFrameGradient, xpBarFill).
  // Agora são derivados — se a paleta muda, o gradiente acompanha sozinho.
  List<Color> get petFrameGradient => [primaryPink, primaryPinkDark];
  List<Color> get xpBarFill => [primaryPink, blueAccent];

  @override
  GymbooPalette copyWith({
    Color? brandPurple,
    Color? brandPurpleLight,
    Color? primaryPink,
    Color? primaryPinkDark,
    Color? backgroundOuter,
    Color? headerBackground,
    Color? surface,
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
  }) {
    return GymbooPalette(
      brandPurple: brandPurple ?? this.brandPurple,
      brandPurpleLight: brandPurpleLight ?? this.brandPurpleLight,
      primaryPink: primaryPink ?? this.primaryPink,
      primaryPinkDark: primaryPinkDark ?? this.primaryPinkDark,
      backgroundOuter: backgroundOuter ?? this.backgroundOuter,
      headerBackground: headerBackground ?? this.headerBackground,
      surface: surface ?? this.surface,
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
    );
  }

  @override
  GymbooPalette lerp(ThemeExtension<GymbooPalette>? other, double t) {
    if (other is! GymbooPalette) return this;
    return GymbooPalette(
      brandPurple: Color.lerp(brandPurple, other.brandPurple, t)!,
      brandPurpleLight: Color.lerp(brandPurpleLight, other.brandPurpleLight, t)!,
      primaryPink: Color.lerp(primaryPink, other.primaryPink, t)!,
      primaryPinkDark: Color.lerp(primaryPinkDark, other.primaryPinkDark, t)!,
      backgroundOuter: Color.lerp(backgroundOuter, other.backgroundOuter, t)!,
      headerBackground: Color.lerp(headerBackground, other.headerBackground, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
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
    );
  }
}

const gymbooDefaultPalette = GymbooPalette(
  // ---- Marca / texto de destaque  ----
  brandPurple: Color(0xFF66073A),       // vinho escuro do título
  brandPurpleLight: Color(0xFFA5406A),  // interpolado entre brandPurple e primaryPink

  // ---- Rosa principal (botões, checkboxes, nav selecionada) ----
  primaryPink: Color(0xFFE47B9A),       // face do botão/checkbox ativo
  primaryPinkDark: Color(0xFFBD597A),   // sombra 3D sob o botão

  // ---- Fundos ----
  backgroundOuter: Color(0xFFFDCCD2),   // rosa claro por trás de tudo
  headerBackground: Color(0xFFFDCCD2),  // sem app bar distinta neste layout, mesmo tom
  surface: Color(0xFFEBE6CC),           // bege do card do pet / pílula de data
  surfaceAlt: Color(0xFFE0DAB8),        // variação mais escura do bege, p/ trilhos de barra

  // ---- Acentos ----
  goldAccent: Color(0xFFF3C371),        // preenchimento da estrela
  goldAccentDark: Color(0xFFDFA824),    // contorno da estrela
  orangeAccent: Color(0xFFFF9D66),      // não aparece no mockup — harmonizado c/ gold
  blueAccent: Color(0xFF6FA8E0),        // não aparece separado do pet — tom mais saturado

  // ---- Pet & indicadores ----
  petBodyColor: Color(0xFF8FBBF3),      // azul do corpo do pet
  coral: Color(0xFFDF5E85),             // coração (vida)
  cream: Color(0xFFEBE6CC),             // mesmo bege do surface (badges/pílulas)

  // ---- Texto ----
  textPrimary: Color(0xFF66073A),       // título, textos fortes
  textSecondary: Color(0xFF8B3B57),     // "Complete sua atividade do dia!"
  textOnDark: Color(0xFFFFFFFF),        // ícones brancos sobre rosa escuro
  divider: Color(0xFF9B9A7D),           // borda khaki da pílula/badge
);
