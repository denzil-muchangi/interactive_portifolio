import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../themes.dart';
import '../../../utils/responsive_utils.dart';

class TabletContactSection extends StatefulWidget {
  const TabletContactSection({super.key});

  @override
  State<TabletContactSection> createState() => _TabletContactSectionState();
}

class _TabletContactSectionState extends State<TabletContactSection> {
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final padding = ResponsiveUtils.getResponsivePadding(context);
        final iconSize = ResponsiveUtils.getResponsiveIconSize(context);

        return Container(
          padding: EdgeInsets.all(padding),
          constraints: BoxConstraints(
            minHeight:
                constraints.maxHeight > 500 ? 500 : constraints.maxHeight * 0.7,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.connect_without_contact,
                    size: iconSize,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(width: padding * 0.5),
                  Text(
                    'Let\'s Connect',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: ResponsiveUtils.getResponsiveFontSize(
                              context, 28),
                        ),
                  ),
                ],
              ),
              SizedBox(height: padding),
              Text(
                'Email: your.email@example.com',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize:
                          ResponsiveUtils.getResponsiveFontSize(context, 18),
                    ),
              ),
              Text(
                'Phone: +1 (123) 456-7890',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize:
                          ResponsiveUtils.getResponsiveFontSize(context, 18),
                    ),
              ),
              SizedBox(height: padding),
              Text(
                'I\'m always open to discussing new opportunities, collaborations, or just having a chat about technology and innovation.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize:
                          ResponsiveUtils.getResponsiveFontSize(context, 18),
                      height: 1.6,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: padding * 1.5),
              Text(
                'Find me on social media',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize:
                          ResponsiveUtils.getResponsiveFontSize(context, 20),
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(height: padding),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TabletSocialMediaButton(
                    icon: Icons.business,
                    label: 'LinkedIn',
                    onPressed: () =>
                        _launchURL('https://linkedin.com/in/yourprofile'),
                  ),
                  SizedBox(width: padding),
                  TabletSocialMediaButton(
                    icon: Icons.code,
                    label: 'GitHub',
                    onPressed: () =>
                        _launchURL('https://github.com/yourusername'),
                  ),
                  SizedBox(width: padding),
                  TabletSocialMediaButton(
                    icon: Icons.camera_alt,
                    label: 'Instagram',
                    onPressed: () =>
                        _launchURL('https://instagram.com/yourusername'),
                  ),
                ],
              ),
              SizedBox(height: padding * 1.5),
              Container(
                decoration: BoxDecoration(
                  gradient:
                      AppThemes.getButtonGradient(Theme.of(context).brightness),
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
                  onPressed: () => _launchURL(
                      'https://drive.google.com/file/d/your-resume-link/view'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                      horizontal: padding * 2,
                      vertical: padding,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Download Resume',
                    style: TextStyle(
                      fontSize:
                          ResponsiveUtils.getResponsiveFontSize(context, 18),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ).animate().fadeIn(delay: 500.ms, duration: 500.ms).scale(
                    begin: const Offset(0.9, 0.9),
                    end: const Offset(1, 1),
                    duration: 400.ms,
                    curve: Curves.elasticOut,
                  ),
            ],
          ),
        );
      },
    );
  }
}

class TabletSocialMediaButton extends StatelessWidget {
  const TabletSocialMediaButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final iconSize = ResponsiveUtils.getResponsiveIconSize(context);
    final padding = ResponsiveUtils.getResponsivePadding(context) / 2;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: AppThemes.getCardGradient(Theme.of(context).brightness),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(icon, size: iconSize),
            color: Theme.of(context).colorScheme.primary,
            padding: EdgeInsets.all(padding),
          ),
        ),
        SizedBox(height: padding),
        Text(
          label,
          style: TextStyle(
            fontSize: ResponsiveUtils.getResponsiveFontSize(context, 12),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
