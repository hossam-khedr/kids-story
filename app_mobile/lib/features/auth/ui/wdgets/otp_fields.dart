import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class OtpController{
  final List<TextEditingController> _controllers = [];
  final List<FocusNode> _focusNodes = [];

  void _initialize(int length) {
    _controllers.clear();
    _focusNodes.clear();
    for (int i = 0; i < length; i++) {
      _controllers.add(TextEditingController());
      _focusNodes.add(FocusNode());
    }
  }

  /// Get current OTP value
  String get text => _controllers.map((c) => c.text).join();

  /// Set OTP value
  set text(String value) {
    for (int i = 0; i < _controllers.length && i < value.length; i++) {
      _controllers[i].text = value[i];
    }
  }

  /// Clear all fields
  void clear() {
    for (var controller in _controllers) {
      controller.clear();
    }
  }

  /// Set focus to specific field
  void focusField(int index) {
    if (index >= 0 && index < _focusNodes.length) {
      _focusNodes[index].requestFocus();
    }
  }

  /// Check if OTP is complete
  bool get isComplete =>
      _controllers.every((c) => c.text.isNotEmpty) &&
          _controllers.isNotEmpty;

  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
  }
}
class OtpTextField extends StatefulWidget {
final OtpController? controller;
  final int length;


  final Function(String)? onCompleted;


  final Function(String)? onChanged;


  final double fieldWidth;


  final double fieldHeight;


  final double fieldSpacing;


  final double borderRadius;


  final double borderWidth;


  final Color? borderColor;


  final Color? focusedBorderColor;


  final Color? filledBorderColor;


  final Color? backgroundColor;


  final Color? filledBackgroundColor;


  final TextStyle? textStyle;


  final bool showCursor;


  final Color? cursorColor;


  final TextInputType keyboardType;


  final bool enabled;


  final bool obscureText;


  final bool autoFocus;

  const OtpTextField({
    super.key,
    this.length = 6,
    this.onCompleted,
    this.onChanged,
    this.fieldWidth = 50,
    this.fieldHeight = 60,
    this.fieldSpacing = 8,
    this.borderRadius = 12,
    this.borderWidth = 2,
    this.borderColor,
    this.focusedBorderColor,
    this.filledBorderColor,
    this.backgroundColor,
    this.filledBackgroundColor,
    this.textStyle,
    this.showCursor = true,
    this.cursorColor,
    this.keyboardType = TextInputType.number,
    this.enabled = true,
    this.obscureText = false,
    this.autoFocus = true, this.controller,
  });

  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  late List<bool> _isFilled;
  late bool _isInternalController;

  @override
  void initState() {
    super.initState();
    _isInternalController = widget.controller == null;

    if (widget.controller != null) {
      widget.controller!._initialize(widget.length);
      _controllers = widget.controller!._controllers;
      _focusNodes = widget.controller!._focusNodes;
    } else {
      _controllers = List.generate(
        widget.length,
            (index) => TextEditingController(),
      );
      _focusNodes = List.generate(
        widget.length,
            (index) => FocusNode(),
      );
    }

    _isFilled = List.generate(widget.length, (index) => false);

    // Add listeners
    for (int i = 0; i < widget.length; i++) {
      _focusNodes[i].addListener(() {
        setState(() {});
      });
    }

    // Auto focus first field
    if (widget.autoFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNodes[0].requestFocus();
      });
    }
  }

  @override
  void dispose() {
    // Only dispose if using internal controller
    if (_isInternalController) {
      for (var controller in _controllers) {
        controller.dispose();
      }
      for (var node in _focusNodes) {
        node.dispose();
      }
    }
    super.dispose();
  }

  String _getOtp() {
    return _controllers.map((c) => c.text).join();
  }

  void _onChanged(String value, int index) {
    setState(() {
      _isFilled[index] = value.isNotEmpty;
    });

    if (value.isNotEmpty) {

      if (index < widget.length - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    }


    final otp = _getOtp();
    widget.onChanged?.call(otp);


    if (otp.length == widget.length) {
      widget.onCompleted?.call(otp);
    }
  }

  void _onKeyPressed(RawKeyEvent event, int index) {
    if (event is RawKeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.backspace) {
        if (_controllers[index].text.isEmpty && index > 0) {
          _focusNodes[index - 1].requestFocus();
          _controllers[index - 1].clear();
        }
      }
    }
  }

  Color _getBorderColor(int index) {
    if (_focusNodes[index].hasFocus) {
      return widget.focusedBorderColor ?? Colors.blue;
    } else if (_isFilled[index]) {
      return widget.filledBorderColor ?? Colors.blue;
    } else {
      return widget.borderColor ?? Colors.grey.shade300;
    }
  }

  Color _getBackgroundColor(int index) {
    if (_isFilled[index]) {
      return widget.filledBackgroundColor ?? Colors.blue.shade50;
    } else {
      return widget.backgroundColor ?? Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        widget.length,
            (index) => Container(
          width: widget.fieldWidth,
          height: widget.fieldHeight,
          margin: EdgeInsets.only(
            right: index < widget.length  ? widget.fieldSpacing : 0,
          ),
          child: RawKeyboardListener(
            focusNode: FocusNode(),
            onKey: (event) => _onKeyPressed(event, index),
            child: TextField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              enabled: widget.enabled,
              obscureText: widget.obscureText,
              textAlign: TextAlign.center,
              keyboardType: widget.keyboardType,
              maxLength: 1,
              showCursor: widget.showCursor,
              cursorColor: widget.cursorColor ?? Colors.blue,
              style: widget.textStyle ??
                  const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
              decoration: InputDecoration(
                counterText: '',
                filled: true,
                fillColor: _getBackgroundColor(index),
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(
                    color: _getBorderColor(index),
                    width: widget.borderWidth,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(
                    color: _getBorderColor(index),
                    width: widget.borderWidth,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(
                    color: _getBorderColor(index),
                    width: widget.borderWidth,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(
                    color: Colors.grey.shade200,
                    width: widget.borderWidth,
                  ),
                ),
              ),
              inputFormatters: widget.keyboardType == TextInputType.number
                  ? [FilteringTextInputFormatter.digitsOnly]
                  : null,
              onChanged: (value) => _onChanged(value, index),
              onTap: () {
                _controllers[index].selection = TextSelection.fromPosition(
                  TextPosition(offset: _controllers[index].text.length),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}