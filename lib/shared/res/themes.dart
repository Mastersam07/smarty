import 'package:flutter/material.dart';
import 'res.dart';

class SmartyThemeData {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: SmartyColors.primary,
    scaffoldBackgroundColor: SmartyColors.tertiary,
    splashColor: Colors.transparent,
    brightness: Brightness.light,
    highlightColor: Colors.transparent,
    dividerColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      backgroundColor: SmartyColors.tertiary,
      selectedItemColor: SmartyColors.primary,
      type: BottomNavigationBarType.fixed,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.only(
        top: (1 * Decorators.fontSize),
        bottom: (1 * Decorators.fontSize),
        right: (1 * Decorators.fontSize),
        left: (1 * Decorators.fontSize),
      ),
      hintStyle: TextStyles.body.copyWith(color: SmartyColors.grey60),
      fillColor: SmartyColors.black,
      border: Decorators.defaultLightBorder,
      enabledBorder: Decorators.enabledLightBorder,
      focusedBorder: Decorators.focusedLightBorder,
      focusedErrorBorder: Decorators.focusedErrorLightBorder,
      disabledBorder: Decorators.disabledLightBorder,
    ),
    textTheme: TextTheme(
      headline1: TextStyles.headline1,
      bodyText1: TextStyles.body,
      bodyText2: TextStyles.body,
      button: TextStyles.body,
      caption: TextStyles.body,
      headline2: TextStyles.headline2,
      headline3: TextStyles.headline3,
      headline4: TextStyles.headline4,
      subtitle2: TextStyles.subtitle,
      subtitle1: TextStyles.subtitle,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: SmartyColors.primary,
    scaffoldBackgroundColor: SmartyColors.tertiary,
    splashColor: Colors.transparent,
    brightness: Brightness.dark,
    highlightColor: Colors.transparent,
    dividerColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      backgroundColor: SmartyColors.tertiary,
      selectedItemColor: SmartyColors.primary,
      type: BottomNavigationBarType.fixed,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.only(
        top: (1 * Decorators.fontSize),
        bottom: (1 * Decorators.fontSize),
        right: (1 * Decorators.fontSize),
        left: (1 * Decorators.fontSize),
      ),
      hintStyle: TextStyles.body.copyWith(color: SmartyColors.grey60),
      fillColor: SmartyColors.black,
      border: Decorators.defaultLightBorder,
      enabledBorder: Decorators.enabledLightBorder,
      focusedBorder: Decorators.focusedLightBorder,
      focusedErrorBorder: Decorators.focusedErrorLightBorder,
      disabledBorder: Decorators.disabledLightBorder,
    ),
    textTheme: TextTheme(
      headline1: TextStyles.headline1,
      bodyText1: TextStyles.body,
      bodyText2: TextStyles.body,
      button: TextStyles.body,
      caption: TextStyles.body,
      headline2: TextStyles.headline2,
      headline3: TextStyles.headline3,
      headline4: TextStyles.headline4,
      subtitle2: TextStyles.subtitle,
      subtitle1: TextStyles.subtitle,
    ),
  );
}
