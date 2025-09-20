import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../themes.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
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
        bool isDesktop = constraints.maxWidth > 800;
        return Container(
          padding: const EdgeInsets.all(32),
          child: isDesktop
              ? Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Let\'s Connect',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 16),
                          const Text('Email: your.email@example.com'),
                          const Text('Phone: +1 (123) 456-7890'),
                          const SizedBox(height: 24),
                          const Text(
                            'I\'m always open to discussing new opportunities, collaborations, or just having a chat about technology and innovation.',
                            style: TextStyle(fontSize: 16, height: 1.5),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            'Find me on social media',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SocialMediaButton(
                                icon: Icons.business,
                                label: 'LinkedIn',
                                onPressed: () => _launchURL(
                                    'https://linkedin.com/in/yourprofile'),
                              ),
                              const SizedBox(width: 16),
                              SocialMediaButton(
                                icon: Icons.code,
                                label: 'GitHub',
                                onPressed: () => _launchURL(
                                    'https://github.com/yourusername'),
                              ),
                              const SizedBox(width: 16),
                              SocialMediaButton(
                                icon: Icons.camera_alt,
                                label: 'Instagram',
                                onPressed: () => _launchURL(
                                    'https://instagram.com/yourusername'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
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
                              child: const Text(
                                'Download Resume',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.connect_without_contact,
                          size: 32,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Let\'s Connect',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text('Email: your.email@example.com'),
                    const Text('Phone: +1 (123) 456-7890'),
                    const SizedBox(height: 16),
                    const Text(
                      'I\'m always open to discussing new opportunities, collaborations, or just having a chat about technology and innovation.',
                      style: TextStyle(fontSize: 16, height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'Find me on social media',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        SocialMediaButton(
                          icon: Icons.business,
                          label: 'LinkedIn',
                          onPressed: () =>
                              _launchURL('https://linkedin.com/in/yourprofile'),
                        ),
                        SocialMediaButton(
                          icon: Icons.code,
                          label: 'GitHub',
                          onPressed: () =>
                              _launchURL('https://github.com/yourusername'),
                        ),
                        SocialMediaButton(
                          icon: Icons.camera_alt,
                          label: 'Instagram',
                          onPressed: () =>
                              _launchURL('https://instagram.com/yourusername'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Container(
                      width: double.infinity,
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
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Download Resume',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
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
            icon: Icon(icon, size: 32),
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.all(16),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
