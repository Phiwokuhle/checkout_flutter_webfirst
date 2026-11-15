import 'package:flutter/material.dart';

abstract final class AppColors {
  static const primary = Color(0xFF006B61);
  static const background = Color(0xFFFAF8FF);
  static const surface = Colors.white;
  static const ink = Color(0xFF182238);
  static const muted = Color(0xFF64716F);
  static const border = Color(0xFFD4DEDC);
  static const lavender = Color(0xFFF0F1FF);
}

ThemeData buildAppTheme() {
  final scheme = ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    primary: AppColors.primary,
    surface: AppColors.surface,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: AppColors.background,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}
