import 'package:flutter/material.dart';

import 'theme_data.dart';

/// A widget that overrides the theme with the provided [theme] for its [child].
/// Applies the given theme [data] to [child].
///
/// The [data] and [child] arguments must not be null.
class BatThemeWidget extends StatelessWidget {
  final BatThemeData data;
  final Widget child;

  const BatThemeWidget({
    super.key,
    required this.data,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeExtensions = Map<Object, ThemeExtension>.from(theme.extensions);

    themeExtensions[BatThemeData] = data;

    return Theme(
      data: theme.copyWith(extensions: themeExtensions.values),
      child: child,
    );
  }
}
