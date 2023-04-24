import 'dart:ui';

import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';

@immutable
class BatButtonStyle extends ThemeExtension<BatButtonStyle> {
  final double? elevation;
  final double? height;
  final EdgeInsets? padding;
  final Color? color;
  final Color? childColor;
  final ShapeBorder? shape;

  const BatButtonStyle({
    this.height,
    this.padding,
    this.color,
    this.childColor,
    this.shape,
    this.elevation,
  });

  /// Default for the button style.
  const BatButtonStyle.fallback()
      : this(
          shape: const RoundedRectangleBorder(),
          elevation: 0.0,
          childColor: BatPalette.white,
          color: BatPalette.primary,
          height: 53,
          padding: const EdgeInsets.symmetric(vertical: 16),
        );

  /// Default for the light button style.
  const BatButtonStyle.light()
      : this(
          shape: const RoundedRectangleBorder(),
          elevation: 0.0,
          childColor: BatPalette.white,
          color: BatPalette.primary,
          height: 53,
          padding: const EdgeInsets.symmetric(vertical: 16),
        );

  /// Default for the dark button style.
  const BatButtonStyle.dark()
      : this(
          shape: const RoundedRectangleBorder(),
          elevation: 0.0,
          childColor: BatPalette.primary,
          color: BatPalette.white,
          height: 53,
          padding: const EdgeInsets.symmetric(vertical: 16),
        );

  @override
  BatButtonStyle copyWith({
    ShapeBorder? shape,
    double? elevation,
    Color? childColor,
    Color? color,
    double? height,
    EdgeInsets? padding,
  }) {
    return BatButtonStyle(
      shape: shape ?? this.shape,
      elevation: elevation ?? this.elevation,
      childColor: childColor ?? this.childColor,
      color: color ?? this.color,
      height: height ?? this.height,
      padding: padding ?? this.padding,
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
      childColor: Color.lerp(childColor, other.childColor, t),
      color: Color.lerp(color, other.color, t),
      height: lerpDouble(height, other.height, t),
      padding: EdgeInsets.fromLTRB(
        lerpDouble(padding?.left, other.padding?.left, t) ?? 0,
        lerpDouble(padding?.top, other.padding?.top, t) ?? 0,
        lerpDouble(padding?.right, other.padding?.right, t) ?? 0,
        lerpDouble(padding?.bottom, other.padding?.bottom, t) ?? 0,
      ),
    );
  }
}
