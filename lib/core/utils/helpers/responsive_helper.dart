import 'package:flutter/material.dart';

class ResponsiveHelper {

  static ResponsiveHelper? _instance;
  static ResponsiveHelper get instance {
    _instance ??= ResponsiveHelper._();
    return _instance!;
  }


  ResponsiveHelper._();


  BuildContext? _context;

  // تهيئة الـ context (يتم استدعاؤها مرة واحدة في الـ main أو أول صفحة)
  void init(BuildContext context) {
    _context = context;
  }


  BuildContext get _ctx {
    assert(_context != null, 'ResponsiveHelper not initialized. Call ResponsiveHelper.instance.init(context) first.');
    return _context!;
  }


  MediaQueryData get _mediaQuery => MediaQuery.of(_ctx);


  double get screenWidth => _mediaQuery.size.width;
  double get screenHeight => _mediaQuery.size.height;


  bool get isMobile => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 1024;
  bool get isDesktop => screenWidth >= 1024;


  double width(double percentage) {
    return (screenWidth / 100) * percentage;
  }

  double height(double percentage) {
    return (screenHeight / 100) * percentage;
  }

  double safeWidth(double percentage) {
    final safeHorizontal = _mediaQuery.padding.left + _mediaQuery.padding.right;
    return ((screenWidth - safeHorizontal) / 100) * percentage;
  }

  double safeHeight(double percentage) {
    final safeVertical = _mediaQuery.padding.top + _mediaQuery.padding.bottom;
    return ((screenHeight - safeVertical) / 100) * percentage;
  }


  double font(double size) {
    double multiplier;
    if (isMobile) {
      multiplier = 1.0;
    } else if (isTablet) {
      multiplier = 1.2;
    } else {
      multiplier = 1.4; // Desktop
    }
    return size * multiplier;
  }


  double padding(double size) {
    double multiplier;
    if (isMobile) {
      multiplier = 1.0;
    } else if (isTablet) {
      multiplier = 1.3;
    } else {
      multiplier = 1.6; // Desktop
    }
    return size * multiplier;
  }


  EdgeInsets paddingAll(double size) {
    return EdgeInsets.all(padding(size));
  }

  EdgeInsets paddingSymmetric({double vertical = 0, double horizontal = 0}) {
    return EdgeInsets.symmetric(
      vertical: padding(vertical),
      horizontal: padding(horizontal),
    );
  }

  EdgeInsets paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.only(
      left: padding(left),
      top: padding(top),
      right: padding(right),
      bottom: padding(bottom),
    );
  }


  double value(double baseValue) {
    double multiplier;
    if (isMobile) {
      multiplier = 1.0;
    } else if (isTablet) {
      multiplier = 1.3;
    } else {
      multiplier = 1.6; // Desktop
    }
    return baseValue * multiplier;
  }


  double get aspectRatio => screenWidth / screenHeight;


  bool get isLandscape => _mediaQuery.orientation == Orientation.landscape;
  bool get isPortrait => _mediaQuery.orientation == Orientation.portrait;


  T responsive<T>(T mobile, T tablet, T desktop) {
    if (isMobile) return mobile;
    if (isTablet) return tablet;
    return desktop;
  }


  static ResponsiveHelper get r => instance;
}