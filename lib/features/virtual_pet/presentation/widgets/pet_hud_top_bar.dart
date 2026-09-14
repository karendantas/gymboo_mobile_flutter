import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/core/system/battery_service.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/widgets/pixel_battery_icon.dart';

class PetHudTopBar extends ConsumerWidget {
  const PetHudTopBar({super.key});

  static const _weekdayLabels = [
    'SEG',
    'TER',
    'QUA',
    'QUI',
    'SEX',
    'SÁB',
    'DOM',
  ];
  static const _monthLabels = [
    'JAN',
    'FEV',
    'MAR',
    'ABR',
    'MAI',
    'JUN',
    'JUL',
    'AGO',
    'SET',
    'OUT',
    'NOV',
    'DEZ',
  ];

  String _formatToday() {
    final now = DateTime.now();
    final weekday = _weekdayLabels[now.weekday - 1];
    final month = _monthLabels[now.month - 1];
    return '$weekday - ${now.day} $month';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context).extension<GymbooPalette>()!;
    final batteryAsync = ref.watch(batteryLevelProvider);

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _formatToday(),
              style: textTheme.labelMedium?.copyWith(color: theme.surfaceAlt),
            ),
            batteryAsync.when(
              data: (level) => PixelBatteryIcon(level: level),
              loading: () => const SizedBox(width: 22, height: 12),
              error: (_, _) => const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
