import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:dotted_border/dotted_border.dart';

class CheckBox extends StatelessWidget {

  final bool isCompleted;

  const CheckBox({super.key, this.isCompleted = false});
  
  @override
  Widget build(BuildContext context) {
        final theme = Theme.of(context).extension<GymbooPalette>()!;


    if (!isCompleted) {
      return DottedBorder(
        options: RoundedRectDottedBorderOptions(
          radius: const Radius.circular(8),
          strokeWidth: 3,
          dashPattern: const [4, 3],
          color: theme.primaryPink,
        ),
        child: Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: theme.backgroundDark,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
    }
    return Container(
          width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: theme.primaryPink,
        border: Border.all(color: theme.primaryPink, width: 3),
        borderRadius: BorderRadius.all(Radius.circular(8)),

      ),
        child: Icon(Icons.check, color: theme.textOnDark, size: 18),
    );
  }
}