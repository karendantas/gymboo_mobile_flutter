import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';

extension PetSkillDisplay on String {

  String get skillLabel {
    switch (this) {
      case 'FORCA':
        return 'Força';
      case 'RESISTENCIA':
        return 'Resistência';
      case 'FLEXIBILIDADE':
        return 'Flexibilidade';
      default:
        return this;
    }
  }

  IconData get skillIcon {
    switch (this) {
      case 'FORCA':
        return Icons.fitness_center;
      case 'RESISTENCIA':
        return Icons.directions_run;
      case 'FLEXIBILIDADE':
        return Icons.self_improvement;
      default:
        return Icons.star;
    }
  }

  Color skillColor(GymbooPalette palette) {
    switch (this) {
      case 'FORCA':
        return palette.primaryPink;
      case 'RESISTENCIA':
        return palette.blueAccent;
      case 'FLEXIBILIDADE':
        return palette.goldAccent;
      default:
        return palette.textSecondary;
    }
  }
}