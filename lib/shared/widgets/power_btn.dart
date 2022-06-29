import 'package:flutter/material.dart';

class PowerButton extends StatelessWidget {
  final Function()? onPressed;
  const PowerButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FloatingActionButton(
          onPressed: onPressed ?? () {},
          child: const Icon(Icons.power_settings_new_rounded)),
    );
  }
}
