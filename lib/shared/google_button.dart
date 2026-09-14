import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
    required this.isLoading,
    required this.palette,
    required this.textTheme,
    required this.onTap,
  });

  final bool isLoading;
  final GymbooPalette palette;
  final TextTheme textTheme;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: double.infinity,
        height: 54,

        decoration: BoxDecoration(
          color: palette.googleButton,

          borderRadius: BorderRadius.circular(10),

          border: Border.all(color: palette.googleButtonBorder, width: 2),

          boxShadow: [
            BoxShadow(
              color: palette.googleButtonBorder,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Center(
          child: isLoading
              ? SizedBox(
                  width: 19,
                  height: 19,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: palette.primaryPinkDark,
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/icons/google.png',
                      width: 22,
                      height: 22,
                      filterQuality: FilterQuality.high,
                    ),

                    const SizedBox(width: 12),

                    Text(
                      'Continuar com Google',
                      style: textTheme.labelLarge?.copyWith(
                        color: palette.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
