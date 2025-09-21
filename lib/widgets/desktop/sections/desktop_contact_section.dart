import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../themes.dart';
import '../../../utils/responsive_utils.dart';

class DesktopContactSection extends StatefulWidget {
  const DesktopContactSection({super.key});

  @override
  State<DesktopContactSection> createState() => _DesktopContactSectionState();
}

class _DesktopContactSectionState extends State<DesktopContactSection> {
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
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.connect_without_contact,
                          size: iconSize,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Let\'s Connect',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontSize: ResponsiveUtils.getResponsiveFontSize(
                                    context, 32),
                              ),
                        ),
                      ],
                    ),
                    SizedBox(height: padding / 2),
                    Text(
                      'Email: your.email@example.com',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: ResponsiveUtils.getResponsiveFontSize(
                                context, 18),
                          ),
                    ),
                    Text(
                      'Phone: +1 (123) 456-7890',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: ResponsiveUtils.getResponsiveFontSize(
                                context, 18),
                          ),
                    ),
                    SizedBox(height: padding),
                    Text(
                      'I\'m always open to discussing new opportunities, collaborations, or just having a chat about technology and innovation.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: ResponsiveUtils.getResponsiveFontSize(
                                context, 18),
                            height: 1.6,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: padding),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Find me on social media',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontSize: ResponsiveUtils.getResponsiveFontSize(
                                    context, 20),
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                    SizedBox(height: padding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialMediaButton(
                          icon: Icons.business,
                          label: 'LinkedIn',
                          onPressed: () =>
                              _launchURL('https://linkedin.com/in/yourprofile'),
                        ),
                        const SizedBox(width: 16),
                        SocialMediaButton(
                          icon: Icons.code,
                          label: 'GitHub',
                          onPressed: () =>
                              _launchURL('https://github.com/yourusername'),
                        ),
                        const SizedBox(width: 16),
                        SocialMediaButton(
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
                        onPressed: () => _launchURL(
                            'https://drive.google.com/file/d/your-resume-link/view'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          'Download Resume',
                          style: TextStyle(
                            fontSize: ResponsiveUtils.getResponsiveFontSize(
                                context, 18),
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
              ),
            ],
          ),
        );
      },
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final iconSize = constraints.maxWidth > 200 ? 36.0 : 32.0;

        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient:
                    AppThemes.getCardGradient(Theme.of(context).brightness),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: onPressed,
                icon: Icon(icon, size: iconSize),
                color: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.all(16),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: ResponsiveUtils.getResponsiveFontSize(context, 12),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      },
    );
  }
}
