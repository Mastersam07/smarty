import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BatThemeData', () {
    test('Constructor creates a valid instance', () {
      const colors = BatColors(
        primary: Colors.red,
        secondary: Colors.blue,
        background: Colors.white,
        tertiary: Colors.green,
      );
      const buttonStyle = BatButtonStyle();
      const typography = BatTypography.regular();

      const batTheme = BatThemeData(
        colors: colors,
        buttonStyle: buttonStyle,
        typography: typography,
      );

      expect(batTheme.colors, equals(colors));
      expect(batTheme.buttonStyle, equals(buttonStyle));
      expect(batTheme.typography, equals(typography));
    });

    test('copyWith() creates a new instance with updated properties', () {
      const batTheme = BatThemeData(
        colors: BatColors(
          primary: Colors.red,
          secondary: Colors.blue,
          background: Colors.white,
          tertiary: Colors.green,
        ),
        buttonStyle: BatButtonStyle(),
        typography: BatTypography.regular(),
      );

      const updatedColors = BatColors(
        primary: Colors.green,
        secondary: Colors.yellow,
        background: Colors.black,
        tertiary: Colors.green,
      );
      const updatedButtonStyle = BatButtonStyle();
      const updatedTypography = BatTypography.regular();

      final newBatTheme = batTheme.copyWith(
        colors: updatedColors,
        buttonStyle: updatedButtonStyle,
        typography: updatedTypography,
      );

      expect(newBatTheme.colors, equals(updatedColors));
      expect(newBatTheme.buttonStyle, equals(updatedButtonStyle));
      expect(newBatTheme.typography, equals(updatedTypography));
    });

    test('lerp() interpolates properties of two BatThemeData instances', () {
      const batTheme1 = BatThemeData(
        colors: BatColors(
          primary: Colors.red,
          secondary: Colors.blue,
          background: Colors.white,
          tertiary: Colors.green,
        ),
        buttonStyle: BatButtonStyle(),
        typography: BatTypography.regular(),
      );

      const batTheme2 = BatThemeData(
        colors: BatColors(
          primary: Colors.green,
          secondary: Colors.yellow,
          background: Colors.black,
          tertiary: Colors.green,
        ),
        buttonStyle: BatButtonStyle(),
        typography: BatTypography.regular(),
      );

      final interpolatedBatTheme = batTheme1.lerp(batTheme2, 0);

      expect(
          interpolatedBatTheme.colors.primary, equals(const Color(0xfff44336)));
      expect(interpolatedBatTheme.colors.secondary,
          equals(const Color(0xff2196f3)));
    });

    testWidgets('of() returns the BatThemeData instance extended by the Theme',
        (WidgetTester tester) async {
      const colors = BatColors(
        primary: Colors.red,
        secondary: Colors.blue,
        background: Colors.white,
        tertiary: Colors.green,
      );
      const buttonStyle = BatButtonStyle();
      const typography = BatTypography.regular();

      final themeData = ThemeData();
      const batTheme = BatThemeData(
        colors: colors,
        buttonStyle: buttonStyle,
        typography: typography,
      );
      final extendedThemeData = themeData.copyWith(
        extensions: [batTheme],
      );

      await tester.pumpWidget(
        Theme(
          data: extendedThemeData,
          child: BatThemeWidget(
            data: batTheme,
            child: Container(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final ofResult = BatThemeData.of(tester.element(find.byType(Container)));

      expect(ofResult, equals(batTheme));
    });

    test('copyWith', () {
      const original = BatThemeData(
        colors: BatColors(
          primary: Colors.red,
          secondary: Colors.blue,
          background: Colors.white,
          tertiary: Colors.green,
        ),
        buttonStyle: BatButtonStyle(elevation: 2.0),
        typography: BatTypography.regular(),
      );

      final copy = original.copyWith(
        colors: const BatColors(
          primary: Colors.green,
          secondary: Colors.yellow,
          background: Colors.black,
          tertiary: Colors.green,
        ),
        buttonStyle: const BatButtonStyle(elevation: 1.0),
        typography: const BatTypography.regular().copyWith(
            headline1: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        )),
      );

      expect(copy.colors.primary, Colors.green);
      expect(copy.buttonStyle.elevation, 1.0);
      expect(copy.typography.headline1.fontWeight, FontWeight.bold);
      expect(copy.typography.headline1.fontSize, 20);
    });
  });
}
