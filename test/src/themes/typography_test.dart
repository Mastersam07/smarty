import 'package:bat_theme/src/themes/typography.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BatTypography', () {
    test('regular constructor', () {
      const typography = BatTypography.regular();
      expect(
          typography.headline1,
          const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: 'bat_theme',
            fontSize: 60,
            fontWeight: FontWeight.w400,
            height: 1.4,
          ));
      expect(
          typography.headline1Medium,
          const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: 'bat_theme',
            fontSize: 60,
            fontWeight: FontWeight.w500,
            height: 1.4,
          ));
      expect(
          typography.headline1Bold,
          const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: 'bat_theme',
            fontSize: 60,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ));
      expect(
          typography.headline2,
          const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: 'bat_theme',
            fontSize: 48,
            fontWeight: FontWeight.w400,
            height: 1.4,
          ));
      expect(
          typography.headline2Medium,
          const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: 'bat_theme',
            fontSize: 48,
            fontWeight: FontWeight.w500,
            height: 1.4,
          ));
      expect(
          typography.headline2Bold,
          const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: 'bat_theme',
            fontSize: 48,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ));
      expect(
          typography.headline3,
          const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: 'bat_theme',
            fontSize: 34,
            fontWeight: FontWeight.w400,
            height: 1.4,
          ));
      expect(
          typography.headline3Medium,
          const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: 'bat_theme',
            fontSize: 34,
            fontWeight: FontWeight.w500,
            height: 1.4,
          ));
      expect(
          typography.headline3Bold,
          const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: 'bat_theme',
            fontSize: 34,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ));
      expect(
          typography.headline4,
          const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: 'bat_theme',
            fontSize: 24,
            fontWeight: FontWeight.w400,
            height: 1.4,
          ));
      expect(
          typography.headline4Medium,
          const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: 'bat_theme',
            fontSize: 24,
            fontWeight: FontWeight.w500,
            height: 1.4,
          ));
      expect(
          typography.headline4Bold,
          const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: 'bat_theme',
            fontSize: 24,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ));
      expect(
          typography.bodyCopy,
          const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: 'bat_theme',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.4,
          ));
      expect(
          typography.bodyCopyMedium,
          const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: 'bat_theme',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.4,
          ));
      expect(
          typography.bodyCopyBold,
          const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: 'bat_theme',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ));
      expect(
          typography.subtitle,
          const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: 'bat_theme',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.4,
          ));
      expect(
          typography.subtitleMedium,
          const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: 'bat_theme',
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.4,
          ));
      expect(
          typography.subtitleBold,
          const TextStyle(
            fontFamily: 'TT Firs Neue',
            package: 'bat_theme',
            fontSize: 12,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ));
    });

    test('copyWith should return a new BatTypography with updated properties',
        () {
      const original = BatTypography.regular();
      final updated = original.copyWith(
        headline1: const TextStyle(fontSize: 72),
        headline1Bold:
            const TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
      );

      expect(updated.headline1.fontSize, equals(72));
      expect(updated.headline1Bold.fontSize, equals(72));
      expect(updated.headline1Bold.fontWeight, equals(FontWeight.bold));

      // Ensure original instance was not modified
      expect(original.headline1.fontSize, isNot(equals(72)));
      expect(original.headline1Bold.fontSize, isNot(equals(72)));
      expect(original.headline1Bold.fontWeight, isNot(equals(FontWeight.bold)));
    });
  });
}
