import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../theme_provider.dart';
import '../../controllers/app_scroll_controller.dart';
import '../../controllers/navigation_controller.dart';

class PortfolioAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isMobile;
  final bool isTablet;

  const PortfolioAppBar({
    super.key,
    required this.isMobile,
    required this.isTablet,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 4);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return GetBuilder<AppScrollController>(
      builder: (scrollController) => GetBuilder<NavigationController>(
        builder: (navController) => AppBar(
          title: const Text('Flutter Portfolio'),
          leading: (isMobile || isTablet)
              ? IconButton(
                  icon: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: navController.iconAnimationController!,
                  ),
                  onPressed: navController.isDrawerOpen.value
                      ? navController.closeDrawer
                      : navController.openDrawer,
                )
              : null,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4),
            child: LinearProgressIndicator(
              value: scrollController.scrollProgress.value,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          actions: [
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return IconButton(
                  icon: Icon(
                    themeProvider.isDarkMode
                        ? Icons.light_mode
                        : Icons.dark_mode,
                  ),
                  onPressed: () => themeProvider.toggleTheme(),
                  tooltip: 'Toggle theme',
                );
              },
            ),
            if (!isMobile && !isTablet) ...[
              TextButton(
                onPressed: () =>
                    scrollController.scrollToSection(scrollController.heroKey),
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                child: const Text('Home'),
              ),
              TextButton(
                onPressed: () =>
                    scrollController.scrollToSection(scrollController.aboutKey),
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                child: const Text('About'),
              ),
              TextButton(
                onPressed: () => scrollController
                    .scrollToSection(scrollController.skillsKey),
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                child: const Text('Skills'),
              ),
              TextButton(
                onPressed: () => scrollController
                    .scrollToSection(scrollController.projectsKey),
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                child: const Text('Projects'),
              ),
              TextButton(
                onPressed: () => scrollController
                    .scrollToSection(scrollController.experienceKey),
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                child: const Text('Experience'),
              ),
              TextButton(
                onPressed: () => scrollController
                    .scrollToSection(scrollController.contactKey),
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                child: const Text('Contact'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
