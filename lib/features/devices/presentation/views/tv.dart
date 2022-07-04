import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/widgets/power_btn.dart';

import '../../../../core/navigation/navigator.dart';
import '../../../../shared/res/res.dart';
import '../../../../utils/enums.dart';
import '../../domain/models/devices.dart';

class SmartTvScreen extends StatefulWidget {
  final Device device;
  SmartTvScreen({Key? key, required this.device})
      : assert(device.type == DeviceType.smartTv),
        super(key: key);

  @override
  State<SmartTvScreen> createState() => _SmartTvScreenState();
}

class _SmartTvScreenState extends State<SmartTvScreen> {
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        'Smart TV',
                        style: TextStyles.headline4,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 36.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Smart TV',
                    style:
                        TextStyles.headline4.copyWith(color: SmartyColors.grey),
                  ),
                  Text(
                    'Living Room',
                    style: TextStyles.body.copyWith(color: SmartyColors.grey60),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              Container(
                padding: EdgeInsets.all(24.r),
                decoration: BoxDecoration(
                  color: SmartyColors.grey10,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/icons/netflix.png', width: 28),
                            SizedBox(width: 8.w),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Netflix',
                                  style: TextStyles.body
                                      .copyWith(color: SmartyColors.grey),
                                ),
                                Text(
                                  'Deadline 2022/07/20',
                                  style: TextStyles.subtitle
                                      .copyWith(color: SmartyColors.grey60),
                                )
                              ],
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: SmartyColors.grey60),
                          ),
                          child: Text(
                            'Open App',
                            style: TextStyles.subtitle
                                .copyWith(color: SmartyColors.grey60),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'TV Shows',
                      style: TextStyles.subtitle,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: SmartyColors.primary,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Stack(children: [
                        Image.asset('assets/images/movie.png'),
                        Visibility(
                          visible: !_isOn,
                          child: Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: SmartyColors.black,
                                ),
                                child: Text(
                                  'Off',
                                  style: TextStyles.headline3
                                      .copyWith(color: SmartyColors.tertiary),
                                ),
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                    SizedBox(height: 21.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 19.w),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Stranger Things',
                                style: TextStyles.subtitle,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: SmartyColors.primary,
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.r)),
                            child: LinearProgressIndicator(
                              color: SmartyColors.primary,
                              backgroundColor: SmartyColors.grey10,
                              value: 0.4,
                              minHeight: 8.h,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                // height: 40.h,
                                padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.r),
                                  border:
                                      Border.all(color: SmartyColors.grey30),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      icon: const Icon(
                                          Icons.skip_previous_rounded),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      icon: Icon(_isOn
                                          ? Icons.pause
                                          : Icons.play_arrow_rounded),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      icon: const Icon(Icons.skip_next_rounded),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // height: 40.h,
                                padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.r),
                                  border:
                                      Border.all(color: SmartyColors.grey30),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.volume_up_rounded),
                                    SizedBox(width: 10.w),
                                    Text(
                                      '72%',
                                      style: TextStyles.subtitle
                                          .copyWith(color: SmartyColors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.r),
                                  border:
                                      Border.all(color: SmartyColors.grey30),
                                ),
                                child: Icon(Icons.chat, size: 18.w),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 51.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 48.w,
                    width: 48.w,
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      border: Border.all(color: SmartyColors.grey30),
                    ),
                    child: Icon(
                      Icons.close_rounded,
                      color: SmartyColors.grey60,
                    ),
                  ),
                  Container(
                    height: 48.w,
                    width: 48.w,
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      border: Border.all(color: SmartyColors.grey30),
                    ),
                    child: Icon(
                      Icons.cast_connected_rounded,
                      color: SmartyColors.grey60,
                    ),
                  )
                ],
              ),
              SizedBox(height: 51.h),
              ChipButton(
                child: const Icon(Icons.power_settings_new_rounded),
                onPressed: () {
                  setState(() {
                    _isOn = !_isOn;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
