import 'package:bat_theme/src/themes/palette.dart';
import 'package:flutter/material.dart';

@immutable
class BatColors extends ThemeExtension<BatColors> {
  final Color background;
  const BatColors._({
    required this.background,
  });

  BatColors.light()
      : this._(
          background: BatPalette.white,
        );

  BatColors.dark()
      : this._(
          background: BatPalette.grey,
        );

  @override
  BatColors copyWith() {
    return this;
  }

  @override
  BatColors lerp(covariant ThemeExtension<BatColors>? other, double t) {
    if (other is! BatColors) {
      return this;
    }
    return BatColors._(
        background: Color.lerp(background, other.background, t)!);
  }
}
