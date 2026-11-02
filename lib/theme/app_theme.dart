import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF05070D);
  static const Color surface = Color(0xFF0B1220);
  static const Color surfaceLight = Color(0xFF141C2E);
  static const Color border = Color(0xFF1E2A44);
  static const Color primary = Color(0xFF00CFFF);
  static const Color primaryGlow = Color(0xFF00E5FF);
  static const Color textPrimary = Color(0xFFE6F1FF);
  static const Color textMuted = Color(0xFF6B7A99);
}

class AppTheme {
  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          surface: AppColors.surface,
          onSurface: AppColors.textPrimary,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: AppColors.textPrimary),
        ),
      );
}
