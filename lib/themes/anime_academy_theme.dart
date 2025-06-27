import 'package:flutter/material.dart';

class AnimeAcademyTheme {
  // Light Theme Colors
  static const Color _lightPrimary = Color(0xFF6366F1); // Indigo 500
  static const Color _lightSecondary = Color(0xFF8B5CF6); // Violet 500
  static const Color _lightAccent = Color(0xFFEC4899); // Pink 500
  static const Color _lightSuccess = Color(0xFF10B981); // Emerald 500
  static const Color _lightBackground = Color(0xFFF8FAFC); // Slate 50
  static const Color _lightSurface = Color(0xFFFFFFFF); // White
  static const Color _lightText = Color(0xFF1E293B); // Slate 800

  // Dark Theme Colors
  static const Color _darkPrimary = Color(0xFF7C3AED); // Violet 600
  static const Color _darkSecondary = Color(0xFF6366F1); // Indigo 500
  static const Color _darkAccent = Color(0xFFF59E0B); // Amber 500
  static const Color _darkSuccess = Color(0xFF16A34A); // Green 600
  static const Color _darkBackground = Color(0xFF0F172A); // Slate 900
  static const Color _darkSurface = Color(0xFF1E293B); // Slate 800
  static const Color _darkText = Color(0xFFF1F5F9); // Slate 100

  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: _lightPrimary,
        primary: _lightPrimary,
        secondary: _lightSecondary,
        tertiary: _lightAccent,
        surface: _lightSurface,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: _lightText,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: _lightPrimary,
        foregroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
      ),

      cardTheme: CardThemeData(
        color: _lightSurface,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _lightPrimary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),

      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: _lightText,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(color: _lightText),
        bodyMedium: TextStyle(color: _lightText),
      ),

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: _lightSuccess,
      ),

      iconTheme: const IconThemeData(color: _lightPrimary),
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: _darkPrimary,
        primary: _darkPrimary,
        secondary: _darkSecondary,
        tertiary: _darkAccent,
        surface: _darkSurface,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: _darkText,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: _darkSurface,
        foregroundColor: _darkText,
        elevation: 2,
        centerTitle: true,
      ),

      cardTheme: CardThemeData(
        color: _darkSurface,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _darkPrimary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),

      textTheme: const TextTheme(
        headlineLarge: TextStyle(color: _darkText, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: _darkText),
        bodyMedium: TextStyle(color: _darkText),
      ),

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: _darkSuccess,
      ),

      iconTheme: const IconThemeData(color: _darkPrimary),
    );
  }

  // Light Theme Color Getters
  static Color get lightPrimary => _lightPrimary;
  static Color get lightSecondary => _lightSecondary;
  static Color get lightAccent => _lightAccent;
  static Color get lightSuccess => _lightSuccess;
  static Color get lightBackground => _lightBackground;
  static Color get lightSurface => _lightSurface;
  static Color get lightText => _lightText;

  // Dark Theme Color Getters
  static Color get darkPrimary => _darkPrimary;
  static Color get darkSecondary => _darkSecondary;
  static Color get darkAccent => _darkAccent;
  static Color get darkSuccess => _darkSuccess;
  static Color get darkBackground => _darkBackground;
  static Color get darkSurface => _darkSurface;
  static Color get darkText => _darkText;
}
