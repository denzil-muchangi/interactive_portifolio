import 'package:flutter/material.dart';
import '../tablet/sections/tablet_hero_section.dart';
import '../tablet/sections/tablet_about_section.dart';
import '../tablet/sections/tablet_skills_section.dart';
import '../mobile/sections/mobile_experience_section.dart';
import '../mobile/sections/mobile_projects_section.dart';
import '../mobile/sections/mobile_contact_section.dart';

abstract class TabletSectionFactory {
  Widget createHeroSection();
  Widget createAboutSection();
  Widget createSkillsSection();
  Widget createExperienceSection();
  Widget createProjectsSection();
  Widget createContactSection();
}

class TabletSectionFactoryImpl implements TabletSectionFactory {
  @override
  Widget createHeroSection() => const TabletHeroSection();

  @override
  Widget createAboutSection() => const TabletAboutSection();

  @override
  Widget createSkillsSection() => const TabletSkillsSection();

  @override
  Widget createExperienceSection() => const MobileExperienceSection();

  @override
  Widget createProjectsSection() => const MobileProjectsSection();

  @override
  Widget createContactSection() => const MobileContactSection();
}
