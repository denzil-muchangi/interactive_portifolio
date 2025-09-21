import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../themes.dart';
import '../../../utils/responsive_utils.dart';
import '../../sections/hero/animated_background.dart';
import '../../sections/hero/animated_icon_widget.dart';

class TabletHeroSection extends StatefulWidget {
  const TabletHeroSection({super.key});

  @override
  State<TabletHeroSection> createState() => _TabletHeroSectionState();
}

class _TabletHeroSectionState extends State<TabletHeroSection>
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
    return SizedBox(
      height: 500,
      width: double.infinity,
      child: Stack(
        children: [
          // Animated background
          AnimatedBackground(),
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Theme.of(context).brightness == Brightness.light
                      ? Colors.white.withValues(alpha: 0.1)
                      : Colors.black.withValues(alpha: 0.3),
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
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          ResponsiveUtils.getResponsivePadding(context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Animated icon and title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedIconWidget(
                            icon: Icons.waving_hand,
                            size:
                                ResponsiveUtils.getResponsiveIconSize(context),
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
                                fontSize: ResponsiveUtils.getResponsiveFontSize(
                                    context, 36),
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withValues(alpha: 0.3),
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
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: ResponsiveUtils.getResponsiveFontSize(
                              context, 20),
                          shadows: [
                            Shadow(
                              color: Colors.black.withValues(alpha: 0.2),
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
                      // Enhanced button
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
                                  .withValues(alpha: 0.4),
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
                            padding: EdgeInsets.symmetric(
                              horizontal: ResponsiveUtils.getResponsivePadding(
                                      context) *
                                  2,
                              vertical: ResponsiveUtils.getResponsivePadding(
                                      context) *
                                  1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            'Explore My Work',
                            style: TextStyle(
                              fontSize: ResponsiveUtils.getResponsiveFontSize(
                                  context, 18),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ).animate().fadeIn(delay: 800.ms, duration: 600.ms).scale(
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
          ),
        ],
      ),
    );
  }
}
