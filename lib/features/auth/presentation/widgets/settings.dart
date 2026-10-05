import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;

    return Container(
      decoration: BoxDecoration(
        color: palette.input,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: palette.primaryPink, width: 2),
        boxShadow: [
          BoxShadow(
            color: palette.primaryPink,
            offset: const Offset(0, 4),
            blurRadius: 0,
          ),
        ],
      ),
      child: Column(children: children),
    );
  }
}

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.icon,
    required this.label,
    required this.trailing,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final Widget trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 20, color: palette.textPrimary),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: textTheme.bodyMedium?.copyWith(
                  color: palette.textPrimary,
                ),
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}

class SettingsDivider extends StatelessWidget {
  const SettingsDivider({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) =>
      Divider(height: 1, thickness: 1.5, color: color);
}
