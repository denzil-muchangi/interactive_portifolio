class Experience {
  final String year;
  final String title;
  final String company;
  final String description;

  const Experience({
    required this.year,
    required this.title,
    required this.company,
    required this.description,
  });
}

final List<Experience> experiences = [
  Experience(
    year: '2023 - Present',
    title: 'Senior Flutter Developer',
    company: 'TechCorp',
    description:
        'Leading a team in developing high-quality mobile applications using Flutter, mentoring junior developers, and implementing best practices.',
  ),
  Experience(
    year: '2021 - 2023',
    title: 'Flutter Developer',
    company: 'Startup Inc.',
    description:
        'Developed and maintained multiple Flutter applications for client projects, focusing on performance and user experience.',
  ),
  Experience(
    year: '2020 - 2021',
    title: 'Junior Developer',
    company: 'Software House',
    description:
        'Assisted in developing Flutter applications, gained experience in state management and UI design.',
  ),
];
