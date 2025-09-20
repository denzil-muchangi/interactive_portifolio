import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';
import '../widgets/sections/hero/hero_section.dart';
import '../widgets/sections/about/about_section.dart';
import '../widgets/sections/skills/skills_section.dart';
import '../widgets/sections/projects/projects_section.dart';
import '../widgets/sections/experience/experience_section.dart';
import '../widgets/sections/contact/contact_section.dart';
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
            child: Column(
              children: [
                VisibilityDetector(
                  key: const Key('hero'),
                  onVisibilityChanged: (info) {
                    if (info.visibleFraction > 0.1) {
                      scrollProvider.setSectionVisible('hero', true);
                    }
                  },
                  child: AnimatedOpacity(
                    opacity: scrollProvider.heroVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                        key: scrollProvider.heroKey,
                        child: const HeroSection()),
                  ),
                ),
                VisibilityDetector(
                  key: const Key('about'),
                  onVisibilityChanged: (info) {
                    if (info.visibleFraction > 0.1) {
                      scrollProvider.setSectionVisible('about', true);
                    }
                  },
                  child: AnimatedOpacity(
                    opacity: scrollProvider.aboutVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                        key: scrollProvider.aboutKey,
                        child: const AboutSection()),
                  ),
                ),
                VisibilityDetector(
                  key: const Key('skills'),
                  onVisibilityChanged: (info) {
                    if (info.visibleFraction > 0.1) {
                      scrollProvider.setSectionVisible('skills', true);
                    }
                  },
                  child: AnimatedOpacity(
                    opacity: scrollProvider.skillsVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                        key: scrollProvider.skillsKey,
                        child: const SkillsSection()),
                  ),
                ),
                VisibilityDetector(
                  key: const Key('projects'),
                  onVisibilityChanged: (info) {
                    if (info.visibleFraction > 0.1) {
                      scrollProvider.setSectionVisible('projects', true);
                    }
                  },
                  child: AnimatedOpacity(
                    opacity: scrollProvider.projectsVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      key: scrollProvider.projectsKey,
                      child: const ProjectsSection(),
                    ),
                  ),
                ),
                VisibilityDetector(
                  key: const Key('experience'),
                  onVisibilityChanged: (info) {
                    if (info.visibleFraction > 0.1) {
                      scrollProvider.setSectionVisible('experience', true);
                    }
                  },
                  child: AnimatedOpacity(
                    opacity: scrollProvider.experienceVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      key: scrollProvider.experienceKey,
                      child: const ExperienceSection(),
                    ),
                  ),
                ),
                VisibilityDetector(
                  key: const Key('contact'),
                  onVisibilityChanged: (info) {
                    if (info.visibleFraction > 0.1) {
                      scrollProvider.setSectionVisible('contact', true);
                    }
                  },
                  child: AnimatedOpacity(
                    opacity: scrollProvider.contactVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      key: scrollProvider.contactKey,
                      child: const ContactSection(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (navigationProvider.isDrawerOpen)
            const PortfolioNavigationDrawer(),
        ],
      ),
    );
  }
}
