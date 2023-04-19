import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/models/devices.dart';

import '../../../../core/navigation/navigator.dart';
import '../../../../shared/widgets/widgets.dart';
import '../../../home/presentation/widgets/widgets.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = BatThemeData.of(context);
    return Scaffold(
      backgroundColor: theme.colors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
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
                  Text(
                    'Devices',
                    style: theme.typography.headline4,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                'Living Room',
                style: theme.typography.bodyCopy,
              ),
              SizedBox(height: 16.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [...devices.map((e) => DeviceCard(device: e))],
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Bed Room',
                style: theme.typography.bodyCopy,
              ),
              SizedBox(height: 16.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [...devices.map((e) => DeviceCard(device: e))],
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Kitchen',
                style: theme.typography.bodyCopy,
              ),
              SizedBox(height: 16.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [...devices.map((e) => DeviceCard(device: e))],
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Dining Room',
                style: theme.typography.bodyCopy,
              ),
              SizedBox(height: 16.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [...devices.map((e) => DeviceCard(device: e))],
                ),
              ),
              SizedBox(height: 48.h),
              AppButtonPrimary(
                label: 'Add Device',
                onPressed: () {},
              ),
              SizedBox(height: 64.h),
            ],
          ),
        ),
      ),
    );
  }
}
