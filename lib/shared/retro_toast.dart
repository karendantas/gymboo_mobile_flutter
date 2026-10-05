import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';

enum ToastType { success, error, warning, info }

class RetroToast extends StatelessWidget {
  const RetroToast({super.key, required this.message, required this.type});

  final String message;
  final ToastType type;

  IconData get _icon => switch (type) {
    ToastType.success => Icons.check_circle,
    ToastType.error => Icons.error,
    ToastType.warning => Icons.warning_amber_rounded,
    ToastType.info => Icons.info,
  };

  Color _color(GymbooPalette palette) => switch (type) {
    ToastType.success => palette.goldAccentDark,
    ToastType.error => palette.coral,
    ToastType.warning => palette.goldAccent,
    ToastType.info => palette.primaryPink,
  };

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;
    final color = _color(palette);

    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: palette.surface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color, width: 2.5),
          boxShadow: [
            BoxShadow(color: color, offset: const Offset(0, 4), blurRadius: 0),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(_icon, color: color, size: 22),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                message,
                style: textTheme.bodyMedium?.copyWith(
                  color: palette.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
