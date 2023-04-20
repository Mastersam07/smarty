import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    BatThemeWidget,
    () {
      testWidgets('BatThemeWidget can be built with required parameters',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          BatThemeWidget(
            data: BatThemeData(
              buttonStyle: const BatButtonStyle(),
              colors: const BatColors(
                background: Colors.white,
                primary: Colors.blue,
                secondary: Colors.green,
                tertiary: Colors.grey,
              ),
            ),
            child: Container(),
          ),
        );

        expect(find.byType(BatThemeWidget), findsOneWidget);
      });
      testWidgets('BatThemeWidget applies BatThemeData to Theme',
          (WidgetTester tester) async {
        final batThemeData = BatThemeData(
          buttonStyle: const BatButtonStyle(),
          colors: const BatColors(
            background: Colors.white,
            primary: Colors.blue,
            secondary: Colors.green,
            tertiary: Colors.grey,
          ),
        );

        await tester.pumpWidget(
          BatThemeWidget(
            data: batThemeData,
            child: Container(),
          ),
        );

        final theme = Theme.of(tester.element(find.byType(Container)));
        final themeExtensions =
            Map<Object, ThemeExtension>.from(theme.extensions);

        expect(themeExtensions[BatThemeData], equals(batThemeData));
      });

      testWidgets('BatThemeWidget merges BatThemeData with existing Theme',
          (WidgetTester tester) async {
        final existingThemeData = ThemeData(
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.green));
        final batThemeData = BatThemeData(
          buttonStyle: const BatButtonStyle(),
          colors: const BatColors(
            background: Colors.white,
            primary: Colors.blue,
            secondary: Colors.green,
            tertiary: Colors.grey,
          ),
        );

        await tester.pumpWidget(
          Theme(
            data: existingThemeData,
            child: BatThemeWidget(
              data: batThemeData,
              child: Container(),
            ),
          ),
        );

        final theme = Theme.of(tester.element(find.byType(Container)));
        final themeExtensions =
            Map<Object, ThemeExtension>.from(theme.extensions);

        expect(theme.colorScheme.secondary,
            equals(existingThemeData.colorScheme.secondary));
        expect(themeExtensions[BatThemeData], equals(batThemeData));
      });
    },
  );
}
