import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../themes.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount;
    double padding;
    double iconSize;
    double spacing;

    if (screenWidth < 600) {
      crossAxisCount = 1;
      padding = 16;
      iconSize = 24;
      spacing = 16;
    } else if (screenWidth < 900) {
      crossAxisCount = 2;
      padding = 24;
      iconSize = 28;
      spacing = 24;
    } else {
      crossAxisCount = 3;
      padding = 32;
      iconSize = 32;
      spacing = 32;
    }

    return Container(
      padding: EdgeInsets.all(padding),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.work_outline,
                size: iconSize,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(width: 8),
              Text(
                'Projects',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: screenWidth < 600 ? 24 : null,
                    ),
              ),
            ],
          ),
          SizedBox(height: spacing),
          GridView.count(
            crossAxisCount: crossAxisCount,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: spacing / 2,
            crossAxisSpacing: spacing / 2,
            children: [
              ProjectCard(
                title: 'E-Commerce App',
                description:
                    'A comprehensive e-commerce application featuring product catalog, shopping cart, payment integration, and user authentication.',
                techStack: 'Flutter, Dart, Firebase, Stripe API',
                icon: Icons.shopping_cart,
                gradientColors: AppThemes.projectGradient1.colors,
              ).animate().fadeIn(duration: 600.ms, delay: 100.ms).slideY(
                    begin: 0.3,
                    end: 0,
                    duration: 500.ms,
                    curve: Curves.easeOutCubic,
                  ),
              ProjectCard(
                title: 'Weather App',
                description:
                    'A weather application providing real-time weather data, forecasts, and location-based information with a clean, intuitive UI.',
                techStack: 'Flutter, Dart, OpenWeatherMap API',
                icon: Icons.cloud,
                gradientColors: AppThemes.projectGradient2.colors,
              ).animate().fadeIn(duration: 600.ms, delay: 200.ms).slideY(
                    begin: 0.3,
                    end: 0,
                    duration: 500.ms,
                    curve: Curves.easeOutCubic,
                  ),
              ProjectCard(
                title: 'Task Manager',
                description:
                    'A productivity app for managing tasks, setting reminders, and organizing daily activities with offline support.',
                techStack: 'Flutter, Dart, SQLite, Provider',
                icon: Icons.task,
                gradientColors: AppThemes.projectGradient3.colors,
              ).animate().fadeIn(duration: 600.ms, delay: 300.ms).slideY(
                    begin: 0.3,
                    end: 0,
                    duration: 500.ms,
                    curve: Curves.easeOutCubic,
                  ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.techStack,
    required this.icon,
    required this.gradientColors,
  });

  final String title;
  final String description;
  final String techStack;
  final IconData icon;
  final List<Color> gradientColors;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  void _showProjectModal() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: widget.gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(
                    widget.icon,
                    size: 32,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                widget.description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.code,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Technologies: ${widget.techStack}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Status: Completed',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: widget.gradientColors[0],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double padding;
    double titleFontSize;
    double descFontSize;
    double buttonFontSize;

    if (screenWidth < 600) {
      padding = 12;
      titleFontSize = 18;
      descFontSize = 14;
      buttonFontSize = 12;
    } else if (screenWidth < 900) {
      padding = 14;
      titleFontSize = 20;
      descFontSize = 15;
      buttonFontSize = 14;
    } else {
      padding = 16;
      titleFontSize = 22;
      descFontSize = 16;
      buttonFontSize = 16;
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        margin: EdgeInsets.all(_isHovered ? 8 : 0),
        transform: Matrix4.identity()
          ..scale(_isHovered ? 1.08 : 1.0)
          ..rotateZ(_isHovered ? 0.01 : 0.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _isHovered
                  ? widget.gradientColors
                  : [
                      Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : const Color(0xFF1E1E1E),
                      Theme.of(context).brightness == Brightness.light
                          ? const Color(0xFFF0F8FF)
                          : const Color(0xFF2D2D2D),
                    ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? widget.gradientColors[0].withOpacity(0.4)
                    : Colors.black.withOpacity(0.1),
                blurRadius: _isHovered ? 20 : 8,
                spreadRadius: _isHovered ? 2 : 0,
                offset: Offset(0, _isHovered ? 8 : 4),
              ),
              if (_isHovered)
                BoxShadow(
                  color: widget.gradientColors[1].withOpacity(0.2),
                  blurRadius: 30,
                  spreadRadius: 1,
                  offset: const Offset(0, 0),
                ),
            ],
          ),
          child: InkWell(
            onTap: _showProjectModal,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Project icon
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: _isHovered
                          ? Colors.white.withOpacity(0.2)
                          : Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      widget.icon,
                      size: 32,
                      color: _isHovered
                          ? Colors.white
                          : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: padding / 2),
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: titleFontSize,
                          fontWeight:
                              _isHovered ? FontWeight.bold : FontWeight.w600,
                          color: _isHovered
                              ? Colors.white
                              : Theme.of(context).colorScheme.onSurface,
                        ),
                    child: Text(widget.title),
                  ),
                  SizedBox(height: padding / 2),
                  Expanded(
                    child: Text(
                      widget.description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: descFontSize,
                            color: _isHovered
                                ? Colors.white.withOpacity(0.9)
                                : Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.8),
                          ),
                      maxLines: screenWidth < 600 ? 3 : 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: padding / 2),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: _isHovered
                          ? const LinearGradient(
                              colors: [Colors.white, Colors.white70],
                            )
                          : AppThemes.getButtonGradient(
                              Theme.of(context).brightness,
                            ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: _isHovered
                          ? [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : null,
                    ),
                    child: ElevatedButton(
                      onPressed: _showProjectModal,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        elevation: 0,
                        padding: EdgeInsets.symmetric(vertical: padding / 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'View Project',
                        style: TextStyle(
                          fontSize: buttonFontSize,
                          color: _isHovered ? widget.gradientColors[0] : null,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
