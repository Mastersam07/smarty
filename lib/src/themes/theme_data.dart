import 'package:bat_theme/src/themes/colors.dart';
import 'package:bat_theme/src/themes/radius.dart';
import 'package:bat_theme/src/themes/sizes.dart';
import 'package:bat_theme/src/themes/spacing.dart';
import 'package:bat_theme/src/themes/typography.dart';
import 'package:flutter/material.dart';

import 'button_style.dart';

class BatThemeData extends ThemeExtension<BatThemeData> {
  final BatButtonStyle buttonStyle;
  final BatColors colors;
  final BatRadius radius;
  final BatBorderRadius borderRadius;
  final BatSizes sizes;
  final BatSpacing spacings;
  final BatTypography typography;

  BatThemeData({
    required this.colors,
    required this.buttonStyle,
    this.radius = const BatRadius.regular(),
    this.borderRadius = const BatBorderRadius(BatRadius.regular()),
    this.sizes = const BatSizes.regular(),
    this.spacings = const BatSpacing.medium(),
    this.typography = const BatTypography.regular(),
  });

  static BatThemeData of(BuildContext context) =>
      Theme.of(context).extension<BatThemeData>()!;

  @override
  BatThemeData copyWith({
    BatButtonStyle? buttonStyle,
    BatColors? colors,
    BatRadius? radius,
    BatBorderRadius? borderRadius,
    BatSizes? sizes,
    BatSpacing? spacings,
    BatTypography? typography,
  }) {
    return BatThemeData(
      buttonStyle: buttonStyle ?? this.buttonStyle,
      colors: colors ?? this.colors,
      radius: radius ?? this.radius,
      borderRadius: borderRadius ?? this.borderRadius,
      sizes: sizes ?? this.sizes,
      spacings: spacings ?? this.spacings,
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
      radius: radius.lerp(other.radius, t),
      borderRadius: borderRadius.lerp(other.borderRadius, t),
      sizes: sizes.lerp(other.sizes, t),
      spacings: spacings.lerp(other.spacings, t),
      typography: typography.lerp(other.typography, t),
    );
  }
}
