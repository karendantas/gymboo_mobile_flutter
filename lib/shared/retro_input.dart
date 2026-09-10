import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';

class RetroTextField extends StatefulWidget {
  const RetroTextField({
    super.key,
    required this.controller,
    this.label,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.errorText,
    this.prefixIcon,
    this.onChanged,
  });

  final TextEditingController controller;
  final String? label;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? errorText;
  final Widget? prefixIcon;
  final ValueChanged<String>? onChanged;

  @override
  State<RetroTextField> createState() => _RetroTextFieldState();
}

class _RetroTextFieldState extends State<RetroTextField> {
  final _focusNode = FocusNode();
  bool _isFocused = false;
  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
    _focusNode.addListener(() {
      setState(() => _isFocused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;
    final hasError = widget.errorText != null && widget.errorText!.isNotEmpty;

    final borderColor = hasError
        ? palette.coral
        : _isFocused
            ? palette.primaryPink
            :  Color.fromARGB(255, 175, 179, 147);;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: textTheme.labelMedium?.copyWith(color: palette.textPrimary),
          ),
          const SizedBox(height: 6),
        ],

        AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
            color: palette.input,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor, width: 3),
            boxShadow: [
              BoxShadow(
                color: hasError ? palette.coral : palette.primaryPinkDark,
                offset: Offset(0, _isFocused ? 2 : 4),
                blurRadius: 0,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              if (widget.prefixIcon != null) ...[
                widget.prefixIcon!,
                const SizedBox(width: 10),
              ],
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  obscureText: _obscure,
                  keyboardType: widget.keyboardType,
                  onChanged: widget.onChanged,
                  style: textTheme.bodyMedium?.copyWith(color: palette.textPrimary),
                  cursorColor: palette.primaryPink,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    hintText: widget.hintText,
                    hintStyle: textTheme.bodyMedium?.copyWith(color: palette.textSecondary),
                  ),
                ),
              ),
              if (widget.obscureText)
                GestureDetector(
                  onTap: () => setState(() => _obscure = !_obscure),
                  child: Icon(
                    _obscure ? Icons.visibility_off : Icons.visibility,
                    size: 20,
                    color: palette.textSecondary,
                  ),
                ),
            ],
          ),
        ),

        if (hasError) ...[
          const SizedBox(height: 4),
          Text(
            widget.errorText!,
            style: textTheme.labelSmall?.copyWith(color: palette.coral),
          ),
        ],
      ],
    );
  }
}