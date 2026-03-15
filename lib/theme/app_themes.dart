import 'package:flutter/material.dart';

enum AppThemeMode { light, dark, obsidian }

class ThemeController extends ChangeNotifier {
  AppThemeMode _mode = AppThemeMode.light;

  AppThemeMode get mode => _mode;

  ThemeData get themeData {
    switch (_mode) {
      case AppThemeMode.light:
        return ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          brightness: Brightness.light,
          scaffoldBackgroundColor: const Color(0xFFF3F0FF),
        );
      case AppThemeMode.dark:
        return ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.dark,
          ),
        );
      case AppThemeMode.obsidian:
        const obsidian = Color(0xFF1E1E24);
        return ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: obsidian,
          cardTheme: const CardThemeData(
            color: Color(0xFF2A2A34),
          ),
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF8AB4F8),
            secondary: Color(0xFFE57373),
            surface: Color(0xFF2A2A34),
          ),
        );
    }
  }

  void setTheme(AppThemeMode mode) {
    _mode = mode;
    notifyListeners();
  }
}
