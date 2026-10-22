import 'package:flutter/material.dart';

class FitOrScroll extends StatelessWidget {
  const FitOrScroll({super.key, required this.builder, this.minHeight = 700});

  final Widget Function(BuildContext context, bool pageScrolls) builder;
  final double minHeight;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxHeight >= minHeight) {
          return builder(context, false);
        }

        return SingleChildScrollView(child: builder(context, true));
      },
    );
  }
}
