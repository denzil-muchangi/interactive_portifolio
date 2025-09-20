import 'package:flutter/material.dart';
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
              ),
              ProjectCard(
                title: 'Weather App',
                description:
                    'A weather application providing real-time weather data, forecasts, and location-based information with a clean, intuitive UI.',
                techStack: 'Flutter, Dart, OpenWeatherMap API',
              ),
              ProjectCard(
                title: 'Task Manager',
                description:
                    'A productivity app for managing tasks, setting reminders, and organizing daily activities with offline support.',
                techStack: 'Flutter, Dart, SQLite, Provider',
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
  });

  final String title;
  final String description;
  final String techStack;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  void _showProjectModal() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(widget.title),
        content: Text(
          '${widget.description}\n\nTechnologies: ${widget.techStack}\nStatus: Completed',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
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
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: AppThemes.getCardGradient(Theme.of(context).brightness),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_isHovered ? 0.2 : 0.1),
                blurRadius: _isHovered ? 8 : 2,
                offset: Offset(0, _isHovered ? 4 : 2),
              ),
            ],
          ),
          child: InkWell(
            onTap: _showProjectModal,
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontSize: titleFontSize,
                        ),
                  ),
                  SizedBox(height: padding / 2),
                  Expanded(
                    child: Text(
                      widget.description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: descFontSize,
                          ),
                      maxLines: screenWidth < 600 ? 3 : 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: padding / 2),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: AppThemes.getButtonGradient(
                        Theme.of(context).brightness,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ElevatedButton(
                      onPressed: _showProjectModal,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        elevation: 0,
                        padding: EdgeInsets.symmetric(vertical: padding / 2),
                      ),
                      child: Text(
                        'View Project',
                        style: TextStyle(fontSize: buttonFontSize),
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
