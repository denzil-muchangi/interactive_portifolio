import 'package:flutter/material.dart';
import '../../../utils/responsive_utils.dart';

class DesktopAboutSection extends StatelessWidget {
  const DesktopAboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final padding = ResponsiveUtils.getResponsivePadding(context);
        final iconSize = ResponsiveUtils.getResponsiveIconSize(context);
        final fontSize = ResponsiveUtils.getResponsiveFontSize(context, 24);

        return Container(
          padding: EdgeInsets.all(padding),
          constraints: BoxConstraints(
            minHeight:
                constraints.maxHeight > 400 ? 400 : constraints.maxHeight * 0.6,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: CircleAvatar(
                  radius: constraints.maxWidth > 1400 ? 120 : 100,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: Icon(
                    Icons.account_circle,
                    size: constraints.maxWidth > 1400 ? 120 : 100,
                  ),
                ),
              ),
              SizedBox(width: padding),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: iconSize,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'About Me',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontSize: fontSize,
                              ),
                        ),
                      ],
                    ),
                    SizedBox(height: padding / 2),
                    Text(
                      'Passionate Flutter developer with experience in building cross-platform mobile and web applications. I love creating beautiful, user-friendly interfaces and solving complex problems with elegant code.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: ResponsiveUtils.getResponsiveFontSize(
                                context, 18),
                            height: 1.6,
                          ),
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
