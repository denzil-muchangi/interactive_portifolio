import 'package:flutter/material.dart';
import '../../../themes.dart';
import '../../../utils/responsive_utils.dart';

class TabletSkillsSection extends StatelessWidget {
  const TabletSkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ResponsiveUtils.getResponsivePadding(context)),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.star_outline,
                size: ResponsiveUtils.getResponsiveIconSize(context),
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'Skills',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          SizedBox(height: ResponsiveUtils.getResponsivePadding(context)),
          GridView.count(
            crossAxisCount: ResponsiveUtils.getGridCrossAxisCount(context),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: ResponsiveUtils.getResponsivePadding(context),
            crossAxisSpacing: ResponsiveUtils.getResponsivePadding(context),
            children: const [
              TabletSkillCard(
                title: 'Flutter',
                icon: Icons.flutter_dash,
                progress: 0.9,
              ),
              TabletSkillCard(title: 'Dart', icon: Icons.code, progress: 0.85),
              TabletSkillCard(
                title: 'Firebase',
                icon: Icons.cloud,
                progress: 0.8,
              ),
              TabletSkillCard(title: 'Git', icon: Icons.merge, progress: 0.75),
              TabletSkillCard(
                title: 'UI/UX',
                icon: Icons.design_services,
                progress: 0.7,
              ),
              TabletSkillCard(
                  title: 'REST APIs', icon: Icons.api, progress: 0.8),
            ],
          ),
        ],
      ),
    );
  }
}

class TabletSkillCard extends StatelessWidget {
  const TabletSkillCard({
    super.key,
    required this.title,
    required this.icon,
    required this.progress,
  });

  final String title;
  final IconData icon;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppThemes.getCardGradient(Theme.of(context).brightness),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text('$title - ${(progress * 100).toInt()}% proficiency'),
              duration: const Duration(seconds: 1),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding:
              EdgeInsets.all(ResponsiveUtils.getResponsivePadding(context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: ResponsiveUtils.getResponsiveIconSize(context) * 1.5,
                height: ResponsiveUtils.getResponsiveIconSize(context) * 1.5,
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
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width:
                          ResponsiveUtils.getResponsiveIconSize(context) * 1.5,
                      height:
                          ResponsiveUtils.getResponsiveIconSize(context) * 1.5,
                      child: CircularProgressIndicator(
                        value: progress,
                        strokeWidth:
                            ResponsiveUtils.getResponsiveIconSize(context) *
                                0.1,
                        backgroundColor:
                            Colors.grey.shade300.withValues(alpha: 0.3),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                    Icon(
                      icon,
                      size:
                          ResponsiveUtils.getResponsiveIconSize(context) * 0.7,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height: ResponsiveUtils.getResponsivePadding(context) * 0.5),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                  height: ResponsiveUtils.getResponsivePadding(context) * 0.25),
              Text(
                '${(progress * 100).toInt()}%',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
    );
  }
}
