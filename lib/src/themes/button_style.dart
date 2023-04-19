import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
class BatButtonStyle extends ThemeExtension<BatButtonStyle> {
  final double? elevation;

  /// The shape of the button.
  final ShapeBorder? shape;

  final MainAxisSize mainAxisSize;

  const BatButtonStyle({
    this.shape,
    this.elevation,
    this.mainAxisSize = MainAxisSize.min,
  });

  /// Default for the light button style.
  const BatButtonStyle.light()
      : this(
          shape: const RoundedRectangleBorder(),
          elevation: 0.0,
          mainAxisSize: MainAxisSize.min,
        );

  /// Default for the dark button style.
  const BatButtonStyle.dark()
      : this(
          shape: const RoundedRectangleBorder(),
          elevation: 0.0,
          mainAxisSize: MainAxisSize.min,
        );

  @override
  BatButtonStyle copyWith({
    ShapeBorder? shape,
    double? elevation,
    MainAxisSize? mainAxisSize,
  }) {
    return BatButtonStyle(
      shape: shape ?? this.shape,
      elevation: elevation ?? this.elevation,
    );
  }

  @override
  BatButtonStyle lerp(ThemeExtension<BatButtonStyle>? other, double t) {
    if (other is! BatButtonStyle) {
      return this;
    }
    return copyWith(
      shape: ShapeBorder.lerp(shape, other.shape, t),
      elevation: lerpDouble(elevation, other.elevation, t),
      mainAxisSize: other.mainAxisSize,
    );
  }
}
