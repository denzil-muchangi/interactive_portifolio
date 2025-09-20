import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../themes.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount;
    double padding;
    double iconSize;
    double spacing;

    if (screenWidth < 600) {
      crossAxisCount = 2;
      padding = 16;
      iconSize = 24;
      spacing = 16;
    } else if (screenWidth < 900) {
      crossAxisCount = 3;
      padding = 24;
      iconSize = 28;
      spacing = 24;
    } else {
      crossAxisCount = 4;
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
                Icons.star_outline,
                size: iconSize,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(width: 8),
              Text(
                'Skills',
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
    final screenWidth = MediaQuery.of(context).size.width;
    double progressSize;
    double iconSize;
    double padding;
    double strokeWidth;

    if (screenWidth < 600) {
      progressSize = 32;
      iconSize = 16;
      padding = 12;
      strokeWidth = 3;
    } else if (screenWidth < 900) {
      progressSize = 40;
      iconSize = 20;
      padding = 14;
      strokeWidth = 3.5;
    } else {
      progressSize = 48;
      iconSize = 24;
      padding = 16;
      strokeWidth = 4;
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
          ..rotateZ(_isHovered ? 0.02 : 0.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: AppThemes.getCardGradient(Theme.of(context).brightness),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context)
                    .colorScheme
                    .primary
                    .withOpacity(_isHovered ? 0.3 : 0.1),
                blurRadius: _isHovered ? 20 : 8,
                spreadRadius: _isHovered ? 2 : 0,
                offset: Offset(0, _isHovered ? 8 : 4),
              ),
              if (_isHovered)
                BoxShadow(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                  blurRadius: 30,
                  spreadRadius: 1,
                  offset: const Offset(0, 0),
                ),
            ],
          ),
          child: InkWell(
            onTap: () {
              // Add haptic feedback or sound
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      '${widget.title} - ${(widget.progress * 100).toInt()}% proficiency'),
                  duration: const Duration(seconds: 1),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Enhanced progress indicator with gradient
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: widget.progress),
                    duration: const Duration(seconds: 2),
                    curve: Curves.elasticOut,
                    builder: (context, value, child) {
                      return Container(
                        width: progressSize,
                        height: progressSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.2),
                              Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.2),
                            ],
                          ),
                          boxShadow: _isHovered
                              ? [
                                  BoxShadow(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.4),
                                    blurRadius: 15,
                                    spreadRadius: 2,
                                  ),
                                ]
                              : null,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: progressSize,
                              height: progressSize,
                              child: CircularProgressIndicator(
                                value: value,
                                strokeWidth: strokeWidth,
                                backgroundColor:
                                    Colors.grey.shade300.withOpacity(0.3),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  _isHovered
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                            AnimatedScale(
                              scale: _isHovered ? 1.2 : 1.0,
                              duration: const Duration(milliseconds: 200),
                              child: Icon(
                                widget.icon,
                                size: iconSize,
                                color: _isHovered
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: padding / 2),
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: screenWidth < 600 ? 14 : null,
                          fontWeight:
                              _isHovered ? FontWeight.bold : FontWeight.normal,
                          color: _isHovered
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onSurface,
                        ),
                    child: Text(widget.title),
                  ),
                  SizedBox(height: padding / 4),
                  Text(
                    '${(widget.progress * 100).toInt()}%',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: screenWidth < 600 ? 12 : null,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.7),
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ).animate().fadeIn(duration: 600.ms).slideY(
            begin: 0.2,
            end: 0,
            duration: 500.ms,
            curve: Curves.easeOutCubic,
          ),
    );
  }
}
