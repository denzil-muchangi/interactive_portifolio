import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:vector_math/vector_math_64.dart' as vm;
import '../../../themes.dart';
import '../../../utils/responsive_utils.dart';

class DesktopSkillsSection extends StatelessWidget {
  const DesktopSkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final padding = ResponsiveUtils.getResponsivePadding(context);
        final iconSize = ResponsiveUtils.getResponsiveIconSize(context);
        final crossAxisCount =
            ResponsiveUtils.getGridCrossAxisCount(context, maxCount: 4);

        return Container(
          padding: EdgeInsets.all(padding),
          constraints: BoxConstraints(
            minHeight:
                constraints.maxHeight > 500 ? 500 : constraints.maxHeight * 0.7,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star_outline,
                    size: iconSize,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Skills',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: ResponsiveUtils.getResponsiveFontSize(
                              context, 32),
                        ),
                  ),
                ],
              ),
              SizedBox(height: padding),
              GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: padding / 2,
                crossAxisSpacing: padding / 2,
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final padding = ResponsiveUtils.getResponsivePadding(context) / 2;
        final progressSize = constraints.maxWidth > 200 ? 48.0 : 40.0;
        final iconSize = constraints.maxWidth > 200 ? 24.0 : 20.0;
        final strokeWidth = constraints.maxWidth > 200 ? 4.0 : 3.5;

        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            margin: EdgeInsets.all(_isHovered ? 8 : 0),
            transform: Matrix4.identity()
              ..scaleByVector3(vm.Vector3.all(_isHovered ? 1.08 : 1.0))
              ..rotateZ(_isHovered ? 0.02 : 0.0),
            child: Container(
              decoration: BoxDecoration(
                gradient:
                    AppThemes.getCardGradient(Theme.of(context).brightness),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withValues(alpha: _isHovered ? 0.3 : 0.1),
                    blurRadius: _isHovered ? 20 : 8,
                    spreadRadius: _isHovered ? 2 : 0,
                    offset: Offset(0, _isHovered ? 8 : 4),
                  ),
                  if (_isHovered)
                    BoxShadow(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withValues(alpha: 0.2),
                      blurRadius: 30,
                      spreadRadius: 1,
                      offset: const Offset(0, 0),
                    ),
                ],
              ),
              child: InkWell(
                onTap: () {
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
                                      .withValues(alpha: 0.2),
                                  Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withValues(alpha: 0.2),
                                ],
                              ),
                              boxShadow: _isHovered
                                  ? [
                                      BoxShadow(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withValues(alpha: 0.4),
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
                                    backgroundColor: Colors.grey.shade300
                                        .withValues(alpha: 0.3),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      _isHovered
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                          : Theme.of(context)
                                              .colorScheme
                                              .secondary,
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
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSurface,
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
                              fontSize: ResponsiveUtils.getResponsiveFontSize(
                                  context, 16),
                              fontWeight: _isHovered
                                  ? FontWeight.bold
                                  : FontWeight.normal,
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
                              fontSize: ResponsiveUtils.getResponsiveFontSize(
                                  context, 14),
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withValues(alpha: 0.7),
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
      },
    );
  }
}
