import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth > 800 ? 4 : 2;
        return Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Text('Skills', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 32),
              GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  SkillCard(
                    title: 'Flutter',
                    icon: Icons.flutter_dash,
                    progress: 0.9,
                  ),
                  SkillCard(title: 'Dart', icon: Icons.code, progress: 0.85),
                  SkillCard(
                    title: 'Firebase',
                    icon: Icons.cloud,
                    progress: 0.8,
                  ),
                  SkillCard(title: 'Git', icon: Icons.merge, progress: 0.75),
                  SkillCard(
                    title: 'UI/UX',
                    icon: Icons.design_services,
                    progress: 0.7,
                  ),
                  SkillCard(title: 'REST APIs', icon: Icons.api, progress: 0.8),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class SkillCard extends StatefulWidget {
  const SkillCard({
    super.key,
    required this.title,
    required this.icon,
    required this.progress,
  });

  final String title;
  final IconData icon;
  final double progress;

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
        child: InkWell(
          onTap: () {}, // Add ripple effect
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: widget.progress),
                    duration: const Duration(seconds: 2),
                    builder: (context, value, child) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 48,
                            height: 48,
                            child: CircularProgressIndicator(
                              value: value,
                              strokeWidth: 4,
                              backgroundColor: Colors.grey.shade300,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                _isHovered
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                          Icon(
                            widget.icon,
                            size: 24,
                            color: _isHovered
                                ? Theme.of(context).colorScheme.primary
                                : null,
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${(widget.progress * 100).toInt()}%',
                    style: Theme.of(context).textTheme.bodySmall,
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
