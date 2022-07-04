import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/navigation/navigator.dart';
import '../../../devices/domain/models/devices.dart';

import '../../../../shared/res/res.dart';
import '../widgets/chip_tab.dart';
import '../widgets/power_chart.dart';
import '../widgets/stats_tile.dart';
import '../widgets/summary_tile.dart';

class StatsHomeScreen extends StatefulWidget {
  const StatsHomeScreen({Key? key}) : super(key: key);

  @override
  State<StatsHomeScreen> createState() => _StatsHomeScreenState();
}

class _StatsHomeScreenState extends State<StatsHomeScreen>
    with TickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    _controller =
        TabController(length: 4, vsync: this, initialIndex: _selectedIndex);
  }

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
                        'Power Usage',
                        style: TextStyles.headline4,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 36.h),
              Center(
                child: TabBar(
                    controller: _controller,
                    padding: EdgeInsets.zero,
                    indicatorPadding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.symmetric(horizontal: 8.w),
                    isScrollable: true,
                    onTap: (int v) {
                      setState(() {
                        _selectedIndex = v;
                        _controller.index = v;
                      });
                    },
                    indicatorColor: Colors.transparent,
                    tabs: [
                      ChipTab(
                        selectedIndex: _selectedIndex,
                        name: 'Day',
                        index: 0,
                      ),
                      ChipTab(
                        selectedIndex: _selectedIndex,
                        name: 'Week',
                        index: 1,
                      ),
                      ChipTab(
                        selectedIndex: _selectedIndex,
                        name: 'Month',
                        index: 2,
                      ),
                      ChipTab(
                        selectedIndex: _selectedIndex,
                        name: 'Year',
                        index: 3,
                      ),
                    ]),
              ),
              SizedBox(height: 32.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: SmartyColors.secondary10,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Summary for June 2022',
                      style:
                          TextStyles.body.copyWith(color: SmartyColors.grey60),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SummaryTile(
                          title: '2500',
                          subTitle: 'KWh used',
                          icon: Icon(
                            Icons.bolt_outlined,
                            color: SmartyColors.tertiary,
                          ),
                        ),
                        SummaryTile(
                          title: '850',
                          subTitle: 'USD spent',
                          icon: Icon(
                            Icons.currency_pound_sharp,
                            color: SmartyColors.tertiary,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const PowerChart(),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Devices',
                    style: TextStyles.body.copyWith(
                        color: SmartyColors.grey, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Text(
                        'January',
                        style: TextStyles.body.copyWith(
                          color: SmartyColors.grey,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: SmartyColors.grey60,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 25.h),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => SizedBox(height: 24.h),
                  itemBuilder: (context, index) {
                    if (index == devices.length - 1) {
                      return Column(
                        children: [
                          StatTile(device: devices[index]),
                          SizedBox(height: 24.h),
                        ],
                      );
                    }
                    return StatTile(device: devices[index]);
                  },
                  itemCount: devices.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
