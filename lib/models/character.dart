class Character {
  Character({
    required this.name,
    required this.race,
    required this.characterClass,
    required this.level,
    required this.abilityScores,
    required this.features,
    required this.equipment,
    required this.spells,
  });

  final String name;
  final String race;
  final String characterClass;
  final int level;
  final Map<String, int> abilityScores;
  final List<String> features;
  final List<String> equipment;
  final List<String> spells;
}

Character demoCharacter() {
  return Character(
    name: 'Elara Nightbreeze',
    race: 'Elf',
    characterClass: 'Wizard',
    level: 5,
    abilityScores: {
      'STR': 8,
      'DEX': 14,
      'CON': 12,
      'INT': 18,
      'WIS': 13,
      'CHA': 10,
    },
    features: const [
      'Arcane Recovery',
      'Ritual Casting',
      'Keen Mind',
    ],
    equipment: const [
      'Quarterstaff',
      'Spellbook',
      'Explorer\'s Pack',
      'Potion of Healing',
    ],
    spells: const [
      'Magic Missile',
      'Shield',
      'Misty Step',
      'Fireball',
    ],
  );
}
