import 'package:flutter/material.dart';
import '../../../themes.dart';

class MobileExperienceSection extends StatelessWidget {
  const MobileExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.business_center_outlined,
                size: 28,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'Experience',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Column(
            children: [
              MobileExperienceItem(
                year: '2023 - Present',
                title: 'Senior Flutter Developer',
                company: 'TechCorp',
                description:
                    'Leading a team in developing high-quality mobile applications using Flutter, mentoring junior developers, and implementing best practices.',
              ),
              SizedBox(height: 16),
              MobileExperienceItem(
                year: '2021 - 2023',
                title: 'Flutter Developer',
                company: 'Startup Inc.',
                description:
                    'Developed and maintained multiple Flutter applications for client projects, focusing on performance and user experience.',
              ),
              SizedBox(height: 16),
              MobileExperienceItem(
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
  }
}

class MobileExperienceItem extends StatelessWidget {
  const MobileExperienceItem({
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
    return Container(
      decoration: BoxDecoration(
        gradient: AppThemes.getCardGradient(Theme.of(context).brightness),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              year,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            Text(company, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
