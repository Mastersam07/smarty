import 'package:bat_theme/src/themes/palette.dart';
import 'package:flutter/material.dart';

@immutable
class BatColors extends ThemeExtension<BatColors> {
  final Color background;
  final Color primary;
  final Color secondary;
  final Color tertiary;
  const BatColors({
    required this.background,
    required this.primary,
    required this.secondary,
    required this.tertiary,
  });

  const BatColors.fallback()
      : this(
          background: BatPalette.white,
          primary: BatPalette.primary,
          secondary: BatPalette.secondary,
          tertiary: BatPalette.grey,
        );

  const BatColors.light()
      : this(
          background: BatPalette.white,
          primary: BatPalette.primary,
          secondary: BatPalette.secondary,
          tertiary: BatPalette.grey,
        );

  const BatColors.dark()
      : this(
          background: BatPalette.grey,
          primary: BatPalette.primary,
          secondary: BatPalette.white,
          tertiary: BatPalette.white,
        );

  @override
  BatColors copyWith({
    Color? background,
    Color? primary,
    Color? secondary,
    Color? tertiary,
  }) {
    return BatColors(
      background: background ?? this.background,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
    );
  }

  @override
  BatColors lerp(covariant ThemeExtension<BatColors>? other, double t) {
    if (other is! BatColors) {
      return this;
    }
    return BatColors(
      background: Color.lerp(background, other.background, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
    );
  }
}
