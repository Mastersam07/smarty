import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bat_theme/src/themes/button_style.dart';

void main() {
  group('BatButtonStyle tests', () {
    test('CopyWith method returns a new instance with the same values', () {
      const originalStyle = BatButtonStyle(
        shape: RoundedRectangleBorder(),
        elevation: 2.0,
      );
      final copiedStyle = originalStyle.copyWith();
      expect(originalStyle, isNot(copiedStyle));
      expect(originalStyle.shape, copiedStyle.shape);
      expect(originalStyle.elevation, copiedStyle.elevation);
    });

    test('CopyWith method returns a new instance with updated values', () {
      const originalStyle = BatButtonStyle(
        shape: RoundedRectangleBorder(),
        elevation: 2.0,
      );
      final copiedStyle = originalStyle.copyWith(
        shape: const CircleBorder(),
        elevation: 5.0,
      );
      expect(originalStyle.shape, isNot(copiedStyle.shape));
      expect(copiedStyle.shape, const CircleBorder());
      expect(originalStyle.elevation, isNot(copiedStyle.elevation));
      expect(copiedStyle.elevation, 5.0);
    });

    test('Lerp method returns the correct style', () {
      const startStyle = BatButtonStyle(
        shape: RoundedRectangleBorder(),
        elevation: 2.0,
      );
      const endStyle = BatButtonStyle(
        shape: CircleBorder(),
        elevation: 5.0,
      );
      final lerpedStyle = startStyle.lerp(endStyle, 0.5);
      // expect(lerpedStyle.shape, isA<StadiumBorder>());
      expect(lerpedStyle.elevation, 3.5);
    });
  });
}
