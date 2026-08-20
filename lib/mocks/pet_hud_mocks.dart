// mocks/pet_hud_mocks.dart (ou direto num arquivo de preview/dev)

import 'package:flutter/material.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/widgets/pet_hud_screen.dart';

/// Pet saudável, no meio do progresso — o caso "feliz" padrão
const petHudMockHealthy = PetHudScreen(
  petName: 'Fofurico',
  dateLabel: 'QUI - 9 OUT',
  filledHearts: 5,
  level: 2,
  currentXp: 320,
  xpToNextLevel: 500,
);

/// Pet com vida baixa — testa se os corações vazios aparecem certo
const petHudMockLowHealth = PetHudScreen(
  petName: 'Fofurico',
  dateLabel: 'SEX - 10 OUT',
  filledHearts: 1,
  level: 2,
  currentXp: 340,
  xpToNextLevel: 500,
);

/// Prestes a subir de nível — barra de XP quase cheia
const petHudMockAlmostLevelUp = PetHudScreen(
  petName: 'Fofurico',
  dateLabel: 'SÁB - 11 OUT',
  filledHearts: 5,
  level: 2,
  currentXp: 495,
  xpToNextLevel: 500,
);

/// Pet recém-criado — nível 1, XP zerado
const petHudMockNewPet = PetHudScreen(
  petName: 'Bolinha',
  dateLabel: 'DOM - 12 OUT',
  filledHearts: 5,
  level: 1,
  currentXp: 0,
  xpToNextLevel: 100,
);

/// Nome longo — testa overflow no headlineSmall pixel font
const petHudMockLongName = PetHudScreen(
  petName: 'Marshmallowzinho',
  dateLabel: 'SEG - 13 OUT',
  filledHearts: 3,
  level: 7,
  currentXp: 1250,
  xpToNextLevel: 2000,
);