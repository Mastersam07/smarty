import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/navigation/navigator.dart';
import '../../../../shared/widgets/power_btn.dart';

import '../../../../shared/res/res.dart';
import '../widgets/routine_tile.dart';

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
