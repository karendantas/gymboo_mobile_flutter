import 'package:flutter/material.dart';
import 'package:gymboo_app/shared/retro_toast.dart';

class ToastService {
  ToastService(this._navigatorKey);
  final GlobalKey<NavigatorState> _navigatorKey;

  OverlayEntry? _currentEntry;

  void show(
    String message, {
    ToastType type = ToastType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    final overlay = _navigatorKey.currentState?.overlay;
    if (overlay == null) return;

    _currentEntry?.remove();

    final entry = OverlayEntry(
      builder: (context) => _ToastWrapper(message: message, type: type),
    );

    _currentEntry = entry;
    overlay.insert(entry);

    Future.delayed(duration, () {
      if (_currentEntry == entry) {
        entry.remove();
        _currentEntry = null;
      }
    });
  }

  void success(String message) => show(message, type: ToastType.success);
  void error(String message) => show(message, type: ToastType.error);
  void warning(String message) => show(message, type: ToastType.warning);
  void info(String message) => show(message, type: ToastType.info);
}

class _ToastWrapper extends StatefulWidget {
  const _ToastWrapper({required this.message, required this.type});
  final String message;
  final ToastType type;

  @override
  State<_ToastWrapper> createState() => _ToastWrapperState();
}

class _ToastWrapperState extends State<_ToastWrapper>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  );
  late final _offset = Tween<Offset>(
    begin: const Offset(0, -1),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 12,
      left: 16,
      right: 16,
      child: SlideTransition(
        position: _offset,
        child: RetroToast(message: widget.message, type: widget.type),
      ),
    );
  }
}
