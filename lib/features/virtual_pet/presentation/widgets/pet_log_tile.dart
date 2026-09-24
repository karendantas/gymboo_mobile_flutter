// features/virtual_pet/presentation/widgets/pet_log_tile.dart
import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';

import '../../domain/models/pet_log.dart';
import '../../domain/models/pet_log_display.dart';

class PetLogTile extends StatelessWidget {
  const PetLogTile({super.key, required this.log});

  final PetLog log;

  String _formatDate(String iso) {
    final date = DateTime.parse(iso);
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')} '
        '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;
    final color = log.color(palette);

    return Row(
      children: [
        Container(
          width: 38,
          height: 38,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: palette.divider, width: 2),
          ),
          child: Icon(log.icon, color: Colors.white, size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Text(
                log.description,
                style: textTheme.bodyMedium?.copyWith(
                  color: palette.textPrimary,
                ),
              ),
              if (log.oldValue != null && log.newValue != null) ...[
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      '${log.oldValue}',
                      style: textTheme.labelSmall?.copyWith(
                        color: palette.textSecondary,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 10,
                      color: palette.textSecondary,
                    ),
                    Text(
                      '${log.newValue}',
                      style: textTheme.labelSmall?.copyWith(
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
        Text(
          _formatDate(log.createdAt),
          style: textTheme.labelSmall?.copyWith(color: palette.textSecondary),
        ),
      ],
    );
  }
}
