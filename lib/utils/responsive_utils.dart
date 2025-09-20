import 'package:flutter/material.dart';

class ResponsiveUtils {
  // Breakpoints
  static const double mobileMaxWidth = 600;
  static const double tabletMaxWidth = 1200;

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileMaxWidth;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileMaxWidth && width < tabletMaxWidth;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletMaxWidth;
  }

  // Orientation detection
  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  // Advanced breakpoints for better device-specific handling
  static bool isSmallMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 400;
  }

  static bool isLargeMobile(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 400 && width < mobileMaxWidth;
  }

  static bool isSmallTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileMaxWidth && width < 800;
  }

  static bool isLargeTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 800 && width < tabletMaxWidth;
  }

  static bool isSmallDesktop(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= tabletMaxWidth && width < 1600;
  }

  static bool isLargeDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1600;
  }

  static double getResponsivePadding(BuildContext context) {
    if (isSmallMobile(context)) return 12.0;
    if (isMobile(context)) return 16.0;
    if (isSmallTablet(context)) return 20.0;
    if (isTablet(context)) return 24.0;
    if (isSmallDesktop(context)) return 28.0;
    return 32.0;
  }

  static double getResponsiveIconSize(BuildContext context) {
    if (isSmallMobile(context)) return 20.0;
    if (isMobile(context)) return 24.0;
    if (isSmallTablet(context)) return 26.0;
    if (isTablet(context)) return 28.0;
    if (isSmallDesktop(context)) return 30.0;
    return 32.0;
  }

  static double getResponsiveFontSize(BuildContext context, double baseSize) {
    if (isSmallMobile(context)) return baseSize * 0.7;
    if (isMobile(context)) return baseSize * 0.8;
    if (isSmallTablet(context)) return baseSize * 0.85;
    if (isTablet(context)) return baseSize * 0.9;
    if (isSmallDesktop(context)) return baseSize * 0.95;
    return baseSize;
  }

  static int getGridCrossAxisCount(BuildContext context, {int maxCount = 4}) {
    if (isSmallMobile(context)) return 1;
    if (isMobile(context)) return 1;
    if (isSmallTablet(context)) return 2;
    if (isTablet(context)) return 2;
    if (isSmallDesktop(context)) return 3;
    return maxCount;
  }
}
