import 'package:flutter/material.dart';

class ScrollProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  final GlobalKey heroKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  bool heroVisible = false;
  bool aboutVisible = false;
  bool skillsVisible = false;
  bool projectsVisible = false;
  bool experienceVisible = false;
  bool contactVisible = false;

  double scrollProgress = 0.0;

  ScrollProvider() {
    scrollController.addListener(_updateScrollProgress);
  }

  void _updateScrollProgress() {
    if (scrollController.position.maxScrollExtent > 0) {
      scrollProgress = scrollController.position.pixels /
          scrollController.position.maxScrollExtent;
      notifyListeners();
    }
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void setSectionVisible(String section, bool visible) {
    switch (section) {
      case 'hero':
        if (visible && !heroVisible) {
          heroVisible = true;
          notifyListeners();
        }
        break;
      case 'about':
        if (visible && !aboutVisible) {
          aboutVisible = true;
          notifyListeners();
        }
        break;
      case 'skills':
        if (visible && !skillsVisible) {
          skillsVisible = true;
          notifyListeners();
        }
        break;
      case 'projects':
        if (visible && !projectsVisible) {
          projectsVisible = true;
          notifyListeners();
        }
        break;
      case 'experience':
        if (visible && !experienceVisible) {
          experienceVisible = true;
          notifyListeners();
        }
        break;
      case 'contact':
        if (visible && !contactVisible) {
          contactVisible = true;
          notifyListeners();
        }
        break;
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_updateScrollProgress);
    scrollController.dispose();
    super.dispose();
  }
}
