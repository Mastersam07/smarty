import 'package:bat_theme/src/themes/colors.dart';
import 'package:bat_theme/src/themes/typography.dart';
import 'package:flutter/material.dart';

import 'button_style.dart';

class BatThemeData extends ThemeExtension<BatThemeData> {
  final BatButtonStyle buttonStyle;
  final BatColors colors;
  final BatTypography typography;

  const BatThemeData({
    this.colors = const BatColors.fallback(),
    this.buttonStyle = const BatButtonStyle.fallback(),
    this.typography = const BatTypography.regular(),
  });

  const BatThemeData.light()
      : this(
          colors: const BatColors.light(),
          buttonStyle: const BatButtonStyle.light(),
          typography: const BatTypography.regular(),
        );

  const BatThemeData.dark()
      : this(
          colors: const BatColors.dark(),
          buttonStyle: const BatButtonStyle.dark(),
          typography: const BatTypography.regular(),
        );

  static BatThemeData of(BuildContext context) =>
      Theme.of(context).extension<BatThemeData>()!;

  @override
  BatThemeData copyWith({
    BatButtonStyle? buttonStyle,
    BatColors? colors,
    BatTypography? typography,
  }) {
    return BatThemeData(
      buttonStyle: buttonStyle ?? this.buttonStyle,
      colors: colors ?? this.colors,
      typography: typography ?? this.typography,
    );
  }

  @override
  BatThemeData lerp(
    BatThemeData? other,
    double t,
  ) {
    if (other is! BatThemeData) return this;
    return BatThemeData(
      buttonStyle: buttonStyle.lerp(other.buttonStyle, t),
      colors: colors.lerp(other.colors, t),
      typography: typography.lerp(other.typography, t),
    );
  }
}
