import 'package:flutter/material.dart';
import '../desktop/sections/desktop_hero_section.dart';
import '../desktop/sections/desktop_about_section.dart';
import '../desktop/sections/desktop_skills_section.dart';
import '../desktop/sections/desktop_experience_section.dart';
import '../desktop/sections/desktop_projects_section.dart';
import '../desktop/sections/desktop_contact_section.dart';

abstract class DesktopSectionFactory {
  Widget createHeroSection();
  Widget createAboutSection();
  Widget createSkillsSection();
  Widget createExperienceSection();
  Widget createProjectsSection();
  Widget createContactSection();
}

class DesktopSectionFactoryImpl implements DesktopSectionFactory {
  @override
  Widget createHeroSection() {
    return const DesktopHeroSection();
  }

  @override
  Widget createAboutSection() {
    return const DesktopAboutSection();
  }

  @override
  Widget createSkillsSection() {
    return const DesktopSkillsSection();
  }

  @override
  Widget createExperienceSection() {
    return const DesktopExperienceSection();
  }

  @override
  Widget createProjectsSection() {
    return const DesktopProjectsSection();
  }

  @override
  Widget createContactSection() {
    return const DesktopContactSection();
  }
}
