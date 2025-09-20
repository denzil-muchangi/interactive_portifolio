import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';
import '../widgets/device_adaptive_layout.dart';
import '../widgets/common/navigation_drawer.dart';
import '../widgets/common/app_bar.dart';
import '../providers/scroll_provider.dart';
import '../providers/navigation_provider.dart';

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage>
    with TickerProviderStateMixin {
  late ScrollProvider scrollProvider;
  late NavigationProvider navigationProvider;

  @override
  void initState() {
    super.initState();
    scrollProvider = Provider.of<ScrollProvider>(context, listen: false);
    navigationProvider =
        Provider.of<NavigationProvider>(context, listen: false);
    navigationProvider.initialize(this);
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    bool isTablet = MediaQuery.of(context).size.width >= 600 &&
        MediaQuery.of(context).size.width < 1200;
    debugPrint(
        'Screen width: ${MediaQuery.of(context).size.width}, isMobile: $isMobile, isTablet: $isTablet');
    return Scaffold(
      appBar: PortfolioAppBar(
        isMobile: isMobile,
        isTablet: isTablet,
      ),
      drawer: null,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollProvider.scrollController,
            child: const DeviceAdaptiveLayout(),
          ),
          if (navigationProvider.isDrawerOpen)
            const PortfolioNavigationDrawer(),
        ],
      ),
    );
  }
}
