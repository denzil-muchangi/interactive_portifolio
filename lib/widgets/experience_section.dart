import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Text(
                'Experience',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 32),
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
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 80,
              alignment: Alignment.center,
              child: Text(
                year,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.headlineSmall),
                  Text(company, style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
