import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme_provider.dart';
import '../../providers/scroll_provider.dart';
import '../../providers/navigation_provider.dart';
import '../../utils/responsive_utils.dart';

class PortfolioNavigationDrawer extends StatefulWidget {
  final bool isOverlay;

  const PortfolioNavigationDrawer({super.key, this.isOverlay = true});

  @override
  State<PortfolioNavigationDrawer> createState() =>
      _PortfolioNavigationDrawerState();
}

class _PortfolioNavigationDrawerState extends State<PortfolioNavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    final drawerWidth =
        200 + ResponsiveUtils.getResponsivePadding(context) * 0.25;

    Widget drawerContent = GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity != null && details.primaryVelocity! > 0) {
          navigationProvider.closeDrawer();
        }
      },
      child: Container(
        width: drawerWidth,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Navigation',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize:
                          ResponsiveUtils.getResponsiveFontSize(context, 20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      themeProvider.isDarkMode
                          ? Icons.light_mode
                          : Icons.dark_mode,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    onPressed: () => themeProvider.toggleTheme(),
                    tooltip: 'Toggle theme',
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Home',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface)),
              onTap: () {
                navigationProvider.closeDrawer();
                scrollProvider.scrollToSection(scrollProvider.heroKey);
                navigationProvider.resetTimer();
              },
            ),
            ListTile(
              title: Text('About',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface)),
              onTap: () {
                navigationProvider.closeDrawer();
                scrollProvider.scrollToSection(scrollProvider.aboutKey);
                navigationProvider.resetTimer();
              },
            ),
            ListTile(
              title: Text('Skills',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface)),
              onTap: () {
                navigationProvider.closeDrawer();
                scrollProvider.scrollToSection(scrollProvider.skillsKey);
                navigationProvider.resetTimer();
              },
            ),
            ListTile(
              title: Text('Projects',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface)),
              onTap: () {
                navigationProvider.closeDrawer();
                scrollProvider.scrollToSection(scrollProvider.projectsKey);
                navigationProvider.resetTimer();
              },
            ),
            ListTile(
              title: Text('Experience',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface)),
              onTap: () {
                navigationProvider.closeDrawer();
                scrollProvider.scrollToSection(scrollProvider.experienceKey);
                navigationProvider.resetTimer();
              },
            ),
            ListTile(
              title: Text('Contact',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface)),
              onTap: () {
                navigationProvider.closeDrawer();
                scrollProvider.scrollToSection(scrollProvider.contactKey);
                navigationProvider.resetTimer();
              },
            ),
          ],
        ),
      ),
    );

    return widget.isOverlay
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
