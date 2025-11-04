import 'package:flutter/material.dart';




enum DialogType { success, error, warning, info, confirm, custom }

class DialogService {

  // Success Dialog
  static Future<void> success(
      BuildContext context, {
        required String message,
        String? title,
        String buttonText = 'حسناً',
        VoidCallback? onConfirm,
        bool barrierDismissible = false,
      }) {
    return _showCustomDialog(
      context,
      type: DialogType.success,
      title: title ?? 'نجح!',
      message: message,
      icon: Icons.check_circle,
      color: const Color(0xFF10B981),
      buttonText: buttonText,
      onConfirm: onConfirm,
      barrierDismissible: barrierDismissible,
    );
  }

  // Error Dialog
  static Future<void> error(
      BuildContext context, {
        required String message,
        String? title,
        String buttonText = 'حسناً',
        VoidCallback? onConfirm,
        bool barrierDismissible = false,
      }) {
    return _showCustomDialog(
      context,
      type: DialogType.error,
      title: title ?? 'خطأ!',
      message: message,
      icon: Icons.error,
      color: const Color(0xFFEF4444),
      buttonText: buttonText,
      onConfirm: onConfirm,
      barrierDismissible: barrierDismissible,
    );
  }

  // Warning Dialog
  static Future<void> warning(
      BuildContext context, {
        required String message,
        String? title,
        String buttonText = 'فهمت',
        VoidCallback? onConfirm,
        bool barrierDismissible = false,
      }) {
    return _showCustomDialog(
      context,
      type: DialogType.warning,
      title: title ?? 'تحذير!',
      message: message,
      icon: Icons.warning_amber,
      color: const Color(0xFFF59E0B),
      buttonText: buttonText,
      onConfirm: onConfirm,
      barrierDismissible: barrierDismissible,
    );
  }

  // Info Dialog
  static Future<void> info(
      BuildContext context, {
        required String message,
        String? title,
        String buttonText = 'حسناً',
        VoidCallback? onConfirm,
        bool barrierDismissible = false,
      }) {
    return _showCustomDialog(
      context,
      type: DialogType.info,
      title: title ?? 'معلومة',
      message: message,
      icon: Icons.info,
      color: const Color(0xFF3B82F6),
      buttonText: buttonText,
      onConfirm: onConfirm,
      barrierDismissible: barrierDismissible,
    );
  }

  // Confirm Dialog
  static Future<bool> confirm(
      BuildContext context, {
        required String message,
        String? title,
        String confirmText = 'تأكيد',
        String cancelText = 'إلغاء',
        Color? confirmColor,
        Color? cancelColor,
        bool barrierDismissible = true,
      }) async {
    final result = await showAdaptiveDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => _ConfirmDialog(
        title: title ?? 'تأكيد العملية',
        message: message,
        confirmText: confirmText,
        cancelText: cancelText,
        confirmColor: confirmColor ?? const Color(0xFF3B82F6),
        cancelColor: cancelColor ?? Colors.grey[700]!,
      ),
    );
    return result ?? false;
  }

  // Custom Dialog
  static Future<void> custom(
      BuildContext context, {
        required String message,
        required String title,
        required IconData icon,
        required Color color,
        required String buttonText,
        VoidCallback? onConfirm,
        bool barrierDismissible = false,
      }) {
    return _showCustomDialog(
      context,
      type: DialogType.custom,
      title: title,
      message: message,
      icon: icon,
      color: color,
      buttonText: buttonText,
      onConfirm: onConfirm,
      barrierDismissible: barrierDismissible,
    );
  }

  // Show Custom Dialog
  static Future<void> _showCustomDialog(
      BuildContext context, {
        required DialogType type,
        required String title,
        required String message,
        required IconData icon,
        required Color color,
        required String buttonText,
        VoidCallback? onConfirm,
        bool barrierDismissible = false,
      }) {
    return showAdaptiveDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => _CustomDialog(
        type: type,
        title: title,
        message: message,
        icon: icon,
        color: color,
        buttonText: buttonText,
        onConfirm: onConfirm,
      ),
    );
  }

  // Adaptive Dialog Method
  static Future<T?> showAdaptiveDialog<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible = false,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black54,
      builder: builder,
    );
  }

  // Loading Dialog
  static void showLoading(BuildContext context, {String? message}) {
    showAdaptiveDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => _LoadingDialog(message: message),
    );
  }

  // Dismiss Current Dialog
  static void dismiss(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  // Dismiss All Dialogs
  static void dismissAll(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}

// Custom Dialog Widget
class _CustomDialog extends StatefulWidget {
  final DialogType type;
  final String title;
  final String message;
  final IconData icon;
  final Color color;
  final String buttonText;
  final VoidCallback? onConfirm;

  const _CustomDialog({
    required this.type,
    required this.title,
    required this.message,
    required this.icon,
    required this.color,
    required this.buttonText,
    this.onConfirm,
  });

  @override
  State<_CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<_CustomDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleConfirm() {
    Navigator.of(context).pop();
    widget.onConfirm?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '${widget.title} dialog',
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: widget.color.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      widget.icon,
                      size: 48,
                      color: widget.color,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Title
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: widget.color,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),

                  // Message
                  Text(
                    widget.message,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  // Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _handleConfirm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: widget.color,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        widget.buttonText,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Confirm Dialog Widget
class _ConfirmDialog extends StatefulWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final Color confirmColor;
  final Color cancelColor;

  const _ConfirmDialog({
    required this.title,
    required this.message,
    required this.confirmText,
    required this.cancelText,
    required this.confirmColor,
    required this.cancelColor,
  });

  @override
  State<_ConfirmDialog> createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<_ConfirmDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleConfirm() => Navigator.of(context).pop(true);
  void _handleCancel() => Navigator.of(context).pop(false);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '${widget.title} confirmation dialog',
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: widget.confirmColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.help_outline,
                      size: 48,
                      color: widget.confirmColor,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Title
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2937),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),

                  // Message
                  Text(
                    widget.message,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  // Buttons
                  Row(
                    children: [
                      // Cancel Button
                      Expanded(
                        child: OutlinedButton(
                          onPressed: _handleCancel,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: widget.cancelColor,
                            side: BorderSide(color: Colors.grey[300]!),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            widget.cancelText,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Confirm Button
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _handleConfirm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: widget.confirmColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            widget.confirmText,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Loading Dialog Widget
class _LoadingDialog extends StatelessWidget {
  final String? message;

  const _LoadingDialog({this.message});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Semantics(
        label: 'Loading dialog',
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Loading Indicator
                SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.blue.shade600,
                    ),
                  ),
                ),

                // Message
                if (message != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    message!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// enum DialogType { success, error, warning, info, confirm, custom }
//
// class DialogService {
//
//   static Future<void> success(
//       BuildContext context, {
//         required String message,
//         String? title,
//         String buttonText = 'حسناً',
//         VoidCallback? onConfirm,
//       }) {
//     return _showCustomDialog(
//       context,
//       type: DialogType.success,
//       title: title ?? 'نجح!',
//       message: message,
//       icon: Icons.check_circle,
//       color: const Color(0xFF10B981),
//       buttonText: buttonText,
//       onConfirm: onConfirm,
//     );
//   }
//
//
//   static Future<void> error(
//       BuildContext context, {
//         required String message,
//         String? title,
//         String buttonText = 'حسناً',
//         VoidCallback? onConfirm,
//       }) {
//     return _showCustomDialog(
//       context,
//       type: DialogType.error,
//       title: title ?? 'خطأ!',
//       message: message,
//       icon: Icons.error,
//       color: const Color(0xFFEF4444),
//       buttonText: buttonText,
//       onConfirm: onConfirm,
//     );
//   }
//
//
//   static Future<void> warning(
//       BuildContext context, {
//         required String message,
//         String? title,
//         String buttonText = 'فهمت',
//         VoidCallback? onConfirm,
//       }) {
//     return _showCustomDialog(
//       context,
//       type: DialogType.warning,
//       title: title ?? 'تحذير!',
//       message: message,
//       icon: Icons.warning_amber,
//       color: const Color(0xFFF59E0B),
//       buttonText: buttonText,
//       onConfirm: onConfirm,
//     );
//   }
//
//
//   static Future<void> info(
//       BuildContext context, {
//         required String message,
//         String? title,
//         String buttonText = 'حسناً',
//         VoidCallback? onConfirm,
//       }) {
//     return _showCustomDialog(
//       context,
//       type: DialogType.info,
//       title: title ?? 'معلومة',
//       message: message,
//       icon: Icons.info,
//       color: const Color(0xFF3B82F6),
//       buttonText: buttonText,
//       onConfirm: onConfirm,
//     );
//   }
//
//
//   static Future<bool> confirm(
//       BuildContext context, {
//         required String message,
//         String? title,
//         String confirmText = 'تأكيد',
//         String cancelText = 'إلغاء',
//         Color? confirmColor,
//       }) async {
//     final result = await showDialog<bool>(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => _ConfirmDialog(
//         title: title ?? 'تأكيد العملية',
//         message: message,
//         confirmText: confirmText,
//         cancelText: cancelText,
//         confirmColor: confirmColor ?? const Color(0xFF3B82F6),
//       ),
//     );
//     return result ?? false;
//   }
//
//
//   static Future<void> _showCustomDialog(
//       BuildContext context, {
//         required DialogType type,
//         required String title,
//         required String message,
//         required IconData icon,
//         required Color color,
//         required String buttonText,
//         VoidCallback? onConfirm,
//       }) {
//     return showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => _CustomDialog(
//         type: type,
//         title: title,
//         message: message,
//         icon: icon,
//         color: color,
//         buttonText: buttonText,
//         onConfirm: onConfirm,
//       ),
//     );
//   }
//
//
//   static void showLoading(BuildContext context, {String? message}) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => _LoadingDialog(message: message),
//     );
//   }
//
//
//   static void dismiss(BuildContext context) {
//     Navigator.of(context).pop();
//   }
// }
//
//
// class _CustomDialog extends StatefulWidget {
//   final DialogType type;
//   final String title;
//   final String message;
//   final IconData icon;
//   final Color color;
//   final String buttonText;
//   final VoidCallback? onConfirm;
//
//   const _CustomDialog({
//     required this.type,
//     required this.title,
//     required this.message,
//     required this.icon,
//     required this.color,
//     required this.buttonText,
//     this.onConfirm,
//   });
//
//   @override
//   State<_CustomDialog> createState() => _CustomDialogState();
// }
//
// class _CustomDialogState extends State<_CustomDialog>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _fadeAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 400),
//       vsync: this,
//     );
//
//     _scaleAnimation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.elasticOut,
//     );
//
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeIn),
//     );
//
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FadeTransition(
//       opacity: _fadeAnimation,
//       child: ScaleTransition(
//         scale: _scaleAnimation,
//         child: Dialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(24),
//           ),
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           child: Container(
//             padding: const EdgeInsets.all(24),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(24),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   blurRadius: 20,
//                   offset: const Offset(0, 10),
//                 ),
//               ],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: widget.color.withOpacity(0.1),
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(
//                     widget.icon,
//                     size: 48,
//                     color: widget.color,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 Text(
//                   widget.title,
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: widget.color,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 12),
//
//                 Text(
//                   widget.message,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey[700],
//                     height: 1.5,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 24),
//                 // الزر
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                       widget.onConfirm?.call();
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: widget.color,
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       elevation: 0,
//                     ),
//                     child: Text(
//                       widget.buttonText,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
// class _ConfirmDialog extends StatefulWidget {
//   final String title;
//   final String message;
//   final String confirmText;
//   final String cancelText;
//   final Color confirmColor;
//
//   const _ConfirmDialog({
//     required this.title,
//     required this.message,
//     required this.confirmText,
//     required this.cancelText,
//     required this.confirmColor,
//   });
//
//   @override
//   State<_ConfirmDialog> createState() => _ConfirmDialogState();
// }
//
// class _ConfirmDialogState extends State<_ConfirmDialog>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _fadeAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 400),
//       vsync: this,
//     );
//
//     _scaleAnimation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.elasticOut,
//     );
//
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeIn),
//     );
//
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FadeTransition(
//       opacity: _fadeAnimation,
//       child: ScaleTransition(
//         scale: _scaleAnimation,
//         child: Dialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(24),
//           ),
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           child: Container(
//             padding: const EdgeInsets.all(24),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(24),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   blurRadius: 20,
//                   offset: const Offset(0, 10),
//                 ),
//               ],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: widget.confirmColor.withOpacity(0.1),
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(
//                     Icons.help_outline,
//                     size: 48,
//                     color: widget.confirmColor,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 Text(
//                   widget.title,
//                   style: const TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF1F2937),
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 12),
//
//                 Text(
//                   widget.message,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey[700],
//                     height: 1.5,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 24),
//
//                 Row(
//                   children: [
//                     Expanded(
//                       child: OutlinedButton(
//                         onPressed: () => Navigator.of(context).pop(false),
//                         style: OutlinedButton.styleFrom(
//                           foregroundColor: Colors.grey[700],
//                           side: BorderSide(color: Colors.grey[300]!),
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         child: Text(
//                           widget.cancelText,
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () => Navigator.of(context).pop(true),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: widget.confirmColor,
//                           foregroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           elevation: 0,
//                         ),
//                         child: Text(
//                           widget.confirmText,
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
// class _LoadingDialog extends StatelessWidget {
//   final String? message;
//
//   const _LoadingDialog({this.message});
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       child: Container(
//         padding: const EdgeInsets.all(24),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const CircularProgressIndicator(),
//             if (message != null) ...[
//               const SizedBox(height: 16),
//               Text(
//                 message!,
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.grey[700],
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }