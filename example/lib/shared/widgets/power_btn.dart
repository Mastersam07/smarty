import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';

class ChipButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget? child;
  const ChipButton({
    Key? key,
    this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = BatThemeData.of(context);
    return Center(
      child: FloatingActionButton(
        backgroundColor: theme.colors.primary,
        onPressed: onPressed ?? () {},
        child: child,
      ),
    );
  }
}
