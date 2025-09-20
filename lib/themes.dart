import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  // Timeless and engaging color palette
  static const Color primaryBlue =
      Color(0xFF1976D2); // Deeper blue for professionalism
  static const Color secondaryPurple = Color(0xFF7B1FA2); // Richer purple
  static const Color accentTeal = Color(0xFF0097A7); // Sophisticated teal
  static const Color accentCoral =
      Color(0xFFFF6B6B); // Fun accent for entertainment
  static const Color surfaceLight = Color(0xFFFAFAFA); // Slightly warmer white
  static const Color surfaceDark = Color(0xFF121212);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color cardDark = Color(0xFF1E1E1E);

  // Enhanced Gradients - Timeless and Engaging
  static const LinearGradient heroGradientLight = LinearGradient(
    colors: [primaryBlue, secondaryPurple, accentTeal, accentCoral],
    stops: [0.0, 0.33, 0.66, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient heroGradientDark = LinearGradient(
    colors: [
      Color(0xFF42A5F5),
      Color(0xFFBA68C8),
      Color(0xFF4DD0E1),
      accentCoral
    ],
    stops: [0.0, 0.33, 0.66, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradientLight = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFF8F9FA), Color(0xFFF0F8FF)],
    stops: [0.0, 0.7, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient cardGradientDark = LinearGradient(
    colors: [Color(0xFF1E1E1E), Color(0xFF2A2A2A), Color(0xFF2D2D2D)],
    stops: [0.0, 0.7, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient buttonGradientLight = LinearGradient(
    colors: [primaryBlue, accentTeal, accentCoral],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient buttonGradientDark = LinearGradient(
    colors: [Color(0xFF42A5F5), Color(0xFF4DD0E1), accentCoral],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // Additional gradients for projects - Engaging and Timeless
  static const LinearGradient projectGradient1 = LinearGradient(
    colors: [primaryBlue, secondaryPurple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient projectGradient2 = LinearGradient(
    colors: [accentTeal, accentCoral],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient projectGradient3 = LinearGradient(
    colors: [Color(0xFF4CAF50), accentTeal],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
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
      tertiary: accentCoral,
      surface: surfaceLight,
      error: Color(0xFFD32F2F),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Color(0xFF1C1B1F),
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
        foregroundColor: accentCoral,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1C1B1F),
        letterSpacing: -0.5,
        height: 1.2,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1C1B1F),
        letterSpacing: -0.3,
        height: 1.3,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: Color(0xFF1C1B1F),
        letterSpacing: -0.2,
        height: 1.4,
      ),
      bodyLarge: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Color(0xFF49454F),
        height: 1.5,
        letterSpacing: 0.1,
      ),
      bodyMedium: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Color(0xFF49454F),
        height: 1.5,
        letterSpacing: 0.1,
      ),
      bodySmall: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Color(0xFF49454F),
        height: 1.4,
        letterSpacing: 0.2,
      ),
      labelLarge: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color(0xFF49454F),
        letterSpacing: 0.5,
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
      primary: Color(0xFF42A5F5),
      secondary: Color(0xFFBA68C8),
      tertiary: accentCoral,
      surface: surfaceDark,
      error: Color(0xFFEF5350),
      onPrimary: Color(0xFF0D47A1),
      onSecondary: Color(0xFF4A148C),
      onSurface: Color(0xFFE6E1E5),
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
        foregroundColor: accentCoral,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color(0xFFE6E1E5),
        letterSpacing: -0.5,
        height: 1.2,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: Color(0xFFE6E1E5),
        letterSpacing: -0.3,
        height: 1.3,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: Color(0xFFE6E1E5),
        letterSpacing: -0.2,
        height: 1.4,
      ),
      bodyLarge: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Color(0xFFCAC4D0),
        height: 1.5,
        letterSpacing: 0.1,
      ),
      bodyMedium: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Color(0xFFCAC4D0),
        height: 1.5,
        letterSpacing: 0.1,
      ),
      bodySmall: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Color(0xFFCAC4D0),
        height: 1.4,
        letterSpacing: 0.2,
      ),
      labelLarge: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color(0xFFCAC4D0),
        letterSpacing: 0.5,
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
