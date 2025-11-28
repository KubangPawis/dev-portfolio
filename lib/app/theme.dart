import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color _seedColor = Color(0xFF264480);

  // ----- LIGHT MODE -----
  static ThemeData light() {
    final baseTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _seedColor,
        brightness: Brightness.light,
      ),
    );

    return baseTheme.copyWith(textTheme: _buildTextTheme(baseTheme.textTheme));
  }

  // ----- DARK MODE -----
  static ThemeData dark() {
    final baseTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _seedColor,
        brightness: Brightness.dark,
      ),
    );

    return baseTheme.copyWith(textTheme: _buildTextTheme(baseTheme.textTheme));
  }

  // ----- UTILITIES -----
  static TextTheme _buildTextTheme(TextTheme baseTheme) {
    final textTheme = GoogleFonts.robotoMonoTextTheme(baseTheme);

    return baseTheme.copyWith(
      displayLarge: textTheme.displayLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      titleLarge: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
      bodyLarge: textTheme.bodyLarge?.copyWith(height: 1.5),
      bodyMedium: textTheme.bodyMedium?.copyWith(height: 1.5),
    );
  }
}
