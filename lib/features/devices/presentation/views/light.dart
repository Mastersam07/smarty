import 'package:flutter/material.dart';
import 'package:smarty/utils/enums.dart';

import '../../../../core/navigation/navigator.dart';
import '../../../../res/res.dart';
import '../../domain/models/devices.dart';

class LightScreen extends StatelessWidget {
  final Device device;
  LightScreen({Key? key, required this.device})
      : assert(device.type == DeviceType.light),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32 + MediaQuery.of(context).padding.top),
              Row(
                children: [
                  if (AppNavigator.canPop)
                    GestureDetector(
                      onTap: () => AppNavigator.pop(),
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Light',
                        style: TextStyles.headline4,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Living Room',
                    style:
                        TextStyles.headline4.copyWith(color: SmartyColors.grey),
                  ),
                  Switch.adaptive(
                    value: true,
                    onChanged: (bool v) {},
                    activeColor: SmartyColors.primary,
                  )
                ],
              ),
              Text(
                'Light Intesity',
                style: TextStyles.body.copyWith(color: SmartyColors.grey60),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
