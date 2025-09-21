import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../themes.dart';
import '../../../utils/responsive_utils.dart';

class TabletProjectsSection extends StatelessWidget {
  const TabletProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final padding = ResponsiveUtils.getResponsivePadding(context);
        final iconSize = ResponsiveUtils.getResponsiveIconSize(context);
        final crossAxisCount =
            ResponsiveUtils.getGridCrossAxisCount(context, maxCount: 3);

        return Container(
          padding: EdgeInsets.all(padding),
          constraints: BoxConstraints(
            minHeight:
                constraints.maxHeight > 800 ? 800 : constraints.maxHeight * 0.9,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.work_outline,
                    size: iconSize,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(width: padding * 0.5),
                  Text(
                    'Projects',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: ResponsiveUtils.getResponsiveFontSize(
                              context, 28),
                        ),
                  ),
                ],
              ),
              SizedBox(height: padding),
              GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: padding,
                crossAxisSpacing: padding,
                children: [
                  TabletProjectCard(
                    title: 'E-Commerce App',
                    description:
                        'A comprehensive e-commerce application featuring product catalog, shopping cart, payment integration, and user authentication.',
                    techStack: 'Flutter, Dart, Firebase, Stripe API',
                    icon: Icons.shopping_cart,
                    gradientColors: AppThemes.projectGradient1.colors,
                  ).animate().fadeIn(duration: 600.ms, delay: 100.ms).slideY(
                        begin: 0.3,
                        end: 0,
                        duration: 500.ms,
                        curve: Curves.easeOutCubic,
                      ),
                  TabletProjectCard(
                    title: 'Weather App',
                    description:
                        'A weather application providing real-time weather data, forecasts, and location-based information with a clean, intuitive UI.',
                    techStack: 'Flutter, Dart, OpenWeatherMap API',
                    icon: Icons.cloud,
                    gradientColors: AppThemes.projectGradient2.colors,
                  ).animate().fadeIn(duration: 600.ms, delay: 200.ms).slideY(
                        begin: 0.3,
                        end: 0,
                        duration: 500.ms,
                        curve: Curves.easeOutCubic,
                      ),
                  TabletProjectCard(
                    title: 'Task Manager',
                    description:
                        'A productivity app for managing tasks, setting reminders, and organizing daily activities with offline support.',
                    techStack: 'Flutter, Dart, SQLite, Provider',
                    icon: Icons.task,
                    gradientColors: AppThemes.projectGradient3.colors,
                  ).animate().fadeIn(duration: 600.ms, delay: 300.ms).slideY(
                        begin: 0.3,
                        end: 0,
                        duration: 500.ms,
                        curve: Curves.easeOutCubic,
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

class TabletProjectCard extends StatefulWidget {
  const TabletProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.techStack,
    required this.icon,
    required this.gradientColors,
  });

  final String title;
  final String description;
  final String techStack;
  final IconData icon;
  final List<Color> gradientColors;

  @override
  State<TabletProjectCard> createState() => _TabletProjectCardState();
}

class _TabletProjectCardState extends State<TabletProjectCard> {
  bool _isHovered = false;

  void _showProjectModal() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding:
              EdgeInsets.all(ResponsiveUtils.getResponsivePadding(context)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: widget.gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(
                    widget.icon,
                    size: ResponsiveUtils.getResponsiveIconSize(context),
                    color: Colors.white,
                  ),
                  SizedBox(
                      width:
                          ResponsiveUtils.getResponsivePadding(context) * 0.5),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontSize:
                            ResponsiveUtils.getResponsiveFontSize(context, 24),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: ResponsiveUtils.getResponsivePadding(context) * 0.5),
              Text(
                widget.description,
                style: TextStyle(
                  fontSize: ResponsiveUtils.getResponsiveFontSize(context, 16),
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              SizedBox(
                  height: ResponsiveUtils.getResponsivePadding(context) * 0.5),
              Container(
                padding: EdgeInsets.all(
                    ResponsiveUtils.getResponsivePadding(context) * 0.5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.code,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Technologies: ${widget.techStack}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height: ResponsiveUtils.getResponsivePadding(context) * 0.5),
              Row(
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Status: Completed',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: ResponsiveUtils.getResponsivePadding(context) * 1.5),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: widget.gradientColors[0],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        ResponsiveUtils.getResponsivePadding(context) * 2,
                    vertical: ResponsiveUtils.getResponsivePadding(context),
                  ),
                ),
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final padding = ResponsiveUtils.getResponsivePadding(context) / 2;

        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            margin: EdgeInsets.all(_isHovered ? 8 : 0),
            transform: Matrix4.identity()
              ..setEntry(1, 1, _isHovered ? 1.05 : 1.0)
              ..setEntry(2, 2, _isHovered ? 1.05 : 1.0)
              ..setEntry(3, 3, _isHovered ? 1.05 : 1.0)
              ..rotateZ(_isHovered ? 0.005 : 0.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: _isHovered
                    ? LinearGradient(
                        colors: widget.gradientColors,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : Theme.of(context).brightness == Brightness.light
                        ? const LinearGradient(
                            colors: [Colors.white, Color(0xFFF0F8FF)],
                          )
                        : const LinearGradient(
                            colors: [Color(0xFF1E1E1E), Color(0xFF2D2D2D)],
                          ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: _isHovered
                        ? widget.gradientColors[0].withOpacity(0.4)
                        : Colors.black.withOpacity(0.1),
                    blurRadius: _isHovered ? 20 : 8,
                    spreadRadius: _isHovered ? 2 : 0,
                    offset: Offset(0, _isHovered ? 8 : 4),
                  ),
                ],
              ),
              child: InkWell(
                onTap: _showProjectModal,
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(padding),
                        decoration: BoxDecoration(
                          color: _isHovered
                              ? Colors.white.withOpacity(0.2)
                              : Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          widget.icon,
                          size: ResponsiveUtils.getResponsiveIconSize(context),
                          color: _isHovered
                              ? Colors.white
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(height: padding),
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 200),
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                              fontSize: ResponsiveUtils.getResponsiveFontSize(
                                  context, 18),
                              fontWeight: _isHovered
                                  ? FontWeight.bold
                                  : FontWeight.w600,
                              color: _isHovered
                                  ? Colors.white
                                  : Theme.of(context).colorScheme.onSurface,
                            ),
                        child: Text(widget.title),
                      ),
                      SizedBox(height: padding),
                      Expanded(
                        child: Text(
                          widget.description,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                fontSize: ResponsiveUtils.getResponsiveFontSize(
                                    context, 14),
                                color: _isHovered
                                    ? Colors.white.withOpacity(0.9)
                                    : Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withOpacity(0.8),
                              ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: padding),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: _isHovered
                              ? const LinearGradient(
                                  colors: [Colors.white, Colors.white70],
                                )
                              : AppThemes.getButtonGradient(
                                  Theme.of(context).brightness),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ElevatedButton(
                          onPressed: _showProjectModal,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: padding),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'View Project',
                            style: TextStyle(
                              fontSize: ResponsiveUtils.getResponsiveFontSize(
                                  context, 14),
                              color:
                                  _isHovered ? widget.gradientColors[0] : null,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
