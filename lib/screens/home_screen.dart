import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:get/get.dart';
import '../controllers/app_scroll_controller.dart';
import '../controllers/navigation_controller.dart';
import '../theme_provider.dart';
import '../widgets/device_adaptive_layout.dart';
import '../widgets/common/navigation_drawer.dart';
import '../widgets/common/app_bar.dart';
import '../utils/responsive_utils.dart';

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    bool isTablet = MediaQuery.of(context).size.width >= 600 &&
        MediaQuery.of(context).size.width < 1200;
    return Scaffold(
      appBar: PortfolioAppBar(
        isMobile: isMobile,
        isTablet: isTablet,
      ),
      drawer: null,
      body: Stack(
        children: [
          const DeviceAdaptiveLayout(),
          if (ResponsiveUtils.isMobile(context) &&
              Get.find<NavigationController>().isDrawerOpen.value)
            const PortfolioNavigationDrawer(),
        ],
      ),
    );
  }
}
