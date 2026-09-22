import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';

import 'pet_log.dart';
import 'pet_skill_display.dart';

extension PetLogDisplay on PetLog {
  IconData get icon {
    switch (action) {
      case 'XP_GAINED':
        return Icons.trending_up;
      case 'DECAY':
        return Icons.trending_down;
      case 'LEVEL_UP':
        return Icons.star;
      case 'REWARD_UNLOCKED':
        return Icons.card_giftcard;
      case 'CREATED':
        return Icons.pets;
      default:
        return Icons.info_outline;
    }
  }

  Color color(GymbooPalette palette) {
    switch (action) {
      case 'XP_GAINED':
        return palette.blueAccent;
      case 'DECAY':
        return palette.coral;
      case 'LEVEL_UP':
        return palette.goldAccent;
      case 'REWARD_UNLOCKED':
        return palette.primaryPink;
      default:
        return palette.textSecondary;
    }
  }

  String get description {
    final attrLabel = _attributeLabel(attribute);
    switch (action) {
      case 'XP_GAINED':
        return 'Ganhou XP em $attrLabel';
      case 'DECAY':
        return 'Perdeu pontos em $attrLabel';
      case 'LEVEL_UP':
        return '$attrLabel subiu de nível!';
      case 'REWARD_UNLOCKED':
        return 'Desbloqueou: $attribute';
      case 'CREATED':
        return 'Gymboo foi criado';
      default:
        return '$action em $attrLabel';
    }
  }

  String _attributeLabel(String attr) {
    switch (attr) {
      case 'FORCA':
        return 'Força';
      case 'RESISTENCIA':
        return 'Resistência';
      case 'FLEXIBILIDADE':
        return 'Flexibilidade';
      case 'life':
        return 'Vida';
      case 'mood':
        return 'Humor';
      case 'level':
        return 'Nível';
      default:
        return attr;
    }
  }
}
