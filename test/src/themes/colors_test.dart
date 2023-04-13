import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BatColors', () {
    test('light() returns correct background color', () {
      final batColors = BatColors.light();
      expect(batColors.background, equals(BatPalette.white));
    });

    test('dark() returns correct background color', () {
      final batColors = BatColors.dark();
      expect(batColors.background, equals(BatPalette.grey));
    });

    test('lerp() returns correct value when given another BatColors object',
        () {
      final batColors1 = BatColors.light();
      final batColors2 = BatColors.dark();
      final lerpValue = batColors1.lerp(batColors2, 0.5);
      expect(lerpValue.background,
          equals(Color.lerp(BatPalette.white, BatPalette.grey, 0.5)));
    });

    test('lerp() interpolates the background color', () {
      final colors1 = BatColors.light();
      final colors2 = BatColors.dark();

      final colorsLerp1 = colors1.lerp(colors2, 0.5);
      final colorsLerp2 = colors2.lerp(colors1, 0.5);

      expect(colorsLerp1.background,
          equals(Color.lerp(BatPalette.white, BatPalette.grey, 0.5)));
      expect(colorsLerp2.background,
          equals(Color.lerp(BatPalette.grey, BatPalette.white, 0.5)));
    });
  });
}
