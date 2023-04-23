import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';

enum BtnState { active, inactive }

class AppButtonPrimary extends StatelessWidget {
  const AppButtonPrimary({
    Key? key,
    this.onPressed,
    required this.label,
    this.btnColor,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String label;
  final Color? btnColor;

  @override
  Widget build(BuildContext context) {
    var theme = BatThemeData.of(context);
    final effectiveBackgroundColor = btnColor ?? theme.buttonStyle.color;
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: theme.typography.bodyCopyMedium
              .copyWith(color: theme.buttonStyle.childColor),
        ),
        style: TextButton.styleFrom(
          foregroundColor: theme.buttonStyle.childColor,
          backgroundColor: effectiveBackgroundColor,
          padding: theme.buttonStyle.padding,
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
