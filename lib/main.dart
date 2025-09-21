import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'theme_provider.dart';
import 'screens/home_screen.dart';
import 'controllers/navigation_controller.dart';
import 'controllers/app_scroll_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const PortfolioApp(),
    ),
  );
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NavigationController());
    Get.put(AppScrollController());
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return GetMaterialApp(
          title: 'Flutter Portfolio',
          theme: themeProvider.currentTheme,
          home: const PortfolioHomePage(),
        );
      },
    );
  }
}
