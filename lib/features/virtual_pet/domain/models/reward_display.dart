extension RewardSlotDisplay on String {
  String get slotLabel {
    switch (this) {
      case 'CABECA':
        return 'Cabeça';
      case 'CORPO':
        return 'Corpo';
      case 'MAOS':
        return 'Mãos';
      case 'PES':
        return 'Pés';
      case 'COSTAS':
        return 'Costas';
      default:
        return this;
    }
  }
}
