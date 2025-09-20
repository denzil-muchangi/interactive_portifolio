import 'package:flutter/material.dart';

abstract class TabletSectionFactory {
  Widget createHeroSection();
  Widget createAboutSection();
  Widget createSkillsSection();
  Widget createExperienceSection();
  Widget createProjectsSection();
  Widget createContactSection();
}
