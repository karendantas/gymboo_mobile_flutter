import 'package:flutter/material.dart';

class VerticalFitBox extends StatefulWidget {
  const VerticalFitBox({super.key, required this.child});
  final Widget child;

  @override
  State<VerticalFitBox> createState() => _VerticalFitBoxState();
}

class _VerticalFitBoxState extends State<VerticalFitBox> {
  final GlobalKey _contentKey = GlobalKey();
  static double _lastKnownScale = 1.0;
  late double _scale = _lastKnownScale;

  void _recalculate(double maxHeight) {
    final renderBox =
        _contentKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null || !renderBox.hasSize) return;

    final naturalHeight = renderBox.size.height;
    final newScale = (naturalHeight > maxHeight && naturalHeight > 0)
        ? maxHeight / naturalHeight
        : 1.0;

    if ((newScale - _scale).abs() > 0.005) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() => _scale = newScale);
          _lastKnownScale = newScale;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => _recalculate(constraints.maxHeight),
        );

        return Align(
          alignment: Alignment.topCenter,
          heightFactor: _scale,
          child: OverflowBox(
            minHeight: 0,
            maxHeight: double.infinity,
            alignment: Alignment.topCenter,
            child: Transform(
              alignment: Alignment.topCenter,
              transform: Matrix4.diagonal3Values(1.0, _scale, 1.0),
              child: KeyedSubtree(key: _contentKey, child: widget.child),
            ),
          ),
        );
      },
    );
  }
}
