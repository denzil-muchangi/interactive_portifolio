import 'dart:math';
import 'package:flutter/material.dart';

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
