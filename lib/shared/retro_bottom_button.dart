import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RetroBottomButton extends StatefulWidget {
  final String? imagePath;
  final Color color;
  final Color shadowColor;
  final VoidCallback onTap;
  final double? paddingTop;
  final double? paddingBottom;
  final double? width;
  final double? height;

  const RetroBottomButton({
    super.key,
    this.imagePath,
    required this.color,
    required this.shadowColor,
    required this.onTap,
    this.paddingTop,
    this.paddingBottom,
    this.width,
    this.height,
  });

  @override
  State<RetroBottomButton> createState() => _RetroBottomButtonState();
}

class _RetroBottomButtonState extends State<RetroBottomButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: widget.paddingBottom ?? 0,
        top: widget.paddingTop ?? 0,
      ),
      child: GestureDetector(
        onTapDown: (_) {
          setState(() {
            isPressed = true;
          });
        },
        onTapUp: (_) {
          setState(() {
            isPressed = false;
          });
          widget.onTap();
        },
        onTapCancel: () {
          setState(() {
            isPressed = false;
          });
        },
        child: AnimatedContainer(
          width: widget.width ?? 60,
          height: widget.height ?? 60,

          duration: const Duration(milliseconds: 100),

          transform: Matrix4.translationValues(0, isPressed ? 5.0 : 0.0, 0),
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle,
            boxShadow: [
              if (!isPressed)
                BoxShadow(
                  color: widget.shadowColor,
                  offset: const Offset(0, 5),
                  blurRadius: 0,
                ),
            ],
          ),
          child: Center(
            child: widget.imagePath != null
                ? SvgPicture.asset(widget.imagePath!, width: 32, height: 32)
                : null,
          ),
        ),
      ),
    );
  }
}
