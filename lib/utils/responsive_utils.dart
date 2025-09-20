import 'package:flutter/material.dart';

class ResponsiveUtils {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 600 && width < 1200;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }

  static double getResponsivePadding(BuildContext context) {
    if (isMobile(context)) return 16.0;
    if (isTablet(context)) return 24.0;
    return 32.0;
  }

  static double getResponsiveIconSize(BuildContext context) {
    if (isMobile(context)) return 24.0;
    if (isTablet(context)) return 28.0;
    return 32.0;
  }

  static double getResponsiveFontSize(BuildContext context, double baseSize) {
    if (isMobile(context)) return baseSize * 0.8;
    if (isTablet(context)) return baseSize * 0.9;
    return baseSize;
  }

  static int getGridCrossAxisCount(BuildContext context, {int maxCount = 4}) {
    if (isMobile(context)) return 1;
    if (isTablet(context)) return 2;
    return maxCount;
  }
}
