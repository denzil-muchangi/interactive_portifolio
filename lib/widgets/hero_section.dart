import 'package:flutter/material.dart';
import '../themes.dart';

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
          decoration: BoxDecoration(
            gradient: AppThemes.getHeroGradient(Theme.of(context).brightness),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.waving_hand,
                      size: isDesktop ? 48 : 32,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Welcome to My Portfolio',
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(
                              fontSize: isDesktop ? 48 : 32,
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
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
                Container(
                  decoration: BoxDecoration(
                    gradient: AppThemes.getButtonGradient(
                      Theme.of(context).brightness,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Micro-interaction: show snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Exploring work...')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                    ),
                    child: const Text('Explore My Work'),
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
