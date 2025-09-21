import 'package:flutter/material.dart';
import '../../../themes.dart';
import '../../../utils/responsive_utils.dart';

class DesktopExperienceSection extends StatelessWidget {
  const DesktopExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final padding = ResponsiveUtils.getResponsivePadding(context);
        final iconSize = ResponsiveUtils.getResponsiveIconSize(context);

        return Container(
          padding: EdgeInsets.all(padding),
          constraints: BoxConstraints(
            minHeight:
                constraints.maxHeight > 600 ? 600 : constraints.maxHeight * 0.8,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.business_center_outlined,
                    size: iconSize,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Experience',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: ResponsiveUtils.getResponsiveFontSize(
                              context, 32),
                        ),
                  ),
                ],
              ),
              SizedBox(height: padding),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ExperienceItem(
                    year: '2023 - Present',
                    title: 'Senior Flutter Developer',
                    company: 'TechCorp',
                    description:
                        'Leading a team in developing high-quality mobile applications using Flutter, mentoring junior developers, and implementing best practices.',
                  ),
                  ExperienceItem(
                    year: '2021 - 2023',
                    title: 'Flutter Developer',
                    company: 'Startup Inc.',
                    description:
                        'Developed and maintained multiple Flutter applications for client projects, focusing on performance and user experience.',
                  ),
                  ExperienceItem(
                    year: '2020 - 2021',
                    title: 'Junior Developer',
                    company: 'Software House',
                    description:
                        'Assisted in developing Flutter applications, gained experience in state management and UI design.',
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

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({
    super.key,
    required this.year,
    required this.title,
    required this.company,
    required this.description,
  });

  final String year;
  final String title;
  final String company;
  final String description;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final padding = ResponsiveUtils.getResponsivePadding(context) / 2;

        return Container(
          margin: EdgeInsets.symmetric(vertical: padding / 2),
          decoration: BoxDecoration(
            gradient: AppThemes.getCardGradient(Theme.of(context).brightness),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Row(
              children: [
                Container(
                  width: constraints.maxWidth > 1200 ? 100 : 80,
                  alignment: Alignment.center,
                  child: Text(
                    year,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: ResponsiveUtils.getResponsiveFontSize(
                              context, 14),
                        ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                              fontSize: ResponsiveUtils.getResponsiveFontSize(
                                  context, 20),
                            ),
                      ),
                      Text(
                        company,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: ResponsiveUtils.getResponsiveFontSize(
                                  context, 16),
                            ),
                      ),
                      SizedBox(height: padding / 2),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: ResponsiveUtils.getResponsiveFontSize(
                                  context, 16),
                              height: 1.5,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
