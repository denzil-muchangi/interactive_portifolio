import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme_provider.dart';
import '../../providers/scroll_provider.dart';
import '../../providers/navigation_provider.dart';

class PortfolioNavigationDrawer extends StatelessWidget {
  final bool isOverlay;

  const PortfolioNavigationDrawer({super.key, this.isOverlay = true});

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    Widget drawerContent = Container(
      width: 250,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Navigation', style: TextStyle(color: Colors.white)),
                IconButton(
                  icon: Icon(
                    themeProvider.isDarkMode
                        ? Icons.light_mode
                        : Icons.dark_mode,
                    color: Colors.white,
                  ),
                  onPressed: () => themeProvider.toggleTheme(),
                  tooltip: 'Toggle theme',
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Home', style: TextStyle(color: Colors.white)),
            onTap: () {
              navigationProvider.closeDrawer();
              scrollProvider.scrollToSection(scrollProvider.heroKey);
              navigationProvider.resetTimer();
            },
          ),
          ListTile(
            title: const Text('About', style: TextStyle(color: Colors.white)),
            onTap: () {
              navigationProvider.closeDrawer();
              scrollProvider.scrollToSection(scrollProvider.aboutKey);
              navigationProvider.resetTimer();
            },
          ),
          ListTile(
            title: const Text('Skills', style: TextStyle(color: Colors.white)),
            onTap: () {
              navigationProvider.closeDrawer();
              scrollProvider.scrollToSection(scrollProvider.skillsKey);
              navigationProvider.resetTimer();
            },
          ),
          ListTile(
            title:
                const Text('Projects', style: TextStyle(color: Colors.white)),
            onTap: () {
              navigationProvider.closeDrawer();
              scrollProvider.scrollToSection(scrollProvider.projectsKey);
              navigationProvider.resetTimer();
            },
          ),
          ListTile(
            title:
                const Text('Experience', style: TextStyle(color: Colors.white)),
            onTap: () {
              navigationProvider.closeDrawer();
              scrollProvider.scrollToSection(scrollProvider.experienceKey);
              navigationProvider.resetTimer();
            },
          ),
          ListTile(
            title: const Text('Contact', style: TextStyle(color: Colors.white)),
            onTap: () {
              navigationProvider.closeDrawer();
              scrollProvider.scrollToSection(scrollProvider.contactKey);
              navigationProvider.resetTimer();
            },
          ),
        ],
      ),
    );

    return isOverlay
        ? SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).animate(navigationProvider.drawerAnimationController!),
            child: drawerContent,
          )
        : drawerContent;
  }
}
