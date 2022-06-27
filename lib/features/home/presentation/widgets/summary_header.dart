import 'package:flutter/material.dart';

import '../../../../core/navigation/navigator.dart';
import '../../../../res/res.dart';

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
                style: TextStyles.body.copyWith(color: SmartyColors.tertiary),
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
                    style:
                        TextStyles.body.copyWith(color: SmartyColors.tertiary),
                  ),
                ],
              )
            ],
          ),
          Column(
            children: [
              Text(
                'Humidity',
                style: TextStyles.body.copyWith(color: SmartyColors.tertiary),
              ),
              Row(
                children: [
                  Icon(
                    Icons.water_drop_outlined,
                    size: 24,
                    color: SmartyColors.tertiary,
                  ),
                  Text(
                    '80%',
                    style:
                        TextStyles.body.copyWith(color: SmartyColors.tertiary),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Energy Used',
                style: TextStyles.body.copyWith(color: SmartyColors.tertiary),
              ),
              Row(
                children: [
                  Icon(
                    Icons.lightbulb_outlined,
                    size: 24,
                    color: SmartyColors.tertiary,
                  ),
                  Text(
                    '250 KWh',
                    style:
                        TextStyles.body.copyWith(color: SmartyColors.tertiary),
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
