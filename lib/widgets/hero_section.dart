import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_animate/flutter_animate.dart';
import '../themes.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 800;
        return Container(
          height: isDesktop ? 600 : 400,
          width: double.infinity,
          child: Stack(
            children: [
              // Animated background with CustomPainter
              AnimatedBackground(),
              // Gradient overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Theme.of(context).brightness == Brightness.light
                          ? Colors.white.withOpacity(0.1)
                          : Colors.black.withOpacity(0.3),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Center(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Animated icon and title
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedIconWidget(
                              icon: Icons.waving_hand,
                              size: isDesktop ? 48 : 32,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                'Welcome to My Portfolio',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(
                                  fontSize: isDesktop ? 48 : 32,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withOpacity(0.3),
                                      offset: const Offset(2, 2),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ).animate().fadeIn(duration: 800.ms).slideY(
                                    begin: 0.3,
                                    end: 0,
                                    duration: 600.ms,
                                    curve: Curves.easeOutCubic,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Flutter Developer specializing in beautiful, responsive apps',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: isDesktop ? 24 : 18,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(1, 1),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        )
                            .animate()
                            .fadeIn(delay: 400.ms, duration: 800.ms)
                            .slideY(
                              begin: 0.2,
                              end: 0,
                              duration: 600.ms,
                              curve: Curves.easeOutCubic,
                            ),
                        const SizedBox(height: 32),
                        // Enhanced button with shadow and animation
                        Container(
                          decoration: BoxDecoration(
                            gradient: AppThemes.getButtonGradient(
                              Theme.of(context).brightness,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.4),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Exploring work...'),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: const Text(
                              'Explore My Work',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                            .animate()
                            .fadeIn(delay: 800.ms, duration: 600.ms)
                            .scale(
                              begin: const Offset(0.8, 0.8),
                              end: const Offset(1, 1),
                              duration: 500.ms,
                              curve: Curves.elasticOut,
                            ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Animated background with floating particles
class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  final List<Particle> _particles = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    // Create particles
    for (int i = 0; i < 20; i++) {
      _particles.add(Particle.random());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: ParticlePainter(_particles, _controller.value),
          size: Size.infinite,
        );
      },
    );
  }
}

// Particle class for floating elements
class Particle {
  late double x, y, size, speed, opacity;
  late Color color;

  Particle.random() {
    final random = Random();
    x = random.nextDouble() * 400;
    y = random.nextDouble() * 600;
    size = random.nextDouble() * 4 + 2;
    speed = random.nextDouble() * 0.5 + 0.1;
    opacity = random.nextDouble() * 0.5 + 0.2;
    color = Color.fromRGBO(
      random.nextInt(100) + 100,
      random.nextInt(100) + 100,
      random.nextInt(100) + 150,
      opacity,
    );
  }
}

// CustomPainter for particles
class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final double animationValue;

  ParticlePainter(this.particles, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      final paint = Paint()..color = particle.color;
      canvas.drawCircle(
        Offset(particle.x + animationValue * 50, particle.y),
        particle.size,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// Animated icon widget
class AnimatedIconWidget extends StatefulWidget {
  final IconData icon;
  final double size;
  final Color color;

  const AnimatedIconWidget({
    super.key,
    required this.icon,
    required this.size,
    required this.color,
  });

  @override
  State<AnimatedIconWidget> createState() => _AnimatedIconWidgetState();
}

class _AnimatedIconWidgetState extends State<AnimatedIconWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Icon(
        widget.icon,
        size: widget.size,
        color: widget.color,
      ),
    );
  }
}
