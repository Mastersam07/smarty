import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/navigation/navigator.dart';
import '../../../../shared/res/res.dart';
import '../widgets/settings_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

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
                        'Settings',
                        style: TextStyles.headline4,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              const SettingsTile(title: 'Personal information'),
              const SettingsTile(title: 'Account and security'),
              const SettingsTile(title: 'App Notification'),
              const SettingsTile(title: 'Activate Safe Mode'),
              SettingsTile(
                title: 'Dark Mode',
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Off', style: TextStyles.body),
                    SizedBox(width: 8.w),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                  ],
                ),
              ),
              const SettingsTile(title: 'Temperature Unit'),
              const SettingsTile(title: 'Privacy Settings'),
            ],
          ),
        ),
      ),
    );
  }
}
