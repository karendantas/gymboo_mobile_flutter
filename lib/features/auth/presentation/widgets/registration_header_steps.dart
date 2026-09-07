import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';

class RegistrationStepHeader extends StatelessWidget {
  const RegistrationStepHeader({
    super.key,
    required this.currentStep,
    required this.onBack,
    required this.title,
    required this.subtitle,
  });

  final int currentStep;
  final VoidCallback onBack;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: palette.textPrimary),
              onPressed: onBack,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            Text('$currentStep/3', style: textTheme.labelMedium?.copyWith(color: palette.textSecondary)),
          ],
        ),
        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (i) {
            if (i.isEven) {
              final step = (i ~/ 2) + 1;
              final isActive = step <= currentStep;
              return Container(
                width: 28,
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive ? palette.primaryPink : palette.surface,
                  border: Border.all(color: palette.primaryPinkDark, width: 2),
                ),
                child: Text(
                  '$step',
                  style: TextStyle(
                    color: isActive ? Colors.white : palette.textSecondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              );
            }
            final lineActive = (i ~/ 2) + 1 < currentStep;
            return Expanded(
              child: SizedBox(
                height: 2,
                child: CustomPaint(
                  painter: _DashedLinePainter(
                    color: lineActive ? palette.primaryPinkDark : palette.primaryPink,
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 24),

        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              Image.asset('assets/images/heart_filled.png', width: 18, height: 18, filterQuality: FilterQuality.none),
              Text(title, style: textTheme.headlineMedium?.copyWith(color: palette.primaryPinkDark)),
              Image.asset('assets/images/heart_filled.png', width: 18, height: 18, filterQuality: FilterQuality.none),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(color: palette.textSecondary),
          ),
        ),
        const SizedBox(height: 28),
      ],
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  _DashedLinePainter({
    required this.color,
    this.dashWidth = 4,
    this.dashGap = 3,
    this.strokeWidth = 2,
  });

  final Color color;
  final double dashWidth;
  final double dashGap;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    double x = 0;
    final y = size.height / 2;
    while (x < size.width) {
      canvas.drawLine(Offset(x, y), Offset((x + dashWidth).clamp(0, size.width), y), paint);
      x += dashWidth + dashGap;
    }
  }

  @override
  bool shouldRepaint(covariant _DashedLinePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.dashWidth != dashWidth ||
        oldDelegate.dashGap != dashGap;
  }
}