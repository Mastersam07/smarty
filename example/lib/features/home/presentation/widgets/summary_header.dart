import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';

import '../../../../core/navigation/navigator.dart';
import '../../../../shared/res/res.dart';

class SummaryHeader extends StatelessWidget {
  const SummaryHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppNavigator.pushNamed(routineRoute),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        decoration: BoxDecoration(
          color: SmartyColors.primary,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            children: [
              Text(
                'Temperature',
                style: BatThemeData.of(context)
                    .typography
                    .bodyCopy
                    .copyWith(color: BatPalette.white),
              ),
              Row(
                children: [
                  Icon(
                    Icons.thermostat,
                    size: 24,
                    color: SmartyColors.tertiary,
                  ),
                  Text(
                    '25°C',
                    style: BatThemeData.of(context)
                        .typography
                        .bodyCopy
                        .copyWith(color: BatPalette.white),
                  ),
                ],
              )
            ],
          ),
          Column(
            children: [
              Text('Humidity',
                  style: BatThemeData.of(context)
                      .typography
                      .bodyCopy
                      .copyWith(color: BatPalette.white)),
              Row(
                children: [
                  Icon(
                    Icons.water_drop_outlined,
                    size: 24,
                    color: SmartyColors.tertiary,
                  ),
                  Text(
                    '80%',
                    style: BatThemeData.of(context)
                        .typography
                        .bodyCopy
                        .copyWith(color: BatPalette.white),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Energy Used',
                style: BatThemeData.of(context)
                    .typography
                    .bodyCopy
                    .copyWith(color: BatPalette.white),
              ),
              Row(
                children: [
                  Icon(
                    Icons.bolt_sharp,
                    size: 24,
                    color: SmartyColors.tertiary,
                  ),
                  Text(
                    '250 KWh',
                    style: BatThemeData.of(context)
                        .typography
                        .bodyCopy
                        .copyWith(color: BatPalette.white),
                  ),
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
