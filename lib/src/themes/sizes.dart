import 'package:flutter/material.dart';

@immutable
class BatSizes extends ThemeExtension<BatSizes> {
  const BatSizes._();

  const BatSizes.small() : this._();

  const BatSizes.regular() : this._();

  const BatSizes.large() : this._();

  @override
  BatSizes copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  BatSizes lerp(covariant ThemeExtension<BatSizes>? other, double t) {
    // TODO: implement lerp
    throw UnimplementedError();
  }
}
