import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';

class RetroDropdownPanel extends StatefulWidget {
  const RetroDropdownPanel({
    super.key,
    required this.title,
    required this.icon,
    required this.itemCount,
    required this.itemBuilder,
    this.emptyMessage = 'Nada por aqui ainda',
    this.maxPanelHeight = 320,
    this.initiallyExpanded = false,
  });

  final String title;
  final IconData icon;
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final String emptyMessage;
  final double maxPanelHeight;
  final bool initiallyExpanded;

  @override
  State<RetroDropdownPanel> createState() => _RetroDropdownPanelState();
}

class _RetroDropdownPanelState extends State<RetroDropdownPanel> {
  late bool _isExpanded = widget.initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: palette.input,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: palette.primaryPink, width: 2),
        boxShadow: [
          BoxShadow(
            color: palette.primaryPink,
            offset: const Offset(0, 4),
            blurRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Row(
                children: [
                  Icon(widget.icon, color: palette.primaryPinkDark, size: 18),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      widget.title.toUpperCase(),
                      style: textTheme.labelMedium?.copyWith(
                        color: palette.textPrimary,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  if (widget.itemCount > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: palette.primaryPink,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '${widget.itemCount}',
                        style: textTheme.labelSmall?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  const SizedBox(width: 8),
                  AnimatedRotation(
                    turns: _isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: palette.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // corpo — anima altura ao abrir/fechar, com teto máximo (rola se passar disso)
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: _isExpanded
                ? Container(
                    constraints: BoxConstraints(
                      maxHeight: widget.maxPanelHeight,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: palette.divider, width: 2),
                      ),
                    ),
                    child: widget.itemCount == 0
                        ? Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              widget.emptyMessage,
                              style: textTheme.bodyMedium?.copyWith(
                                color: palette.textSecondary,
                              ),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(10),
                            itemCount: widget.itemCount,
                            itemBuilder: widget.itemBuilder,
                          ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
