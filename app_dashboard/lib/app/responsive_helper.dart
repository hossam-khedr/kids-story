import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ScreenSize { mobile, tablet, desktop }

enum DeviceOrientation { portrait, landscape }

class ResponsiveHelper {
  final BuildContext context;

  ResponsiveHelper(this.context);

  MediaQueryData get mediaQuery => MediaQuery.of(context);

  double get screenWidth => mediaQuery.size.width;

  double get screenHeight => mediaQuery.size.height;

  double get statusBarHeight => mediaQuery.padding.top;

  double get bottomInset => mediaQuery.viewInsets.bottom;

  bool get isPortrait => screenHeight >= screenWidth;

  bool get isLandscape => screenWidth >= screenHeight;

  DeviceOrientation get orientation =>
      isPortrait ? DeviceOrientation.portrait : DeviceOrientation.landscape;

  ScreenSize get screenSize {
    final width = screenWidth;
    if (width < 600) return ScreenSize.mobile;
    if (width < 1024) return ScreenSize.tablet;
    return ScreenSize.desktop;
  }

  bool get isMobile => screenSize == ScreenSize.mobile;

  bool get isTablet => screenSize == ScreenSize.tablet;

  bool get isDeskTop => screenSize == ScreenSize.desktop;

  double responsiveValue({
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    return switch (screenSize) {
      ScreenSize.mobile => mobile,
      ScreenSize.tablet => tablet ?? mobile,
      ScreenSize.desktop => desktop ?? tablet ?? mobile,
    };
  }

  Widget responsiveWidget({
    required Widget mobile,
    Widget? tablet,
    Widget? desktop,
  }) {
    return switch (screenSize) {
      ScreenSize.mobile => mobile,
      ScreenSize.tablet => tablet ?? mobile,
      ScreenSize.desktop => desktop ?? tablet ?? mobile,
    };
  }

  Widget orientationWidget({required Widget portrait, Widget? landscape}) {
    return isPortrait ? portrait : landscape ?? portrait;
  }

  double get scaleFactor {
    if (isMobile) return 1.0;
    if (isTablet) return 1.2;
    return 1.4;
  }

  int get gridColumns {
    if (isMobile) return 1;
    if (isTablet) return isPortrait ? 2 : 3;
    return isPortrait ? 3 : 4;
  }

  double fontSize(double baseSize) => baseSize * scaleFactor;

  double get spacingXS => 4 * scaleFactor;

  double get spacingS => 8 * scaleFactor;

  double get spacingM => 16 * scaleFactor;

  double get spacingL => 24 * scaleFactor;

  double get spacingXL => 32 * scaleFactor;

  double get spacingXXL => 48 * scaleFactor;

  EdgeInsets get safePadding => EdgeInsets.only(
    top: statusBarHeight,
    bottom: mediaQuery.padding.bottom,
    left: mediaQuery.padding.left,
    right: mediaQuery.padding.right,
  );
}


extension ResponsiveContext on BuildContext{
  ResponsiveHelper get responsive => ResponsiveHelper(this);

  bool get isMobile => responsive.isMobile;
  bool get isTablet => responsive.isTablet;
  bool get isDesktop => responsive.isDeskTop;
  bool get isPortrait => responsive.isPortrait;
  double get screenWidth => responsive.screenWidth;
  double get screenHeight => responsive.screenHeight;

  double responsiveValue({
    required double mobile,
    double? tablet,
    double? desktop,
  }) => responsive.responsiveValue(mobile: mobile, tablet: tablet, desktop: desktop);

  Widget responsiveWidget({
    required Widget mobile,
    Widget? tablet,
    Widget? desktop,
  }) => responsive.responsiveWidget(mobile: mobile, tablet: tablet, desktop: desktop);
}