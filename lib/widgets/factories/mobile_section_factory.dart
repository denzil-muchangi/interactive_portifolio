import 'package:flutter/material.dart';
import '../mobile/sections/mobile_hero_section.dart';
import '../mobile/sections/mobile_about_section.dart';
import '../mobile/sections/mobile_skills_section.dart';
import '../mobile/sections/mobile_experience_section.dart';
import '../mobile/sections/mobile_projects_section.dart';
import '../mobile/sections/mobile_contact_section.dart';

abstract class MobileSectionFactory {
  Widget createHeroSection();
  Widget createAboutSection();
  Widget createSkillsSection();
  Widget createExperienceSection();
  Widget createProjectsSection();
  Widget createContactSection();
}

class MobileSectionFactoryImpl implements MobileSectionFactory {
  @override
  Widget createHeroSection() => const MobileHeroSection();

  @override
  Widget createAboutSection() => const MobileAboutSection();

  @override
  Widget createSkillsSection() => const MobileSkillsSection();

  @override
  Widget createExperienceSection() => const MobileExperienceSection();

  @override
  Widget createProjectsSection() => const MobileProjectsSection();

  @override
  Widget createContactSection() => const MobileContactSection();
}
