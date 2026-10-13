import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';

class FilterBox extends StatelessWidget {
  const FilterBox({
    super.key,
    required this.label,
    required this.active,
    this.icon,
  });

  final String label;
  final bool active;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;
    final color = active ? Colors.white : palette.textPrimary;

    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: active ? palette.primaryPink : palette.input,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: palette.primaryPink, width: 2),
        boxShadow: [
          BoxShadow(
            color: palette.primaryPink,
            offset: const Offset(0, 4),
            blurRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16, color: color),
            const SizedBox(width: 6),
          ],
          Expanded(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.labelSmall?.copyWith(color: color),
            ),
          ),
          Icon(Icons.arrow_drop_down, size: 20, color: color),
        ],
      ),
    );
  }
}
