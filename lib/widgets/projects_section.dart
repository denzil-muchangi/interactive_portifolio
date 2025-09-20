import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth > 800 ? 3 : 1;
        return Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Text(
                'Projects',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 32),
              GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
      },
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
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
        child: InkWell(
          onTap: _showProjectModal,
          child: Card(
            elevation: _isHovered ? 8 : 2,
            color: _isHovered
                ? Theme.of(
                    context,
                  ).colorScheme.primaryContainer.withOpacity(0.8)
                : Theme.of(context).cardColor,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: _showProjectModal,
                    child: const Text('View Project'),
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
