import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' hide DeviceType;
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:smarty/main.dart';
import '../../../../utils/enums.dart';

import '../../../../core/navigation/navigator.dart';
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
    var theme = BatThemeData.of(context);
    var themeProvider = context.read<ThemeProvider>();
    return Scaffold(
      backgroundColor: theme.colors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.h + MediaQuery.of(context).padding.top),
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
                        style: theme.typography.headline4Medium,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 36.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AC',
                        style: theme.typography.headline4Medium,
                      ),
                      Text(
                        widget.device.room,
                        style: theme.typography.bodyCopy,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Temperature',
                        style: theme.typography.bodyCopy,
                      ),
                      Text(
                        '25°C',
                        style: theme.typography.bodyCopy,
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
                    size: 300.r,
                    customColors: CustomSliderColors(
                      progressBarColor: BatPalette.primary,
                      trackColor: theme.colors.tertiary.withOpacity(0.3),
                      dotColor: BatPalette.primary,
                    ),
                    customWidths: CustomSliderWidths(
                      progressBarWidth: 8.w,
                      trackWidth: 8.w,
                      handlerSize: 16.r,
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
                            "COOL",
                            style: theme.typography.bodyCopy,
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: temp.floor() <= 16
                                    ? theme.colors.tertiary.withOpacity(0.3)
                                    : BatPalette.primary,
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
                              SizedBox(width: 16.w),
                              Text(
                                "${value.toStringAsFixed(1)}°C",
                                style: theme.typography.headline4Medium,
                              ),
                              SizedBox(width: 16.w),
                              CircleAvatar(
                                backgroundColor: temp.round() == 31
                                    ? theme.colors.tertiary.withOpacity(0.3)
                                    : BatPalette.primary,
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
                          SizedBox(height: 56.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 27.5.w, vertical: 6.5.h),
                            decoration: BoxDecoration(
                              color: theme.colors.tertiary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(
                              "Auto Adjust",
                              style: theme.typography.subtitle,
                            ),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 62.w),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 48.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: theme.colors.secondary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.sunny,
                              color: themeProvider.isDark
                                  ? BatPalette.white
                                  : BatPalette.primary,
                              size: 32.w),
                          Icon(Icons.water_drop_outlined,
                              color: themeProvider.isDark
                                  ? BatPalette.white
                                  : BatPalette.primary,
                              size: 32.w),
                          Icon(Icons.cloud_rounded,
                              color: themeProvider.isDark
                                  ? BatPalette.white
                                  : BatPalette.primary,
                              size: 32.w),
                        ],
                      ),
                    ),
                    SizedBox(height: 56.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 24.r,
                              backgroundColor:
                                  theme.colors.secondary.withOpacity(0.1),
                              child: Icon(Icons.wb_sunny,
                                  color: themeProvider.isDark
                                      ? BatPalette.white
                                      : BatPalette.primary,
                                  size: 24.w),
                            ),
                            Text(
                              "Sleep",
                              style: theme.typography.bodyCopy,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 24.r,
                              backgroundColor:
                                  theme.colors.secondary.withOpacity(0.1),
                              child: Icon(Icons.wb_cloudy,
                                  color: themeProvider.isDark
                                      ? BatPalette.white
                                      : BatPalette.primary,
                                  size: 24.w),
                            ),
                            Text(
                              "Cold",
                              style: theme.typography.bodyCopy,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 24.r,
                              backgroundColor:
                                  theme.colors.secondary.withOpacity(0.1),
                              child: Icon(Icons.refresh,
                                  color: themeProvider.isDark
                                      ? BatPalette.white
                                      : BatPalette.primary,
                                  size: 24.w),
                            ),
                            Text(
                              "Routine",
                              style: theme.typography.bodyCopy,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 80.h),
              const ChipButton(
                child: Icon(
                  Icons.power_settings_new_rounded,
                  color: BatPalette.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
