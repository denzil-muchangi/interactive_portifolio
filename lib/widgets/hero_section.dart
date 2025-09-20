import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 800;
        return Container(
          height: isDesktop ? 600 : 400,
          width: double.infinity,
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to My Portfolio',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: isDesktop ? 48 : 32,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Flutter Developer specializing in beautiful, responsive apps',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: isDesktop ? 24 : 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    // Micro-interaction: show snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Exploring work...')),
                    );
                  },
                  child: const Text('Explore My Work'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
