import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smarty/core/navigation/navigator.dart';
import 'package:smarty/shared/widgets/power_btn.dart';

import '../../../../shared/res/res.dart';

class RoutineHomeScreen extends StatelessWidget {
  const RoutineHomeScreen({Key? key}) : super(key: key);

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
                        'Routine',
                        style: TextStyles.headline4,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 36.h),
              Text(
                'Active Routines',
                style: TextStyles.body,
              ),
              SizedBox(height: 16.h),
              const RoutineTile(name: 'Wake up', active: true),
              SizedBox(height: 24.h),
              const RoutineTile(name: 'Clean', active: true),
              SizedBox(height: 24.h),
              const RoutineTile(name: 'Laundry'),
              SizedBox(height: 24.h),
              const RoutineTile(name: 'Work'),
              SizedBox(height: 24.h),
              const RoutineTile(name: 'Sleep'),
              SizedBox(height: 24.h),
              const RoutineTile(name: 'Gym'),
              SizedBox(height: 40.h),
              ChipButton(
                onPressed: () {},
                child: Icon(
                  Icons.add,
                  size: 48.w,
                  color: SmartyColors.tertiary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoutineTile extends StatelessWidget {
  final String name;
  final bool active;
  const RoutineTile({
    Key? key,
    required this.name,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: active ? SmartyColors.primary : SmartyColors.grey10,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.sunny,
                size: 24.w,
                color: active ? SmartyColors.tertiary : SmartyColors.grey60,
              ),
              SizedBox(width: 4.w),
              Text(
                name,
                style: TextStyles.body.copyWith(
                    color:
                        active ? SmartyColors.tertiary : SmartyColors.grey60),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '6:00 AM',
                style: TextStyles.subtitle.copyWith(
                    color:
                        active ? SmartyColors.tertiary80 : SmartyColors.grey60),
              ),
              Text(
                '5 Devices',
                style: TextStyles.subtitle.copyWith(
                    color:
                        active ? SmartyColors.tertiary80 : SmartyColors.grey60),
              ),
            ],
          )
        ],
      ),
    );
  }
}
