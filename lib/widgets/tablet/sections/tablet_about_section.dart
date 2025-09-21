import 'package:flutter/material.dart';
import '../../../utils/responsive_utils.dart';

class TabletAboutSection extends StatelessWidget {
  const TabletAboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ResponsiveUtils.getResponsivePadding(context)),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CircleAvatar(
              radius: ResponsiveUtils.getResponsiveIconSize(context) * 2,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: Icon(Icons.account_circle,
                  size: ResponsiveUtils.getResponsiveIconSize(context) * 2),
            ),
          ),
          SizedBox(width: ResponsiveUtils.getResponsivePadding(context)),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: ResponsiveUtils.getResponsiveIconSize(context),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'About Me',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Passionate Flutter developer with experience in building cross-platform mobile and web applications. I love creating beautiful, user-friendly interfaces and solving complex problems with elegant code.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
