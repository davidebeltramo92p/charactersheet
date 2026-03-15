import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'data/database_service.dart';
import 'l10n/app_localizations.dart';
import 'models/character.dart';
import 'theme/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService.instance.database;
  runApp(const CharacterSheetApp());
}

class CharacterSheetApp extends StatefulWidget {
  const CharacterSheetApp({super.key});

  @override
  State<CharacterSheetApp> createState() => _CharacterSheetAppState();
}

class _CharacterSheetAppState extends State<CharacterSheetApp> {
  Locale _locale = const Locale('en');

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeController(),
      child: Consumer<ThemeController>(
        builder: (context, themeController, _) {
          return MaterialApp(
            title: 'D&D Character Sheet',
            locale: _locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: const [
              AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: themeController.themeData,
            home: CharacterDashboard(
              character: demoCharacter(),
              onLocaleChanged: (locale) => setState(() => _locale = locale),
            ),
          );
        },
      ),
    );
  }
}

class CharacterDashboard extends StatelessWidget {
  const CharacterDashboard({
    super.key,
    required this.character,
    required this.onLocaleChanged,
  });

  final Character character;
  final ValueChanged<Locale> onLocaleChanged;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final themeController = context.watch<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.text('appTitle')),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton<Locale>(
              value: Localizations.localeOf(context),
              onChanged: (value) {
                if (value != null) onLocaleChanged(value);
              },
              items: const [
                DropdownMenuItem(value: Locale('en'), child: Text('EN')),
                DropdownMenuItem(value: Locale('it'), child: Text('IT')),
              ],
            ),
          ),
          const SizedBox(width: 8),
          PopupMenuButton<AppThemeMode>(
            icon: const Icon(Icons.palette_outlined),
            onSelected: themeController.setTheme,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: AppThemeMode.light,
                child: Text(loc.text('light')),
              ),
              PopupMenuItem(
                value: AppThemeMode.dark,
                child: Text(loc.text('dark')),
              ),
              PopupMenuItem(
                value: AppThemeMode.obsidian,
                child: Text(loc.text('obsidian')),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SectionCard(
            title: loc.text('generalData'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _kv(loc.text('name'), character.name),
                _kv(loc.text('race'), character.race),
                _kv(loc.text('class'), character.characterClass),
                _kv(loc.text('level'), character.level.toString()),
              ],
            ),
          ),
          _SectionCard(
            title: loc.text('abilities'),
            child: Column(
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: character.abilityScores.entries
                      .map((e) => Chip(label: Text('${e.key}: ${e.value}')))
                      .toList(),
                ),
                const SizedBox(height: 8),
                ...character.features.map((feature) => ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.auto_awesome),
                      title: Text(feature),
                    )),
              ],
            ),
          ),
          _SectionCard(
            title: loc.text('equipment'),
            child: Column(
              children: character.equipment
                  .map((item) => ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(Icons.inventory_2_outlined),
                        title: Text(item),
                      ))
                  .toList(),
            ),
          ),
          _SectionCard(
            title: loc.text('spells'),
            child: Column(
              children: character.spells
                  .map((spell) => ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(Icons.bolt_outlined),
                        title: Text(spell),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _kv(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          SizedBox(width: 90, child: Text(label)),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}
