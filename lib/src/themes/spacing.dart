import 'package:flutter/material.dart';

@immutable
class BatSpacing extends ThemeExtension<BatSpacing> {
  const BatSpacing._();

  const BatSpacing.small() : this._();

  const BatSpacing.medium() : this._();

  const BatSpacing.large() : this._();

  @override
  BatSpacing copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  BatSpacing lerp(covariant ThemeExtension<BatSpacing>? other, double t) {
    // TODO: implement lerp
    throw UnimplementedError();
  }
}
