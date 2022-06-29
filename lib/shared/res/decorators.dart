import 'package:flutter/material.dart';

import 'res.dart';

class Decorators {
  Decorators._();

  //default fontSize
  static const double fontSize = 14;

  static InputBorder get defaultLightBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: SmartyColors.grey60,
        ),
      );

  static InputBorder get enabledLightBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: SmartyColors.grey60,
        ),
      );

  static InputBorder get focusedLightBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: SmartyColors.grey60,
          width: 2,
        ),
      );

  static InputBorder get errorLightBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Color(0xFFFB4E4E)),
      );

  static InputBorder get disabledLightBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: SmartyColors.grey60,
          width: 0,
        ),
      );

  static InputBorder get focusedErrorLightBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(color: SmartyColors.error),
      );

  static InputBorder get defaultDarkBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: SmartyColors.grey60,
        ),
      );

  static InputBorder get enabledDarkBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: SmartyColors.grey60,
        ),
      );

  static InputBorder get focusedDarkBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: SmartyColors.grey60,
          width: 2,
        ),
      );

  static InputBorder get errorDarkBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Color(0xFFFB4E4E)),
      );

  static InputBorder get disabledDarkBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: SmartyColors.grey60,
          width: 0,
        ),
      );

  static InputBorder get focusedErrorDarkBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(color: SmartyColors.error),
      );
}
