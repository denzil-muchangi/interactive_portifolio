import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  // Modern color palette
  static const Color primaryBlue = Color(0xFF1E88E5);
  static const Color secondaryPurple = Color(0xFF9C27B0);
  static const Color accentTeal = Color(0xFF00ACC1);
  static const Color surfaceLight = Color(0xFFF8F9FA);
  static const Color surfaceDark = Color(0xFF121212);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color cardDark = Color(0xFF1E1E1E);

  // Gradients
  static const LinearGradient heroGradientLight = LinearGradient(
    colors: [primaryBlue, secondaryPurple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient heroGradientDark = LinearGradient(
    colors: [Color(0xFF90CAF9), Color(0xFFCE93D8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradientLight = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFF0F8FF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient cardGradientDark = LinearGradient(
    colors: [Color(0xFF1E1E1E), Color(0xFF2D2D2D)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient buttonGradientLight = LinearGradient(
    colors: [primaryBlue, Color(0xFF42A5F5)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient buttonGradientDark = LinearGradient(
    colors: [Color(0xFF90CAF9), Color(0xFF64B5F6)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // Helper methods to get gradients based on brightness
  static LinearGradient getHeroGradient(Brightness brightness) {
    return brightness == Brightness.light
        ? heroGradientLight
        : heroGradientDark;
  }

  static LinearGradient getCardGradient(Brightness brightness) {
    return brightness == Brightness.light
        ? cardGradientLight
        : cardGradientDark;
  }

  static LinearGradient getButtonGradient(Brightness brightness) {
    return brightness == Brightness.light
        ? buttonGradientLight
        : buttonGradientDark;
  }

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: primaryBlue,
      secondary: secondaryPurple,
      tertiary: accentTeal,
      surface: surfaceLight,
      background: surfaceLight,
      error: Color(0xFFD32F2F),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Color(0xFF1C1B1F),
      onBackground: Color(0xFF1C1B1F),
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: surfaceLight,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryBlue,
      foregroundColor: Colors.white,
      elevation: 4,
      shadowColor: primaryBlue.withOpacity(0.3),
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        elevation: 6,
        shadowColor: primaryBlue.withOpacity(0.4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryBlue,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1C1B1F),
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1C1B1F),
      ),
      bodyLarge: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Color(0xFF49454F),
      ),
      bodyMedium: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Color(0xFF49454F),
      ),
      bodySmall: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Color(0xFF49454F),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: primaryBlue,
      linearTrackColor: Colors.transparent,
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: cardLight,
      elevation: 8,
      shadowColor: primaryBlue.withOpacity(0.2),
    ),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF90CAF9),
      secondary: Color(0xFFCE93D8),
      tertiary: Color(0xFF80DEEA),
      surface: surfaceDark,
      background: surfaceDark,
      error: Color(0xFFEF5350),
      onPrimary: Color(0xFF0D47A1),
      onSecondary: Color(0xFF4A148C),
      onSurface: Color(0xFFE6E1E5),
      onBackground: Color(0xFFE6E1E5),
      onError: Color(0xFF1C1B1F),
    ),
    scaffoldBackgroundColor: surfaceDark,
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF1E1E1E),
      foregroundColor: Colors.white,
      elevation: 4,
      shadowColor: secondaryPurple.withOpacity(0.3),
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryPurple,
        foregroundColor: Colors.white,
        elevation: 6,
        shadowColor: secondaryPurple.withOpacity(0.4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFFCE93D8),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color(0xFFE6E1E5),
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: Color(0xFFE6E1E5),
      ),
      bodyLarge: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Color(0xFFCAC4D0),
      ),
      bodyMedium: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Color(0xFFCAC4D0),
      ),
      bodySmall: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Color(0xFFCAC4D0),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color(0xFFCE93D8),
      linearTrackColor: Colors.transparent,
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: cardDark,
      elevation: 8,
      shadowColor: secondaryPurple.withOpacity(0.3),
    ),
  );
}
