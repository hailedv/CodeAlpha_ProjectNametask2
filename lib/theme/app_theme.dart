import 'package:flutter/material.dart';
import '../models/quote.dart';

/// App-wide color palette and theme configuration.
class AppTheme {
  AppTheme._();

  // Core palette
  static const Color primaryDeep = Color(0xFF1A1A2E);
  static const Color primaryMid = Color(0xFF16213E);
  static const Color primarySurface = Color(0xFF0F3460);
  static const Color accentGold = Color(0xFFE94560);
  static const Color accentAmber = Color(0xFFF5A623);
  static const Color accentTeal = Color(0xFF53D8FB);
  static const Color textPrimary = Color(0xFFF5F5F5);
  static const Color textSecondary = Color(0xFFB0BEC5);
  static const Color cardBg = Color(0xFF1E2A45);

  /// Returns two gradient colors for each category.
  static List<Color> categoryGradient(QuoteCategory cat) {
    switch (cat) {
      case QuoteCategory.motivation:
        return [const Color(0xFFFF6B35), const Color(0xFFFF1744)];
      case QuoteCategory.wisdom:
        return [const Color(0xFF7B2FF7), const Color(0xFF3D5AFE)];
      case QuoteCategory.life:
        return [const Color(0xFF11998E), const Color(0xFF38EF7D)];
      case QuoteCategory.love:
        return [const Color(0xFFFF416C), const Color(0xFFFF4B2B)];
      case QuoteCategory.humor:
        return [const Color(0xFFF7971E), const Color(0xFFFFD200)];
      case QuoteCategory.success:
        return [const Color(0xFF1565C0), const Color(0xFF42A5F5)];
      case QuoteCategory.courage:
        return [const Color(0xFF6A11CB), const Color(0xFF2575FC)];
      case QuoteCategory.mindfulness:
        return [const Color(0xFF134E5E), const Color(0xFF71B280)];
    }
  }

  /// The app's [ThemeData].
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: primaryDeep,
      colorScheme: const ColorScheme.dark(
        primary: accentGold,
        secondary: accentTeal,
        surface: cardBg,
        onSurface: textPrimary,
      ),
    );
  }
}
