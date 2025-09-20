import 'package:flutter/material.dart';

class Project {
  final String title;
  final String description;
  final String techStack;
  final IconData icon;
  final List<Color> gradientColors;
  final String status;

  const Project({
    required this.title,
    required this.description,
    required this.techStack,
    required this.icon,
    required this.gradientColors,
    this.status = 'Completed',
  });
}

final List<Project> projects = [
  Project(
    title: 'E-Commerce App',
    description:
        'A comprehensive e-commerce application featuring product catalog, shopping cart, payment integration, and user authentication.',
    techStack: 'Flutter, Dart, Firebase, Stripe API',
    icon: Icons.shopping_cart,
    gradientColors: [Colors.blue, Colors.purple],
  ),
  Project(
    title: 'Weather App',
    description:
        'A weather application providing real-time weather data, forecasts, and location-based information with a clean, intuitive UI.',
    techStack: 'Flutter, Dart, OpenWeatherMap API',
    icon: Icons.cloud,
    gradientColors: [Colors.lightBlue, Colors.blue],
  ),
  Project(
    title: 'Task Manager',
    description:
        'A productivity app for managing tasks, setting reminders, and organizing daily activities with offline support.',
    techStack: 'Flutter, Dart, SQLite, Provider',
    icon: Icons.task,
    gradientColors: [Colors.green, Colors.teal],
  ),
];
