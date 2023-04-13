import 'package:flutter/material.dart';

@immutable
class BatRadius extends ThemeExtension<BatRadius> {
  final Radius small;

  const BatRadius._({required this.small});

  const BatRadius.regular() : this._(small: const Radius.circular(4));

  @override
  ThemeExtension<BatRadius> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  BatRadius lerp(covariant ThemeExtension<BatRadius>? other, double t) {
    // TODO: implement lerp
    throw UnimplementedError();
  }
}

@immutable
class BatBorderRadius extends ThemeExtension<BatBorderRadius> {
  final BatRadius _radius;

  const BatBorderRadius(this._radius);

  BorderRadius get small => BorderRadius.all(_radius.small);

  @override
  BatBorderRadius copyWith({BatRadius? radius}) {
    return BatBorderRadius(radius ?? _radius);
  }

  @override
  BatBorderRadius lerp(ThemeExtension<BatBorderRadius>? other, double t) {
    if (other is! BatBorderRadius) return this;
    return BatBorderRadius(_radius.lerp(other._radius, t));
  }
}
