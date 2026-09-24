import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';

class RetroTabbedContainer extends StatelessWidget {
  const RetroTabbedContainer({
    super.key,
    required this.label,
    required this.labelIcon,
    required this.child,
  });

  final String label;
  final IconData labelIcon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            color: palette.input,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: palette.primaryPinkDark, width: 2.5),
          ),
          child: child,
        ),
        Positioned(
          top: 0,
          left: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: palette.primaryPink,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: palette.primaryPinkDark, width: 2),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(labelIcon, size: 14, color: Colors.white),
                const SizedBox(width: 6),
                Text(
                  label.toUpperCase(),
                  style: textTheme.labelSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class RetroTabbedField extends StatelessWidget {
  const RetroTabbedField({
    super.key,
    required this.label,
    required this.labelIcon,
    required this.controller,
    this.hintIcon,
    this.hintText,
    this.errorText,
    this.keyboardType,
    this.inputFormatters,
  });

  final String label;
  final IconData labelIcon;
  final TextEditingController controller;
  final IconData? hintIcon;
  final String? hintText;
  final String? errorText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;
    final hasError = errorText != null && errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RetroTabbedContainer(
          label: label,
          labelIcon: labelIcon,
          child: Row(
            children: [
              if (hintIcon != null) ...[
                Icon(
                  hintIcon,
                  size: 18,
                  color: hasError ? palette.coral : palette.primaryPinkDark,
                ),
                const SizedBox(width: 10),
              ],
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: keyboardType,
                  inputFormatters: inputFormatters,
                  style: textTheme.bodyMedium?.copyWith(
                    color: palette.textPrimary,
                  ),
                  cursorColor: palette.primaryPink,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    hintText: hintText,
                    hintStyle: textTheme.bodyMedium?.copyWith(
                      color: palette.textSecondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (hasError) ...[
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              errorText!,
              style: textTheme.labelSmall?.copyWith(color: palette.coral),
            ),
          ),
        ],
      ],
    );
  }
}
