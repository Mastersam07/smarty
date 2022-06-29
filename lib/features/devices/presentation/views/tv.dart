import 'package:flutter/material.dart';

import '../../../../core/navigation/navigator.dart';
import '../../../../res/res.dart';
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
                        'Smart TV',
                        style: TextStyles.headline4,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 36),
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
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(24),
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
                            const SizedBox(width: 8),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
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
                    const SizedBox(height: 24),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
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
                    const SizedBox(height: 21),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 19),
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
                          const SizedBox(height: 12),
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            child: LinearProgressIndicator(
                              color: SmartyColors.primary,
                              backgroundColor: SmartyColors.grey10,
                              value: 0.4,
                              minHeight: 8,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(color: SmartyColors.grey30),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.skip_previous_rounded)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(_isOn
                                            ? Icons.pause
                                            : Icons.play_arrow_rounded)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.skip_next_rounded)),
                                  ],
                                ),
                              ),
                              Container(
                                height: 40,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(color: SmartyColors.grey30),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.volume_up_rounded),
                                    const SizedBox(width: 10),
                                    Text(
                                      '72%',
                                      style: TextStyles.subtitle
                                          .copyWith(color: SmartyColors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(color: SmartyColors.grey30),
                                ),
                                child: const Icon(Icons.chat, size: 18),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 51),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: SmartyColors.grey30),
                    ),
                    child: Icon(
                      Icons.close_rounded,
                      color: SmartyColors.grey60,
                    ),
                  ),
                  Container(
                    height: 48,
                    width: 48,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: SmartyColors.grey30),
                    ),
                    child: Icon(
                      Icons.cast_connected_rounded,
                      color: SmartyColors.grey60,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 51),
              Center(
                child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        _isOn = !_isOn;
                      });
                    },
                    child: const Icon(Icons.power_settings_new_rounded)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
