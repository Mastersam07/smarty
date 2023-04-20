import 'package:flutter/material.dart';

@immutable
class BatTypography extends ThemeExtension<BatTypography> {
  static const packageName = 'bat_theme';

  final TextStyle headline1;
  final TextStyle headline1Medium;
  final TextStyle headline1Bold;
  final TextStyle headline2;
  final TextStyle headline2Medium;
  final TextStyle headline2Bold;
  final TextStyle headline3;
  final TextStyle headline3Medium;
  final TextStyle headline3Bold;
  final TextStyle headline4;
  final TextStyle headline4Medium;
  final TextStyle headline4Bold;
  final TextStyle bodyCopy;
  final TextStyle bodyCopyMedium;
  final TextStyle bodyCopyBold;
  final TextStyle subtitle;
  final TextStyle subtitleMedium;
  final TextStyle subtitleBold;

  const BatTypography._({
    required this.headline1Medium,
    required this.headline1Bold,
    required this.headline2Medium,
    required this.headline2Bold,
    required this.headline3Medium,
    required this.headline3Bold,
    required this.headline4Medium,
    required this.headline4Bold,
    required this.bodyCopyMedium,
    required this.bodyCopyBold,
    required this.subtitleMedium,
    required this.subtitleBold,
    required this.headline1,
    required this.headline2,
    required this.headline3,
    required this.headline4,
    required this.bodyCopy,
    required this.subtitle,
  });

  const BatTypography.regular()
      : this._(
          headline1: const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: packageName,
            fontSize: 60,
            fontWeight: FontWeight.w400,
            height: 1.4,
          ),
          headline1Medium: const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: packageName,
            fontSize: 60,
            fontWeight: FontWeight.w500,
            height: 1.4,
          ),
          headline1Bold: const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: packageName,
            fontSize: 60,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
          headline2: const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: packageName,
            fontSize: 48,
            fontWeight: FontWeight.w400,
            height: 1.4,
          ),
          headline2Medium: const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: packageName,
            fontSize: 48,
            fontWeight: FontWeight.w500,
            height: 1.4,
          ),
          headline2Bold: const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: packageName,
            fontSize: 48,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
          headline3: const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: packageName,
            fontSize: 34,
            fontWeight: FontWeight.w400,
            height: 1.4,
          ),
          headline3Medium: const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: packageName,
            fontSize: 34,
            fontWeight: FontWeight.w500,
            height: 1.4,
          ),
          headline3Bold: const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: packageName,
            fontSize: 34,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
          headline4: const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: packageName,
            fontSize: 24,
            fontWeight: FontWeight.w400,
            height: 1.4,
          ),
          headline4Medium: const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: packageName,
            fontSize: 24,
            fontWeight: FontWeight.w500,
            height: 1.4,
          ),
          headline4Bold: const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: packageName,
            fontSize: 24,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
          bodyCopy: const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: packageName,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.4,
          ),
          bodyCopyMedium: const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: packageName,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.4,
          ),
          bodyCopyBold: const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: packageName,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
          subtitle: const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: packageName,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.4,
          ),
          subtitleMedium: const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: packageName,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.4,
          ),
          subtitleBold: const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: packageName,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
        );

  @override
  BatTypography copyWith({
    TextStyle? headline1,
    TextStyle? headline1Medium,
    TextStyle? headline1Bold,
    TextStyle? headline2,
    TextStyle? headline2Medium,
    TextStyle? headline2Bold,
    TextStyle? headline3,
    TextStyle? headline3Medium,
    TextStyle? headline3Bold,
    TextStyle? headline4,
    TextStyle? headline4Medium,
    TextStyle? headline4Bold,
    TextStyle? bodyCopy,
    TextStyle? bodyCopyMedium,
    TextStyle? bodyCopyBold,
    TextStyle? subtitle,
    TextStyle? subtitleMedium,
    TextStyle? subtitleBold,
  }) {
    return BatTypography._(
      headline1: headline1 ?? this.headline1,
      headline1Medium: headline1Medium ?? this.headline1Medium,
      headline1Bold: headline1Bold ?? this.headline1Bold,
      headline2: headline2 ?? this.headline2,
      headline2Medium: headline2Medium ?? this.headline2Medium,
      headline2Bold: headline2Bold ?? this.headline2Bold,
      headline3: headline3 ?? this.headline3,
      headline3Medium: headline3Medium ?? this.headline3Medium,
      headline3Bold: headline3Bold ?? this.headline3Bold,
      headline4: headline4 ?? this.headline4,
      headline4Medium: headline4Medium ?? this.headline4Medium,
      headline4Bold: headline4Bold ?? this.headline4Bold,
      bodyCopy: bodyCopy ?? this.bodyCopy,
      bodyCopyMedium: bodyCopyMedium ?? this.bodyCopyMedium,
      bodyCopyBold: bodyCopyBold ?? this.bodyCopyBold,
      subtitle: subtitle ?? this.subtitle,
      subtitleMedium: subtitleMedium ?? this.subtitleMedium,
      subtitleBold: subtitleBold ?? this.subtitleBold,
    );
  }

  @override
  BatTypography lerp(ThemeExtension<BatTypography>? other, double t) {
    if (other is! BatTypography) {
      return this;
    }
    return BatTypography._(
      headline1: TextStyle.lerp(headline1, other.headline1, t)!,
      headline1Medium:
          TextStyle.lerp(headline1Medium, other.headline1Medium, t)!,
      headline1Bold: TextStyle.lerp(headline1Bold, other.headline1Bold, t)!,
      headline2: TextStyle.lerp(headline2, other.headline2, t)!,
      headline2Medium:
          TextStyle.lerp(headline2Medium, other.headline2Medium, t)!,
      headline2Bold: TextStyle.lerp(headline2Bold, other.headline2Bold, t)!,
      headline3: TextStyle.lerp(headline3, other.headline3, t)!,
      headline3Medium:
          TextStyle.lerp(headline3Medium, other.headline3Medium, t)!,
      headline3Bold: TextStyle.lerp(headline3Bold, other.headline3Bold, t)!,
      headline4: TextStyle.lerp(headline4, other.headline4, t)!,
      headline4Medium:
          TextStyle.lerp(headline4Medium, other.headline4Medium, t)!,
      headline4Bold: TextStyle.lerp(headline1Bold, other.headline1Bold, t)!,
      bodyCopy: TextStyle.lerp(bodyCopy, other.bodyCopy, t)!,
      bodyCopyMedium: TextStyle.lerp(bodyCopyMedium, other.bodyCopyMedium, t)!,
      bodyCopyBold: TextStyle.lerp(bodyCopyBold, other.bodyCopyBold, t)!,
      subtitle: TextStyle.lerp(subtitle, other.subtitle, t)!,
      subtitleMedium: TextStyle.lerp(subtitleMedium, other.subtitleMedium, t)!,
      subtitleBold: TextStyle.lerp(subtitleBold, other.subtitleBold, t)!,
    );
  }
}
