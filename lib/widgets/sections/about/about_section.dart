import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 800;
        return Container(
          padding: const EdgeInsets.all(32),
          child: isDesktop
              ? Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.secondary,
                        child: const Icon(Icons.account_circle, size: 100),
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                size: 32,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'About Me',
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineMedium,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Passionate Flutter developer with experience in building cross-platform mobile and web applications. I love creating beautiful, user-friendly interfaces and solving complex problems with elegant code.',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: const Icon(Icons.account_circle, size: 80),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 32,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'About Me',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Passionate Flutter developer with experience in building cross-platform mobile and web applications. I love creating beautiful, user-friendly interfaces and solving complex problems with elegant code.',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
        );
      },
    );
  }
}
