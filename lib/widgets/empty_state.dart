import 'package:flutter/material.dart';

/// A widget that displays an empty state.
class EmptyState extends StatelessWidget {
  /// Creates a new empty state widget.
  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
  });

  /// The icon to display.
  final IconData icon;

  /// The title to display.
  final String title;

  /// The subtitle to display.
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 64, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(
                subtitle!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).hintColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
