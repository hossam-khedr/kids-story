import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

enum ToastType { success, error, warning, info }

class ToastService {
  static OverlayEntry? _currentToast;
  static Timer? _timer;

  static void show(
      BuildContext context, {
        required String message,
        required ToastType type,
        int duration = 4,
        String? title,
        ToastPosition position = ToastPosition.top,
        bool dismissible = true,
      }) {
    // إلغاء أي toast سابق
    _dismissCurrent();

    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => _ToastWidget(
        message: message,
        type: type,
        title: title,
        duration: duration,
        position: position,
        dismissible: dismissible,
        onDismiss: _dismissCurrent,
      ),
    );

    _currentToast = overlayEntry;
    overlay.insert(overlayEntry);

    // إعداد timer للإغلاق التلقائي
    _timer = Timer(Duration(seconds: duration), _dismissCurrent);
  }

  static void _dismissCurrent() {
    _timer?.cancel();
    _timer = null;
    _currentToast?.remove();
    _currentToast = null;
  }

  static void dismiss() {
    _dismissCurrent();
  }

  // Success Toast
  static void success(
      BuildContext context,
      String message, {
        String? title,
        int duration = 4,
        ToastPosition position = ToastPosition.top,
        bool dismissible = true,
      }) {
    show(
      context,
      message: message,
      type: ToastType.success,
      title: title,
      duration: duration,
      position: position,
      dismissible: dismissible,
    );
  }

  // Error Toast
  static void error(
      BuildContext context,
      String message, {
        String? title,
        int duration = 5,
        ToastPosition position = ToastPosition.top,
        bool dismissible = true,
      }) {
    show(
      context,
      message: message,
      type: ToastType.error,
      title: title,
      duration: duration,
      position: position,
      dismissible: dismissible,
    );
  }

  // Warning Toast
  static void warning(
      BuildContext context,
      String message, {
        String? title,
        int duration = 4,
        ToastPosition position = ToastPosition.top,
        bool dismissible = true,
      }) {
    show(
      context,
      message: message,
      type: ToastType.warning,
      title: title,
      duration: duration,
      position: position,
      dismissible: dismissible,
    );
  }

  // Info Toast
  static void info(
      BuildContext context,
      String message, {
        String? title,
        int duration = 3,
        ToastPosition position = ToastPosition.top,
        bool dismissible = true,
      }) {
    show(
      context,
      message: message,
      type: ToastType.info,
      title: title,
      duration: duration,
      position: position,
      dismissible: dismissible,
    );
  }
}

enum ToastPosition { top, bottom }

class _ToastWidget extends StatefulWidget {
  final String message;
  final ToastType type;
  final String? title;
  final int duration;
  final ToastPosition position;
  final bool dismissible;
  final VoidCallback onDismiss;

  const _ToastWidget({
    required this.message,
    required this.type,
    required this.onDismiss,
    required this.duration,
    required this.position,
    required this.dismissible,
    this.title,
  });

  @override
  State<_ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<_ToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  Timer? _autoDismissTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    final offset = widget.position == ToastPosition.top
        ? const Offset(0, -1)
        : const Offset(0, 1);

    _slideAnimation = Tween<Offset>(
      begin: offset,
      end: Offset.zero,
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut
    ));

    _controller.forward();

    // إعداد الإغلاق التلقائي
    _autoDismissTimer = Timer(Duration(seconds: widget.duration), _dismiss);
  }

  void _dismiss() {
    if (_controller.isCompleted) {
      _controller.reverse().then((_) {
        widget.onDismiss();
      });
    } else {
      widget.onDismiss();
    }
  }

  @override
  void dispose() {
    _autoDismissTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  ToastConfig _getConfig() {
    switch (widget.type) {
      case ToastType.success:
        return ToastConfig(
          color: const Color(0xFF10B981),
          icon: Icons.check_circle,
          title: widget.title ?? 'نجح',
        );
      case ToastType.error:
        return ToastConfig(
          color: const Color(0xFFEF4444),
          icon: Icons.error,
          title: widget.title ?? 'خطأ',
        );
      case ToastType.warning:
        return ToastConfig(
          color: const Color(0xFFF59E0B),
          icon: Icons.warning,
          title: widget.title ?? 'تحذير',
        );
      case ToastType.info:
        return ToastConfig(
          color: const Color(0xFF3B82F6),
          icon: Icons.info,
          title: widget.title ?? 'معلومة',
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final config = _getConfig();
    final mediaQuery = MediaQuery.of(context);
    final topPadding = mediaQuery.padding.top;
    final bottomPadding = mediaQuery.padding.bottom;

    return Positioned(
      top: widget.position == ToastPosition.top
          ? topPadding + 16
          : null,
      bottom: widget.position == ToastPosition.bottom
          ? bottomPadding + 16
          : null,
      left: 16,
      right: 16,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 25,
                      offset: const Offset(0, 8),
                      spreadRadius: 1,
                    ),
                  ],
                  border: Border.all(
                    color: config.color.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    // Icon
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: config.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(config.icon,
                          color: config.color,
                          size: 24
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (widget.title != null) ...[
                            Text(
                              config.title,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: config.color,
                              ),
                            ),
                            const SizedBox(height: 2),
                          ],
                          Text(
                            widget.message,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[800],
                              height: 1.4,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),

                    // Close Button
                    if (widget.dismissible) ...[
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: _dismiss,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                          child: Icon(
                            Icons.close,
                            color: Colors.grey[600],
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ToastConfig {
  final Color color;
  final IconData icon;
  final String title;

  const ToastConfig({
    required this.color,
    required this.icon,
    required this.title,
  });
}
