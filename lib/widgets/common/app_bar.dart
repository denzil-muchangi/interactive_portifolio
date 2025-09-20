import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme_provider.dart';
import '../../providers/scroll_provider.dart';
import '../../providers/navigation_provider.dart';

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
    final scrollProvider = Provider.of<ScrollProvider>(context);
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return AppBar(
      title: const Text('Flutter Portfolio'),
      leading: (isMobile || isTablet)
          ? IconButton(
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: navigationProvider.iconAnimationController!,
              ),
              onPressed: navigationProvider.isDrawerOpen
                  ? navigationProvider.closeDrawer
                  : navigationProvider.openDrawer,
            )
          : null,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4),
        child: LinearProgressIndicator(
          value: scrollProvider.scrollProgress,
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
                themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              ),
              onPressed: () => themeProvider.toggleTheme(),
              tooltip: 'Toggle theme',
            );
          },
        ),
        if (!isMobile && !isTablet) ...[
          TextButton(
            onPressed: () =>
                scrollProvider.scrollToSection(scrollProvider.heroKey),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('Home'),
          ),
          TextButton(
            onPressed: () =>
                scrollProvider.scrollToSection(scrollProvider.aboutKey),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('About'),
          ),
          TextButton(
            onPressed: () =>
                scrollProvider.scrollToSection(scrollProvider.skillsKey),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('Skills'),
          ),
          TextButton(
            onPressed: () =>
                scrollProvider.scrollToSection(scrollProvider.projectsKey),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('Projects'),
          ),
          TextButton(
            onPressed: () =>
                scrollProvider.scrollToSection(scrollProvider.experienceKey),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('Experience'),
          ),
          TextButton(
            onPressed: () =>
                scrollProvider.scrollToSection(scrollProvider.contactKey),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('Contact'),
          ),
        ],
      ],
    );
  }
}
