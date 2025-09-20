import 'package:flutter/material.dart';
import '../utils/responsive_utils.dart';
import 'factories/mobile_section_factory.dart';
import 'factories/tablet_section_factory.dart';
import 'factories/desktop_section_factory.dart';
import 'common/navigation_drawer.dart';
import 'package:provider/provider.dart';
import '../providers/scroll_provider.dart';
import '../providers/navigation_provider.dart';

class DeviceAdaptiveLayout extends StatelessWidget {
  const DeviceAdaptiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    if (ResponsiveUtils.isMobile(context)) {
      return _buildMobileLayout(context);
    } else if (ResponsiveUtils.isTablet(context)) {
      return _buildTabletLayout(context);
    } else {
      return _buildDesktopLayout(context);
    }
  }

  Widget _buildMobileLayout(BuildContext context) {
    final factory = MobileSectionFactoryImpl();
    return Column(
      children: [
        factory.createHeroSection(),
        factory.createAboutSection(),
        factory.createSkillsSection(),
        factory.createExperienceSection(),
        factory.createProjectsSection(),
        factory.createContactSection(),
      ],
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    final factory = TabletSectionFactoryImpl();
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return Row(
      children: [
        // Animated side navigation panel
        AnimatedContainer(
          width: navigationProvider.isDrawerOpen ? 250 : 0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: PortfolioNavigationDrawer(isOverlay: false),
        ),
        // Main content
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                factory.createHeroSection(),
                factory.createAboutSection(),
                factory.createSkillsSection(),
                factory.createExperienceSection(),
                factory.createProjectsSection(),
                factory.createContactSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    // For desktop, use desktop factory, but since not implemented, use mobile for now
    final factory = MobileSectionFactoryImpl(); // Placeholder
    return Column(
      children: [
        factory.createHeroSection(),
        factory.createAboutSection(),
        factory.createSkillsSection(),
        factory.createExperienceSection(),
        factory.createProjectsSection(),
        factory.createContactSection(),
      ],
    );
  }
}
