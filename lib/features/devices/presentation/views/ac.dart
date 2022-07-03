import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:smarty/utils/enums.dart';

import '../../../../core/navigation/navigator.dart';
import '../../../../shared/res/res.dart';
import '../../../../shared/widgets/power_btn.dart';
import '../../domain/models/devices.dart';

class AcScreen extends StatefulWidget {
  final Device device;
  AcScreen({Key? key, required this.device})
      : assert(device.type == DeviceType.ac),
        super(key: key);

  @override
  State<AcScreen> createState() => _AcScreenState();
}

class _AcScreenState extends State<AcScreen> {
  double temp = 16.0;

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
                        'Air Conditioner',
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AC',
                        style: TextStyles.headline4
                            .copyWith(color: SmartyColors.grey),
                      ),
                      Text(
                        widget.device.room,
                        style: TextStyles.body
                            .copyWith(color: SmartyColors.grey60),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Temperature',
                        style: TextStyles.body
                            .copyWith(color: SmartyColors.grey60),
                      ),
                      Text(
                        '25°C',
                        style: TextStyles.body
                            .copyWith(color: SmartyColors.grey60),
                      ),
                    ],
                  ),
                ],
              ),
              Center(
                child: SleekCircularSlider(
                  min: 16,
                  max: 31,
                  initialValue: temp,
                  appearance: CircularSliderAppearance(
                    size: 300,
                    customColors: CustomSliderColors(
                      progressBarColor: SmartyColors.primary,
                      trackColor: SmartyColors.grey30,
                      dotColor: SmartyColors.primary,
                    ),
                    customWidths: CustomSliderWidths(
                      progressBarWidth: 8,
                      trackWidth: 8,
                      handlerSize: 16,
                    ),
                  ),
                  onChange: (double value) {
                    setState(() {
                      temp = double.parse(value.toStringAsFixed(1));
                    });
                  },
                  onChangeStart: (double startValue) {
                    // callback providing a starting value (when a pan gesture starts)
                  },
                  onChangeEnd: (double endValue) {
                    // callback providing an ending value (when a pan gesture ends)
                  },
                  innerWidget: (double value) {
                    //This the widget that will show current value
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "cool",
                            style: TextStyles.body
                                .copyWith(color: SmartyColors.grey60),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: temp.floor() <= 16
                                    ? SmartyColors.grey30
                                    : SmartyColors.primary,
                                child: IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: temp.floor() <= 16
                                      ? null
                                      : () {
                                          setState(() {
                                            temp--;
                                          });
                                        },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                "${value.toStringAsFixed(1)}°C",
                                style: TextStyles.headline4.copyWith(
                                  color: SmartyColors.grey80,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 16),
                              CircleAvatar(
                                backgroundColor: temp.round() == 31
                                    ? SmartyColors.grey30
                                    : SmartyColors.primary,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: temp.round() == 31
                                      ? null
                                      : () {
                                          setState(() {
                                            temp++;
                                          });
                                        },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 56),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 27.5, vertical: 6.5),
                            decoration: BoxDecoration(
                              color: SmartyColors.grey10,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(
                              "Auto Adjust",
                              style: TextStyles.subtitle.copyWith(
                                color: SmartyColors.primary,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 62),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 48, vertical: 10),
                      decoration: BoxDecoration(
                        color: SmartyColors.secondary10,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.sunny,
                              color: SmartyColors.primary, size: 32),
                          Icon(Icons.water_drop_outlined,
                              color: SmartyColors.primary, size: 32),
                          Icon(Icons.cloud_rounded,
                              color: SmartyColors.primary, size: 32),
                        ],
                      ),
                    ),
                    const SizedBox(height: 56),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: SmartyColors.secondary10,
                              child: Icon(Icons.wb_sunny,
                                  color: SmartyColors.primary, size: 24),
                            ),
                            Text(
                              "Sleep",
                              style: TextStyles.body.copyWith(
                                color: SmartyColors.grey60,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: SmartyColors.secondary10,
                              child: Icon(Icons.wb_cloudy,
                                  color: SmartyColors.primary, size: 24),
                            ),
                            Text(
                              "Cold",
                              style: TextStyles.body.copyWith(
                                color: SmartyColors.grey60,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: SmartyColors.secondary10,
                              child: Icon(Icons.refresh,
                                  color: SmartyColors.primary, size: 24),
                            ),
                            Text(
                              "Routine",
                              style: TextStyles.body.copyWith(
                                color: SmartyColors.grey60,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
              const ChipButton(
                child: Icon(Icons.power_settings_new_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
