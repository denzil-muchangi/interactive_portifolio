import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'widgets/hero_section.dart';
import 'widgets/about_section.dart';
import 'widgets/skills_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/experience_section.dart';
import 'widgets/contact_section.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const PortfolioApp(),
    ),
  );
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Flutter Developer Portfolio',
          theme: themeProvider.currentTheme,
          home: const PortfolioHomePage(),
        );
      },
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  bool _heroVisible = false;
  bool _aboutVisible = false;
  bool _skillsVisible = false;
  bool _projectsVisible = false;
  bool _experienceVisible = false;
  bool _contactVisible = false;

  double _scrollProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateScrollProgress);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateScrollProgress);
    _scrollController.dispose();
    super.dispose();
  }

  void _updateScrollProgress() {
    if (_scrollController.position.maxScrollExtent > 0) {
      setState(() {
        _scrollProgress = _scrollController.position.pixels /
            _scrollController.position.maxScrollExtent;
      });
    }
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(
            value: _scrollProgress,
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
          TextButton(
            onPressed: () => _scrollToSection(_heroKey),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('Home'),
          ),
          TextButton(
            onPressed: () => _scrollToSection(_aboutKey),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('About'),
          ),
          TextButton(
            onPressed: () => _scrollToSection(_skillsKey),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('Skills'),
          ),
          TextButton(
            onPressed: () => _scrollToSection(_projectsKey),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('Projects'),
          ),
          TextButton(
            onPressed: () => _scrollToSection(_experienceKey),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('Experience'),
          ),
          TextButton(
            onPressed: () => _scrollToSection(_contactKey),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('Contact'),
          ),
        ],
      ),
      drawer: Drawer(
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return ListView(
              children: [
                DrawerHeader(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Navigation',
                          style: TextStyle(color: Colors.white)),
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
                  title:
                      const Text('Home', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                    _scrollToSection(_heroKey);
                  },
                ),
                ListTile(
                  title: const Text('About',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                    _scrollToSection(_aboutKey);
                  },
                ),
                ListTile(
                  title: const Text('Skills',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                    _scrollToSection(_skillsKey);
                  },
                ),
                ListTile(
                  title: const Text('Projects',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                    _scrollToSection(_projectsKey);
                  },
                ),
                ListTile(
                  title: const Text('Experience',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                    _scrollToSection(_experienceKey);
                  },
                ),
                ListTile(
                  title: const Text('Contact',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                    _scrollToSection(_contactKey);
                  },
                ),
              ],
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            VisibilityDetector(
              key: const Key('hero'),
              onVisibilityChanged: (info) {
                if (info.visibleFraction > 0.1 && !_heroVisible) {
                  setState(() => _heroVisible = true);
                }
              },
              child: AnimatedOpacity(
                opacity: _heroVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Container(key: _heroKey, child: const HeroSection()),
              ),
            ),
            VisibilityDetector(
              key: const Key('about'),
              onVisibilityChanged: (info) {
                if (info.visibleFraction > 0.1 && !_aboutVisible) {
                  setState(() => _aboutVisible = true);
                }
              },
              child: AnimatedOpacity(
                opacity: _aboutVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Container(key: _aboutKey, child: const AboutSection()),
              ),
            ),
            VisibilityDetector(
              key: const Key('skills'),
              onVisibilityChanged: (info) {
                if (info.visibleFraction > 0.1 && !_skillsVisible) {
                  setState(() => _skillsVisible = true);
                }
              },
              child: AnimatedOpacity(
                opacity: _skillsVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Container(key: _skillsKey, child: const SkillsSection()),
              ),
            ),
            VisibilityDetector(
              key: const Key('projects'),
              onVisibilityChanged: (info) {
                if (info.visibleFraction > 0.1 && !_projectsVisible) {
                  setState(() => _projectsVisible = true);
                }
              },
              child: AnimatedOpacity(
                opacity: _projectsVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Container(
                  key: _projectsKey,
                  child: const ProjectsSection(),
                ),
              ),
            ),
            VisibilityDetector(
              key: const Key('experience'),
              onVisibilityChanged: (info) {
                if (info.visibleFraction > 0.1 && !_experienceVisible) {
                  setState(() => _experienceVisible = true);
                }
              },
              child: AnimatedOpacity(
                opacity: _experienceVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Container(
                  key: _experienceKey,
                  child: const ExperienceSection(),
                ),
              ),
            ),
            VisibilityDetector(
              key: const Key('contact'),
              onVisibilityChanged: (info) {
                if (info.visibleFraction > 0.1 && !_contactVisible) {
                  setState(() => _contactVisible = true);
                }
              },
              child: AnimatedOpacity(
                opacity: _contactVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Container(
                  key: _contactKey,
                  child: const ContactSection(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
