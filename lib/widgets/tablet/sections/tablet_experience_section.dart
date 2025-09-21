import 'package:flutter/material.dart';
import '../../../themes.dart';
import '../../../utils/responsive_utils.dart';

class TabletExperienceSection extends StatelessWidget {
  const TabletExperienceSection({super.key});

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
                  SizedBox(width: padding * 0.5),
                  Text(
                    'Experience',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: ResponsiveUtils.getResponsiveFontSize(
                              context, 28),
                        ),
                  ),
                ],
              ),
              SizedBox(height: padding),
              GridView.count(
                crossAxisCount:
                    ResponsiveUtils.getGridCrossAxisCount(context, maxCount: 2),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: padding,
                crossAxisSpacing: padding,
                children: const [
                  TabletExperienceItem(
                    year: '2023 - Present',
                    title: 'Senior Flutter Developer',
                    company: 'TechCorp',
                    description:
                        'Leading a team in developing high-quality mobile applications using Flutter, mentoring junior developers, and implementing best practices.',
                  ),
                  TabletExperienceItem(
                    year: '2021 - 2023',
                    title: 'Flutter Developer',
                    company: 'Startup Inc.',
                    description:
                        'Developed and maintained multiple Flutter applications for client projects, focusing on performance and user experience.',
                  ),
                  TabletExperienceItem(
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

class TabletExperienceItem extends StatelessWidget {
  const TabletExperienceItem({
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
    final padding = ResponsiveUtils.getResponsivePadding(context) / 2;

    return Container(
      decoration: BoxDecoration(
        gradient: AppThemes.getCardGradient(Theme.of(context).brightness),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: padding, vertical: padding / 2),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                year,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize:
                          ResponsiveUtils.getResponsiveFontSize(context, 12),
                    ),
              ),
            ),
            SizedBox(height: padding),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize:
                        ResponsiveUtils.getResponsiveFontSize(context, 18),
                  ),
            ),
            Text(
              company,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize:
                        ResponsiveUtils.getResponsiveFontSize(context, 14),
                  ),
            ),
            SizedBox(height: padding),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize:
                        ResponsiveUtils.getResponsiveFontSize(context, 14),
                    height: 1.5,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
