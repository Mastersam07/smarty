import 'package:flutter_test/flutter_test.dart';

import 'package:bat_theme/bat_theme.dart';

void main() {
  test('Imports button_style.dart', () {
    expect(BatButtonStyle, isNotNull);
  });

  test('Imports colors.dart', () {
    expect(BatColors, isNotNull);
  });

  test('Imports theme_data.dart', () {
    expect(BatThemeData, isNotNull);
  });

  test('Imports theme_widget.dart', () {
    expect(BatThemeWidget, isNotNull);
  });

  test('Imports typography.dart', () {
    expect(BatTypography, isNotNull);
  });
}
