import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';

class RetroButton extends StatefulWidget {
  final String title;
  final String? imagePath;
  final Color color;
  final Color shadowColor;
  final Color? textColor;
  final VoidCallback onTap;
  final double? width;
  final double height;
  final BorderRadius? borderRadius;

  const RetroButton({
    super.key,
    required this.title,
    required this.color,
    required this.shadowColor,
    required this.onTap,
    this.imagePath,
    this.textColor,
    this.width,
    this.height = 52,
    this.borderRadius,
  });

  @override
  State<RetroButton> createState() => _RetroButtonState();
}

class _RetroButtonState extends State<RetroButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;
    final radius = widget.borderRadius ?? BorderRadius.circular(12);

    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) {
        setState(() => isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => isPressed = false),
      child: AnimatedContainer(
        width: widget.width,
        height: widget.height,
        duration: const Duration(milliseconds: 100),
        transform: Matrix4.translationValues(0, isPressed ? 5.0 : 0.0, 0),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: radius,
          border: Border.all(color: widget.shadowColor, width: 2),
          boxShadow: [
            if (!isPressed)
              BoxShadow(
                color: widget.shadowColor,
                offset: const Offset(0, 5),
                blurRadius: 0,
              ),
          ],
        ),
        child: Row(
          mainAxisSize: widget.width == null
              ? MainAxisSize.min
              : MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.imagePath != null) ...[
              SvgPicture.asset(widget.imagePath!, width: 20, height: 20),
              const SizedBox(width: 8),
            ],
            Text(
              widget.title,
              style: textTheme.labelLarge?.copyWith(
                color: widget.textColor ?? palette.textOnDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
