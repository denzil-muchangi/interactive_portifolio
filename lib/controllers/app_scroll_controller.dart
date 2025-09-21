import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AppScrollController extends GetxController {
  RxDouble scrollProgress = 0.0.obs;
  ScrollController scrollController = ScrollController();

  final GlobalKey heroKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  RxBool isHeroVisible = false.obs;
  RxBool isAboutVisible = false.obs;
  RxBool isSkillsVisible = false.obs;
  RxBool isExperienceVisible = false.obs;
  RxBool isProjectsVisible = false.obs;
  RxBool isContactVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_updateScrollProgress);
  }

  void _updateScrollProgress() {
    if (scrollController.position.maxScrollExtent > 0) {
      scrollProgress.value = scrollController.position.pixels /
          scrollController.position.maxScrollExtent;
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
        if (visible && !isHeroVisible.value) {
          isHeroVisible.value = true;
        }
        break;
      case 'about':
        if (visible && !isAboutVisible.value) {
          isAboutVisible.value = true;
        }
        break;
      case 'skills':
        if (visible && !isSkillsVisible.value) {
          isSkillsVisible.value = true;
        }
        break;
      case 'experience':
        if (visible && !isExperienceVisible.value) {
          isExperienceVisible.value = true;
        }
        break;
      case 'projects':
        if (visible && !isProjectsVisible.value) {
          isProjectsVisible.value = true;
        }
        break;
      case 'contact':
        if (visible && !isContactVisible.value) {
          isContactVisible.value = true;
        }
        break;
    }
  }

  @override
  void onClose() {
    scrollController.removeListener(_updateScrollProgress);
    scrollController.dispose();
    super.onClose();
  }
}
