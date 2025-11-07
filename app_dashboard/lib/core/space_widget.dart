import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// in this class write logical Your  idea
/// SpaceBox class, render in render object tree.
class SpaceBox extends RenderBox {
  double _space;

  SpaceBox({required double space}) : _space = space;

  set space(double value) {
    if (_space == value) return;
    _space = value;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    if (parent is RenderFlex) {
      final RenderFlex renderFlex = parent as RenderFlex;
      final axis = renderFlex.direction;
      if (axis == Axis.vertical) {
        size = constraints.constrain(Size(0, _space));
      } else {
        size = constraints.constrain(Size(_space, 0));
      }
    } else {
      size = constraints.constrain(Size(_space, _space));
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('Space', _space));
  }
}

/// in this class transformation the idea to widget using create render object method.
/// Space class, element in element tree.
class Space extends LeafRenderObjectWidget {
  final double space;

  const Space({super.key, required this.space});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return SpaceBox(space: space);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant RenderObject renderObject,
  ) {
    (renderObject as SpaceBox).space = space;
  }
}
