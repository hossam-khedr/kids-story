import 'dart:math';

import 'package:flutter/material.dart';

Color getNiceRandomColor() {
  final random = Random();

  final hue = random.nextInt(130) + 200;
  final saturation = 0.6 + random.nextDouble() * 0.4;
  final lightness = 0.5 + random.nextDouble() * 0.3;

  return HSLColor.fromAHSL(
    1.0,
    hue.toDouble(),
    saturation,
    lightness,
  ).toColor();
}