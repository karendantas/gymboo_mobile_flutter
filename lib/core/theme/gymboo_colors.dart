/// Uso em um widget:
/// ```dart
/// final gymboo = Theme.of(context).extension<GymbooColors>()!;
/// Container(color: gymboo.missionCardBackground);
/// ```
library;

import 'package:flutter/material.dart';

class GymbooColors extends ThemeExtension<GymbooColors> {
  const GymbooColors({
    required this.backgroundOuter,
    required this.headerBackground,
    required this.headerText,
    required this.headerTextSecondary,
    required this.coinBadgeBackground,
    required this.coinBadgeText,
    required this.petFrameGradient,
    required this.petFrameRing,
    required this.petInnerRing,
    required this.levelBadgeBackground,
    required this.levelBadgeText,
    required this.petNameText,
    required this.xpBarTrack,
    required this.xpBarFill,
    required this.heartFilled,
    required this.heartEmpty,
    required this.missionCardBackground,
    required this.missionIconBackground,
    required this.missionTitleText,
    required this.missionXpBadgeBackground,
    required this.missionXpBadgeText,
    required this.missionSubtitleText,
    required this.missionActionButton,
    required this.missionActionIcon,
    required this.sectionLabelText,
    required this.progressRingTrack,
    required this.progressRingActive,
    required this.progressValueText,
    required this.activityCardBackground,
    required this.activityBarCardio,
    required this.activityBarSwim,
    required this.activityBarStrength,
    required this.activityLevelBadgeBackground,
    required this.activityLevelBadgeText,
    required this.navBackground,
    required this.navIcon,
    required this.navIconSelected,
    required this.navSelectedBubble,
  });

  // ---- Topo / Header ----
  final Color backgroundOuter;
  final Color headerBackground;
  final Color headerText;
  final Color headerTextSecondary;
  final Color coinBadgeBackground;
  final Color coinBadgeText;

  // ---- Card do Pet ----
  final List<Color> petFrameGradient;
  final Color petFrameRing; 
  final Color petInnerRing; 
  final Color levelBadgeBackground; 
  final Color levelBadgeText;
  final Color petNameText;
  final Color xpBarTrack;
  final List<Color> xpBarFill;
  final Color heartFilled;
  final Color heartEmpty;

  // ---- Missão diária ----
  final Color missionCardBackground;
  final Color missionIconBackground;
  final Color missionTitleText;
  final Color missionXpBadgeBackground;
  final Color missionXpBadgeText;
  final Color missionSubtitleText;
  final Color missionActionButton;
  final Color missionActionIcon;

  // ---- Progresso semanal ----
  final Color sectionLabelText;
  final Color progressRingTrack;
  final Color progressRingActive;
  final Color progressValueText;

  // ---- Lista de atividades ----
  final Color activityCardBackground;
  final Color activityBarCardio; 
  final Color activityBarSwim; 
  final Color activityBarStrength;
  final Color activityLevelBadgeBackground;
  final Color activityLevelBadgeText;

  // ---- Navegação inferior ----
  final Color navBackground;
  final Color navIcon;
  final Color navIconSelected;
  final Color navSelectedBubble; 

  @override
  GymbooColors copyWith({
    Color? backgroundOuter,
    Color? headerBackground,
    Color? headerText,
    Color? headerTextSecondary,
    Color? coinBadgeBackground,
    Color? coinBadgeText,
    List<Color>? petFrameGradient,
    Color? petFrameRing,
    Color? petInnerRing,
    Color? levelBadgeBackground,
    Color? levelBadgeText,
    Color? petNameText,
    Color? xpBarTrack,
    List<Color>? xpBarFill,
    Color? heartFilled,
    Color? heartEmpty,
    Color? missionCardBackground,
    Color? missionIconBackground,
    Color? missionTitleText,
    Color? missionXpBadgeBackground,
    Color? missionXpBadgeText,
    Color? missionSubtitleText,
    Color? missionActionButton,
    Color? missionActionIcon,
    Color? sectionLabelText,
    Color? progressRingTrack,
    Color? progressRingActive,
    Color? progressValueText,
    Color? activityCardBackground,
    Color? activityBarCardio,
    Color? activityBarSwim,
    Color? activityBarStrength,
    Color? activityLevelBadgeBackground,
    Color? activityLevelBadgeText,
    Color? navBackground,
    Color? navIcon,
    Color? navIconSelected,
    Color? navSelectedBubble,
  }) {
    return GymbooColors(
      backgroundOuter: backgroundOuter ?? this.backgroundOuter,
      headerBackground: headerBackground ?? this.headerBackground,
      headerText: headerText ?? this.headerText,
      headerTextSecondary: headerTextSecondary ?? this.headerTextSecondary,
      coinBadgeBackground: coinBadgeBackground ?? this.coinBadgeBackground,
      coinBadgeText: coinBadgeText ?? this.coinBadgeText,
      petFrameGradient: petFrameGradient ?? this.petFrameGradient,
      petFrameRing: petFrameRing ?? this.petFrameRing,
      petInnerRing: petInnerRing ?? this.petInnerRing,
      levelBadgeBackground: levelBadgeBackground ?? this.levelBadgeBackground,
      levelBadgeText: levelBadgeText ?? this.levelBadgeText,
      petNameText: petNameText ?? this.petNameText,
      xpBarTrack: xpBarTrack ?? this.xpBarTrack,
      xpBarFill: xpBarFill ?? this.xpBarFill,
      heartFilled: heartFilled ?? this.heartFilled,
      heartEmpty: heartEmpty ?? this.heartEmpty,
      missionCardBackground:
          missionCardBackground ?? this.missionCardBackground,
      missionIconBackground:
          missionIconBackground ?? this.missionIconBackground,
      missionTitleText: missionTitleText ?? this.missionTitleText,
      missionXpBadgeBackground:
          missionXpBadgeBackground ?? this.missionXpBadgeBackground,
      missionXpBadgeText: missionXpBadgeText ?? this.missionXpBadgeText,
      missionSubtitleText: missionSubtitleText ?? this.missionSubtitleText,
      missionActionButton: missionActionButton ?? this.missionActionButton,
      missionActionIcon: missionActionIcon ?? this.missionActionIcon,
      sectionLabelText: sectionLabelText ?? this.sectionLabelText,
      progressRingTrack: progressRingTrack ?? this.progressRingTrack,
      progressRingActive: progressRingActive ?? this.progressRingActive,
      progressValueText: progressValueText ?? this.progressValueText,
      activityCardBackground:
          activityCardBackground ?? this.activityCardBackground,
      activityBarCardio: activityBarCardio ?? this.activityBarCardio,
      activityBarSwim: activityBarSwim ?? this.activityBarSwim,
      activityBarStrength: activityBarStrength ?? this.activityBarStrength,
      activityLevelBadgeBackground:
          activityLevelBadgeBackground ?? this.activityLevelBadgeBackground,
      activityLevelBadgeText:
          activityLevelBadgeText ?? this.activityLevelBadgeText,
      navBackground: navBackground ?? this.navBackground,
      navIcon: navIcon ?? this.navIcon,
      navIconSelected: navIconSelected ?? this.navIconSelected,
      navSelectedBubble: navSelectedBubble ?? this.navSelectedBubble,
    );
  }

  @override
  GymbooColors lerp(ThemeExtension<GymbooColors>? other, double t) {
    if (other is! GymbooColors) return this;

    List<Color> lerpList(List<Color> a, List<Color> b) {
      final length = a.length < b.length ? a.length : b.length;
      return [
        for (var i = 0; i < length; i++) Color.lerp(a[i], b[i], t)!,
      ];
    }

    return GymbooColors(
      backgroundOuter: Color.lerp(backgroundOuter, other.backgroundOuter, t)!,
      headerBackground:
          Color.lerp(headerBackground, other.headerBackground, t)!,
      headerText: Color.lerp(headerText, other.headerText, t)!,
      headerTextSecondary:
          Color.lerp(headerTextSecondary, other.headerTextSecondary, t)!,
      coinBadgeBackground:
          Color.lerp(coinBadgeBackground, other.coinBadgeBackground, t)!,
      coinBadgeText: Color.lerp(coinBadgeText, other.coinBadgeText, t)!,
      petFrameGradient: lerpList(petFrameGradient, other.petFrameGradient),
      petFrameRing: Color.lerp(petFrameRing, other.petFrameRing, t)!,
      petInnerRing: Color.lerp(petInnerRing, other.petInnerRing, t)!,
      levelBadgeBackground:
          Color.lerp(levelBadgeBackground, other.levelBadgeBackground, t)!,
      levelBadgeText: Color.lerp(levelBadgeText, other.levelBadgeText, t)!,
      petNameText: Color.lerp(petNameText, other.petNameText, t)!,
      xpBarTrack: Color.lerp(xpBarTrack, other.xpBarTrack, t)!,
      xpBarFill: lerpList(xpBarFill, other.xpBarFill),
      heartFilled: Color.lerp(heartFilled, other.heartFilled, t)!,
      heartEmpty: Color.lerp(heartEmpty, other.heartEmpty, t)!,
      missionCardBackground: Color.lerp(
        missionCardBackground,
        other.missionCardBackground,
        t,
      )!,
      missionIconBackground: Color.lerp(
        missionIconBackground,
        other.missionIconBackground,
        t,
      )!,
      missionTitleText:
          Color.lerp(missionTitleText, other.missionTitleText, t)!,
      missionXpBadgeBackground: Color.lerp(
        missionXpBadgeBackground,
        other.missionXpBadgeBackground,
        t,
      )!,
      missionXpBadgeText:
          Color.lerp(missionXpBadgeText, other.missionXpBadgeText, t)!,
      missionSubtitleText:
          Color.lerp(missionSubtitleText, other.missionSubtitleText, t)!,
      missionActionButton:
          Color.lerp(missionActionButton, other.missionActionButton, t)!,
      missionActionIcon:
          Color.lerp(missionActionIcon, other.missionActionIcon, t)!,
      sectionLabelText:
          Color.lerp(sectionLabelText, other.sectionLabelText, t)!,
      progressRingTrack:
          Color.lerp(progressRingTrack, other.progressRingTrack, t)!,
      progressRingActive:
          Color.lerp(progressRingActive, other.progressRingActive, t)!,
      progressValueText:
          Color.lerp(progressValueText, other.progressValueText, t)!,
      activityCardBackground: Color.lerp(
        activityCardBackground,
        other.activityCardBackground,
        t,
      )!,
      activityBarCardio:
          Color.lerp(activityBarCardio, other.activityBarCardio, t)!,
      activityBarSwim:
          Color.lerp(activityBarSwim, other.activityBarSwim, t)!,
      activityBarStrength:
          Color.lerp(activityBarStrength, other.activityBarStrength, t)!,
      activityLevelBadgeBackground: Color.lerp(
        activityLevelBadgeBackground,
        other.activityLevelBadgeBackground,
        t,
      )!,
      activityLevelBadgeText: Color.lerp(
        activityLevelBadgeText,
        other.activityLevelBadgeText,
        t,
      )!,
      navBackground: Color.lerp(navBackground, other.navBackground, t)!,
      navIcon: Color.lerp(navIcon, other.navIcon, t)!,
      navIconSelected: Color.lerp(navIconSelected, other.navIconSelected, t)!,
      navSelectedBubble:
          Color.lerp(navSelectedBubble, other.navSelectedBubble, t)!,
    );
  }
}
