import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/navigation/navigator.dart';

import '../../../../shared/widgets/widgets.dart';
import '../widgets/routine_tile.dart';

class RoutineHomeScreen extends StatelessWidget {
  const RoutineHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = BatThemeData.of(context);
    return SingleChildScrollView(
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
                      style: theme.typography.headline4,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 36.h),
            Text(
              'Active Routines',
              style: theme.typography.bodyCopy,
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
            AppButtonPrimary(
              label: 'Add Routine',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
