import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static const supportedLocales = [
    Locale('en'),
    Locale('it'),
  ];

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const _localizedValues = {
    'en': {
      'appTitle': 'D&D Character Sheet',
      'generalData': 'General Data',
      'abilities': 'Abilities & Features',
      'equipment': 'Equipment',
      'spells': 'Spells',
      'name': 'Name',
      'race': 'Race',
      'class': 'Class',
      'level': 'Level',
      'theme': 'Theme',
      'light': 'Light',
      'dark': 'Dark',
      'obsidian': 'Obsidian',
      'language': 'Language',
    },
    'it': {
      'appTitle': 'Scheda Personaggio D&D',
      'generalData': 'Dati Generali',
      'abilities': 'Caratteristiche e Talenti',
      'equipment': 'Equipaggiamento',
      'spells': 'Incantesimi',
      'name': 'Nome',
      'race': 'Razza',
      'class': 'Classe',
      'level': 'Livello',
      'theme': 'Tema',
      'light': 'Chiaro',
      'dark': 'Scuro',
      'obsidian': 'Ossidiana',
      'language': 'Lingua',
    },
  };

  String text(String key) => _localizedValues[locale.languageCode]![key]!;
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocalizations.supportedLocales
        .any((supported) => supported.languageCode == locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
