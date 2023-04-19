import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';

class PageIndicatorWidget extends StatelessWidget {
  const PageIndicatorWidget({
    Key? key,
    required this.count,
    required this.value,
    this.size = 8,
    this.spacing = 16,
  }) : super(key: key);

  final int count;
  final int value;
  final double size;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    var theme = BatThemeData.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (int i = 0; i < count; i++)
          AnimatedContainer(
            height: size,
            width: size,
            margin: EdgeInsets.fromLTRB(
              0,
              spacing,
              i == count - 1 ? 0 : spacing,
              spacing,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: i == value
                  ? theme.colors.primary
                  : theme.colors.tertiary.withOpacity(0.3),
            ),
            duration: const Duration(milliseconds: 900),
          )
      ],
    );
  }
}
