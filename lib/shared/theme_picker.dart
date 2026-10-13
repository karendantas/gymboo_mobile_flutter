import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/core/theme/gymboo_themes.dart';
import 'package:gymboo_app/core/theme/theme_notifier.dart';

class ThemePicker extends ConsumerWidget {
  const ThemePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(themeNotifierProvider);

    return Row(
      children: [
        for (final option in ThemeRegistry.all)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: _ThemeOption(
                option: option,
                isSelected: option.id == current.id,
                onTap: () => ref
                    .read(themeNotifierProvider.notifier)
                    .setTheme(option.id),
              ),
            ),
          ),
      ],
    );
  }
}

class _ThemeOption extends StatelessWidget {
  const _ThemeOption({
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  final AppGymbooTheme option;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final active = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;
    final preview = option.palette;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 52,
                width: 52,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: preview.backgroundOuter,
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: isSelected ? active.primaryPinkDark : active.divider,
                    width: isSelected ? 3 : 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: preview.backgroundDark,
                      offset: const Offset(0, 3),
                      blurRadius: 0,
                    ),
                  ],
                ),
              ),
              if (isSelected)
                Positioned(
                  top: -2,
                  right: -3,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: active.primaryPinkDark,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check,
                      size: 12,
                      color: active.textOnDark,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            option.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.labelSmall?.copyWith(
              color: active.textPrimary,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
