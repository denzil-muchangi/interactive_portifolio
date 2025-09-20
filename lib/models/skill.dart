import 'package:flutter/material.dart';

class Skill {
  final String title;
  final IconData icon;
  final double progress;

  const Skill({
    required this.title,
    required this.icon,
    required this.progress,
  });
}

final List<Skill> skills = [
  Skill(
    title: 'Flutter',
    icon: Icons.flutter_dash,
    progress: 0.9,
  ),
  Skill(
    title: 'Dart',
    icon: Icons.code,
    progress: 0.85,
  ),
  Skill(
    title: 'Firebase',
    icon: Icons.cloud,
    progress: 0.8,
  ),
  Skill(
    title: 'Git',
    icon: Icons.merge,
    progress: 0.75,
  ),
  Skill(
    title: 'UI/UX',
    icon: Icons.design_services,
    progress: 0.7,
  ),
  Skill(
    title: 'REST APIs',
    icon: Icons.api,
    progress: 0.8,
  ),
];
