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
                  color: isActive ? palette.primaryPink : palette.input,
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
                  painter: _DashedLinePainter(color: lineActive ? palette.primaryPinkDark : palette.divider),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 24),

        Center(
          child: Text(title, style: textTheme.headlineMedium?.copyWith(color: palette.primaryPinkDark)),
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
  _DashedLinePainter({required this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color..strokeWidth = 2;
    const dashWidth = 4.0;
    const dashSpace = 3.0;
    double x = 0;
    while (x < size.width) {
      canvas.drawLine(Offset(x, size.height / 2), Offset(x + dashWidth, size.height / 2), paint);
      x += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant _DashedLinePainter oldDelegate) => oldDelegate.color != color;
}