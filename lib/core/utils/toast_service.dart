import 'package:flutter/material.dart';


enum ToastType { success, error, warning, info }

class ToastService {
  static OverlayEntry? _currentToast;


  static void show(
      BuildContext context, {
        required String message,
        required ToastType type,
        Duration duration = const Duration(seconds: 10),
        String? title,
      }) {

    _currentToast?.remove();

    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => _ToastWidget(
        message: message,
        type: type,
        title: title,
        onDismiss: () {
          _currentToast?.remove();
          _currentToast = null;
        },
      ),
    );

    _currentToast = overlayEntry;
    overlay.insert(overlayEntry);


    Future.delayed(duration, () {
      overlayEntry.remove();
      if (_currentToast == overlayEntry) {
        _currentToast = null;
      }
    });
  }


  static void success(BuildContext context, String message, {String? title}) {
    show(context, message: message, type: ToastType.success, title: title);
  }

  static void error(BuildContext context, String message, {String? title}) {
    show(context, message: message, type: ToastType.error, title: title);
  }

  static void warning(BuildContext context, String message, {String? title}) {
    show(context, message: message, type: ToastType.warning, title: title);
  }

  static void info(BuildContext context, String message, {String? title}) {
    show(context, message: message, type: ToastType.info, title: title);
  }
}

class _ToastWidget extends StatefulWidget {
  final String message;
  final ToastType type;
  final String? title;
  final VoidCallback onDismiss;

  const _ToastWidget({
    required this.message,
    required this.type,
    required this.onDismiss,
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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();
  }

  @override
  void dispose() {
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

    return Positioned(
      top: MediaQuery.of(context).padding.top + 16,
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
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: config.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        config.icon,
                        color: config.color,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            config.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: config.color,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.message,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _controller.reverse().then((_) {
                          widget.onDismiss();
                        });
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.grey[400],
                        size: 20,
                      ),
                    ),
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

  ToastConfig({
    required this.color,
    required this.icon,
    required this.title,
  });
}